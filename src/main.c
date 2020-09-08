/*******************************************************************************
 *   Waves Platform Wallet App for Nano Ledger devices
 *   Copyright (c) 2017-2020 Sergey Tolmachev (Tolsi) <tolsi.ru@gmail.com>
 *
 *   Based on Sample code provided (c) 2016 Ledger and
 *                                 (c) 2017-2018 Jake B. (Burstcoin app)
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 ********************************************************************************/

#include <stdbool.h>

#include "main.h"
#include "crypto/waves.h"
#include "crypto/ledger_crypto.h"
#include "os_io_seproxyhal.h"

// Ledger Stuff
#include "ui/ui.h"
#include "os.h"
#include "cx.h"
#include "os_io_seproxyhal.h"

// Temporary area to store stuff and reuse the same memory
tmpContext_t tmp_ctx;

// Non-volatile storage for the wallet app's stuff
internal_storage_t const N_storage_real;

// SPI Buffer for io_event
unsigned char G_io_seproxyhal_spi_buffer[IO_SEPROXYHAL_BUFFER_SIZE_B];

#if !defined(TARGET_NANOS) && !defined(TARGET_BLUE) && !defined(TARGET_NANOX)
#error This application only supports the Ledger Nano S, Nano X and the Ledger Blue
#endif

unsigned short io_exchange_al(unsigned char channel, unsigned short tx_len) {
  switch (channel & ~(IO_FLAGS)) {
  case CHANNEL_KEYBOARD:
    break;

  // multiplexed io exchange over a SPI channel and TLV encapsulated protocol
  case CHANNEL_SPI:
    if (tx_len) {
      io_seproxyhal_spi_send(G_io_apdu_buffer, tx_len);

      if (channel & IO_RESET_AFTER_REPLIED) {
        reset();
      }
      return 0; // nothing received from the master so far (it's a tx
                // transaction)
    } else {
      return io_seproxyhal_spi_recv(G_io_apdu_buffer, sizeof(G_io_apdu_buffer),
                                    0);
    }

  default:
    THROW(INVALID_PARAMETER);
  }
  return 0;
}

uint32_t deserialize_uint32_t(unsigned char *buffer) {
  uint32_t value = 0;

  value |= buffer[0] << 24;
  value |= buffer[1] << 16;
  value |= buffer[2] << 8;
  value |= buffer[3];
  return value;
}

// 20 bytes total
void read_path_from_bytes(unsigned char *buffer, uint32_t *path) {
  path[0] = deserialize_uint32_t(buffer);
  path[1] = deserialize_uint32_t(buffer + 4);
  path[2] = deserialize_uint32_t(buffer + 8);
  path[3] = deserialize_uint32_t(buffer + 12);
  path[4] = deserialize_uint32_t(buffer + 16);
}

void hash_stream_data(uint8_t chunk_data_size, uint8_t chunk_data_start_index) {
  uint32_t chunk_data_left =
      chunk_data_size - tmp_ctx.signing_context.chunk_used;
  uint32_t data_read_left =
      tmp_ctx.signing_context.data_size - tmp_ctx.signing_context.data_read;
  if (tmp_ctx.signing_context.data_read == 0) {
    chunk_data_left -= tmp_ctx.signing_context.sign_from;
    data_read_left -= tmp_ctx.signing_context.sign_from;
    tmp_ctx.signing_context.chunk_used += tmp_ctx.signing_context.sign_from;
  }
  uint32_t step_read_bytes_left = MIN(chunk_data_left, data_read_left);
  // stream_eddsa_sign_step2 and stream_eddsa_sign_step4 are the same
  stream_eddsa_sign_step2(&tmp_ctx.signing_context.eddsa_context,
                          &G_io_apdu_buffer[chunk_data_start_index +
                                            tmp_ctx.signing_context.chunk_used],
                          step_read_bytes_left);
  tmp_ctx.signing_context.data_read += step_read_bytes_left;
  tmp_ctx.signing_context.chunk_used += step_read_bytes_left;
}

// Handle a signing request -- called both from the main apdu loop as well as
// from the button handler after the user verifies the transaction.

void make_sign_step(uint8_t chunk_data_start_index, uint8_t chunk_data_size) {
  if (tmp_ctx.signing_context.step == 1) {
    cx_ecfp_public_key_t public_key;
    cx_ecfp_private_key_t private_key;
    get_keypair_by_path((uint32_t *)tmp_ctx.signing_context.bip32, &public_key,
                        &private_key);
    stream_eddsa_sign_step1(&tmp_ctx.signing_context.eddsa_context,
                            &private_key);
    public_key_le_to_be(&public_key);
    tmp_ctx.signing_context.sign_bit = public_key.W[31] & 0x80;
    os_memset(&private_key, 0, sizeof(cx_ecfp_private_key_t));
    os_memset(&public_key, 0, sizeof(cx_ecfp_public_key_t));
    tmp_ctx.signing_context.step = 2;
  } else if (tmp_ctx.signing_context.step == 2) {
    if (tmp_ctx.signing_context.data_read < tmp_ctx.signing_context.data_size) {
      hash_stream_data(chunk_data_size, chunk_data_start_index);
    } else {
      stream_eddsa_sign_step3(&tmp_ctx.signing_context.eddsa_context);
      tmp_ctx.signing_context.step = 4;
      tmp_ctx.signing_context.data_read = 0;
    }
  } else if (tmp_ctx.signing_context.step == 4) {
    if (tmp_ctx.signing_context.data_read < tmp_ctx.signing_context.data_size) {
      hash_stream_data(chunk_data_size, chunk_data_start_index);
      // not call make_sign_step() because tmp_ctx.signing_context.chunk_used <
      // chunk_data_size will be false
      if (tmp_ctx.signing_context.data_read ==
          tmp_ctx.signing_context.data_size) {
        tmp_ctx.signing_context.step = 5;
        return;
      }
    }
  }
}
void make_allowed_sign_steps() {
  uint8_t chunk_data_start_index = 5;
  uint8_t chunk_data_size = G_io_apdu_buffer[4];

  if (tmp_ctx.signing_context.chunk == 0) {
    chunk_data_start_index += 29;
    chunk_data_size -= 29;

    // then there is the bip32 path in the first chunk - first 20 bytes of data
    read_path_from_bytes(G_io_apdu_buffer + 5,
                         (uint32_t *)tmp_ctx.signing_context.bip32);

    tmp_ctx.signing_context.amount_decimals = G_io_apdu_buffer[25];
    tmp_ctx.signing_context.amount2_decimals = G_io_apdu_buffer[26];
    tmp_ctx.signing_context.fee_decimals = G_io_apdu_buffer[27];
    tmp_ctx.signing_context.data_type = G_io_apdu_buffer[28];
    tmp_ctx.signing_context.data_version = G_io_apdu_buffer[29];
    tmp_ctx.signing_context.data_size =
        deserialize_uint32_t(&G_io_apdu_buffer[30]); 
    // getting message type based on tx type and varsion
    tmp_ctx.signing_context.message_type = getMessageType();
    if(tmp_ctx.signing_context.amount_decimals < 0 || tmp_ctx.signing_context.amount_decimals > 8 ) {
      THROW(SW_INCORRECT_PRECISION_VALUE);
    }
    if(tmp_ctx.signing_context.amount2_decimals < 0 || tmp_ctx.signing_context.amount2_decimals > 8) {
      THROW(SW_INCORRECT_PRECISION_VALUE);
    }
  }

  while (tmp_ctx.signing_context.chunk_used < chunk_data_size &&
         tmp_ctx.signing_context.step < 5) {
    make_sign_step(chunk_data_start_index, chunk_data_size);
  }
  // else wait for next chunk
}

// like
// https://github.com/lenondupe/ledger-app-stellar/blob/master/src/main.c#L1784
uint32_t set_result_sign() {
  tmp_ctx.signing_context.signature[63] |= tmp_ctx.signing_context.sign_bit;
  os_memmove((char *)G_io_apdu_buffer, tmp_ctx.signing_context.signature,
             sizeof(tmp_ctx.signing_context.signature));

  PRINTF("Signature:\n%.*H\n", 64, tmp_ctx.signing_context.signature);

  init_context();

  return 64;
}

uint32_t set_result_get_address() {
  os_memmove((char *)G_io_apdu_buffer,
             (char *)tmp_ctx.address_context.public_key, 32);
  os_memmove((char *)G_io_apdu_buffer + 32,
             (char *)tmp_ctx.address_context.address, 35);
  init_context();
  return 67;
}

uint32_t set_result_get_app_configuration() {
  G_io_apdu_buffer[0] = LEDGER_MAJOR_VERSION;
  G_io_apdu_buffer[1] = LEDGER_MINOR_VERSION;
  G_io_apdu_buffer[2] = LEDGER_PATCH_VERSION;
  return 3;
}

// Called by both the U2F and the standard communications channel
void handle_apdu(volatile unsigned int *flags, volatile unsigned int *tx,
                 volatile unsigned int rx) {
  unsigned short sw = 0;
  BEGIN_TRY {
    TRY {

      if (os_global_pin_is_validated() == 0) {
        THROW(SW_DEVICE_IS_LOCKED);
      }

      if (G_io_apdu_buffer[0] != CLA) {
        THROW(SW_CLA_NOT_SUPPORTED);
      }

      switch (G_io_apdu_buffer[1]) {
      case INS_SIGN: {
        if (G_io_apdu_buffer[4] != rx - 5) {
          // the length of the APDU should match what's in the 5-byte header.
          // If not fail.  Don't want to buffer overrun or anything.
          THROW(SW_CONDITIONS_NOT_SATISFIED);
        }
        if ((G_io_apdu_buffer[2] != P1_MORE) &&
            (G_io_apdu_buffer[2] != P1_LAST)) {
          THROW(SW_INCORRECT_P1_P2);
        }
        if (tmp_ctx.signing_context.step <= 5) {
          if (tmp_ctx.signing_context.step > 0) {
            tmp_ctx.signing_context.chunk += 1;
          } else {
            PRINTF("make_sign_steps start\n");
            show_processing();
            tmp_ctx.signing_context.step = 1;
            tmp_ctx.signing_context.network_byte = G_io_apdu_buffer[3];
          }
          tmp_ctx.signing_context.chunk_used = 0;
          make_allowed_sign_steps();
          if (tmp_ctx.signing_context.step == 5) {
            stream_eddsa_sign_step5(&tmp_ctx.signing_context.eddsa_context,
                                    tmp_ctx.signing_context.signature);
            tmp_ctx.signing_context.step = 6;
            PRINTF("make_sign_steps end\n");
            os_memset(&tmp_ctx.signing_context.ui, 0,
                      sizeof(tmp_ctx.signing_context.ui));
            cx_blake2b_init(&tmp_ctx.signing_context.ui.hash_ctx, 256);
          } else {
            THROW(SW_OK);
            // wait for next chunk for sign
          }
        }
        if (G_io_apdu_buffer[2] == P1_LAST) {
          make_allowed_ui_steps(true);
          if (tmp_ctx.signing_context.step != 8) {
            THROW(SW_DEPRECATED_SIGN_PROTOCOL);
          }
        } else {
          make_allowed_ui_steps(false);
        }
        // all data parsed and prepeared to view
        if (tmp_ctx.signing_context.step == 8) { 
          size_t length = 45;
          if (!b58enc((char *)tmp_ctx.signing_context.first_data_hash, &length,
                      (const void *)&tmp_ctx.signing_context.first_data_hash,
                      32)) {
            THROW(SW_CONDITIONS_NOT_SATISFIED);
          }
          // convert sender public key to address
          waves_public_key_to_address(tmp_ctx.signing_context.ui.from,
                                      tmp_ctx.signing_context.network_byte,
                                      tmp_ctx.signing_context.ui.from);
          // if transaction has from field and it is pubkey hash will convert to
          // address
          if (tmp_ctx.signing_context.message_type == PROTOBUF_DATA) {
            show_sign_protobuf_ui();
          } else {
            show_sign_ui();
          }
          *flags |= IO_ASYNCH_REPLY;
        }
        THROW(SW_OK);
      } break;

      case INS_GET_PUBLIC_KEY: {
        if (G_io_apdu_buffer[4] != rx - 5 || G_io_apdu_buffer[4] != 20) {
          // the length of the APDU should match what's in the 5-byte header.
          // If not fail.  Don't want to buffer overrun or anything.
          THROW(SW_CONDITIONS_NOT_SATISFIED);
        }

        init_context();

        // Get the public key and return it.
        cx_ecfp_public_key_t public_key;

        uint32_t path[5];
        read_path_from_bytes(G_io_apdu_buffer + 5, path);

        if (!get_curve25519_public_key_for_path(path, &public_key)) {
          THROW(INVALID_PARAMETER);
        }

        unsigned char address[35];
        waves_public_key_to_address(public_key.W, G_io_apdu_buffer[3], address);

        os_memmove((char *)tmp_ctx.address_context.public_key, public_key.W,
                   32);
        os_memmove((char *)tmp_ctx.address_context.address, address, 35);
        // term byte for string shown
        tmp_ctx.address_context.address[35] = '\0';

        if (G_io_apdu_buffer[2] == P1_NON_CONFIRM) {
          *tx = set_result_get_address();
          THROW(SW_OK);
        } else {
          *flags |= IO_ASYNCH_REPLY;
          menu_address_init();
        }
      } break;

      case INS_GET_APP_CONFIGURATION:
        *tx = set_result_get_app_configuration();
        THROW(SW_OK);
        break;

      default:
        // Instruction not supported
        THROW(SW_INS_NOT_SUPPORTED);
        break;
      }
    }
    CATCH(EXCEPTION_IO_RESET) { THROW(EXCEPTION_IO_RESET); }
    CATCH_OTHER(e) {
      switch (e & 0xF000) {
      case 0x6000:
        sw = e;
        break;
      case 0x9000:
        // All is well
        sw = e;
        break;
      default:
        // Internal error
        sw = 0x6800 | (e & 0x7FF);
        break;
      }
      // Unexpected exception => report
      if (sw != 0x9000) {
        init_context();
        ui_idle();
      }
      G_io_apdu_buffer[*tx] = sw >> 8;
      G_io_apdu_buffer[*tx + 1] = sw;
      PRINTF("SW:\n%.*H\n", 2, G_io_apdu_buffer + *tx);
      *tx += 2;
    }
    FINALLY {}
    END_TRY;
  }
}

void init_context() { os_memset(&tmp_ctx, 0, sizeof(tmp_ctx)); }

static void waves_main(void) {
  volatile unsigned int rx = 0;
  volatile unsigned int tx = 0;
  volatile unsigned int flags = 0;

  // next timer callback in 500 ms
  UX_CALLBACK_SET_INTERVAL(500);

  // DESIGN NOTE: the bootloader ignores the way APDU are fetched. The only
  // goal is to retrieve APDU.
  // When APDU are to be fetched from multiple IOs, like NFC+USB+BLE, make
  // sure the io_event is called with a
  // switch event, before the apdu is replied to the bootloader. This avoid
  // APDU injection faults.
  for (;;) {
    volatile unsigned short sw = 0;

    BEGIN_TRY {
      TRY {
        rx = tx;
        tx = 0; // ensure no race in catch_other if io_exchange throws
                // an error
        rx = io_exchange(CHANNEL_APDU | flags, rx);
        flags = 0;

        // no apdu received, well, reset the session, and reset the
        // bootloader configuration
        if (rx == 0) {
          THROW(SW_SECURITY_STATUS_NOT_SATISFIED);
        }

        PRINTF("New APDU received:\n%.*H\n", rx, G_io_apdu_buffer);

        // Call the Apdu handler,
        handle_apdu(&flags, &tx, rx);
      }
      CATCH(EXCEPTION_IO_RESET) { THROW(EXCEPTION_IO_RESET); }
      CATCH_OTHER(e) {
        switch (e & 0xF000) {
        case 0x6000:
        case 0x9000:
          sw = e;
          break;
        default:
          sw = 0x6800 | (e & 0x7FF);
          break;
        }
        // Unexpected exception => report
        G_io_apdu_buffer[tx] = sw >> 8;
        G_io_apdu_buffer[tx + 1] = sw;
        tx += 2;
      }
      FINALLY {}
    }
    END_TRY;
  }

  return;
}

void io_seproxyhal_display(const bagl_element_t *element) {
  io_seproxyhal_display_default((bagl_element_t *)element);
}

unsigned char io_event(unsigned char channel) {
  // nothing done with the event, throw an error on the transport layer if
  // needed
  // can't have more than one tag in the reply, not supported yet.
  switch (G_io_seproxyhal_spi_buffer[0]) {
  case SEPROXYHAL_TAG_FINGER_EVENT:
    UX_FINGER_EVENT(G_io_seproxyhal_spi_buffer);
    break;

  case SEPROXYHAL_TAG_BUTTON_PUSH_EVENT: // for Nano S
    UX_BUTTON_PUSH_EVENT(G_io_seproxyhal_spi_buffer);
    break;

  case SEPROXYHAL_TAG_DISPLAY_PROCESSED_EVENT:
    UX_DISPLAYED_EVENT({});
    break;

  case SEPROXYHAL_TAG_TICKER_EVENT:
    UX_TICKER_EVENT(G_io_seproxyhal_spi_buffer, {
      if (ux_step_count && UX_ALLOWED) {
        // prepare next screen
        ux_step = (ux_step + 1) % ux_step_count;
        // redisplay screen
        UX_REDISPLAY();
      }
    });
    break;

  // unknown events are acknowledged
  default:
    UX_DEFAULT_EVENT();
    break;
  }

  // close the event if not done previously (by a display or whatever)
  if (!io_seproxyhal_spi_is_status_sent()) {
    io_seproxyhal_general_status();
  }

  // command has been processed, DO NOT reset the current APDU transport
  return 1;
}

void app_exit(void) {
  BEGIN_TRY_L(exit) {
    TRY_L(exit) { os_sched_exit(-1); }
    FINALLY_L(exit) {}
  }
  END_TRY_L(exit);
}

__attribute__((section(".boot"))) int main(void) {
  // exit critical section
  __asm volatile("cpsie i");

  // ensure exception will work as planned
  os_boot();

  for (;;) {
    UX_INIT();
    ui_state = UI_IDLE;
    BEGIN_TRY {
      TRY {

        io_seproxyhal_init();

#ifdef TARGET_NANOX
        // grab the current plane mode setting
        G_io_app.plane_mode = os_setting_get(OS_SETTING_PLANEMODE, NULL, 0);
#endif // TARGET_NANOX

        init_context();

        if (N_storage.initialized != 0x01) {
          internal_storage_t storage;
          storage.fido_transport = 0x00;
          storage.initialized = 0x01;
          nvm_write(&N_storage, (void *)&storage, sizeof(internal_storage_t));
        }

        USB_power(0);
        USB_power(1);

        ui_idle();

#ifdef HAVE_BLE
        BLE_power(0, NULL);
        BLE_power(1, "Nano X");
#endif // HAVE_BLE

        // set menu bar colour for blue
#if defined(TARGET_BLUE)
        UX_SET_STATUS_BAR_COLOR(COLOR_BG_1, COLOR_APP);
#endif // #if TARGET_ID

        waves_main();
      }
      CATCH(EXCEPTION_IO_RESET) {
        // reset IO and UX before continuing
        CLOSE_TRY;
        continue;
      }
      CATCH_ALL {
        CLOSE_TRY;
        break;
      }
      FINALLY {}
    }
    END_TRY;
  }
  app_exit();
  return 0;
}