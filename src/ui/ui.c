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

#include "ui.h"
#include <stdbool.h>
#include "../glyphs.h"
#include "../main.h"
#include "../crypto/waves.h"
#include "transactions/transfer.h"
#include "transactions/protobuf.h"
#include "cx.h"

#ifdef TARGET_BLUE
#include "blue/ui_menus_blue.h"
#include "blue/ui_menus_blue_prepro.h"
ux_state_t ux;
#else
#include "nanox/ui_menus_nanox.h"
#include "ux.h"
ux_state_t G_ux;
bolos_ux_params_t G_ux_params;
#endif

// UI currently displayed
enum UI_STATE ui_state;

int ux_step, ux_step_count;

void menu_address_init() {
  ux_step = 0;
  ux_step_count = 2;
#if defined(TARGET_BLUE)
  UX_DISPLAY(ui_address_blue, ui_address_blue_prepro);
#else
  ux_flow_init(0, ux_display_address_flow, NULL);
#endif // #if TARGET_ID
}

// Idle state, sow the menu
void ui_idle() {
  ux_step = 0;
  ux_step_count = 0;
  ui_state = UI_IDLE;
#if defined(TARGET_BLUE)
  UX_DISPLAY(ui_idle_blue, ui_idle_blue_prepro);
#else
  // reserve a display stack slot if none yet
  if (G_ux.stack_count == 0) {
    ux_stack_push();
  }
  ux_flow_init(0, ux_idle_flow, NULL);
#endif // #if TARGET_ID
}

void try_to_fill_buffer(uint8_t chunk_data_start_index,
                        uint8_t chunk_data_size) {
  uint32_t chunk_data_left =
      chunk_data_size - tmp_ctx.signing_context.ui.byte.chunk_used;
  uint32_t step_read_bytes_left =
      MIN(chunk_data_left, tmp_ctx.signing_context.ui.byte.wait_in_buffer);
  if (tmp_ctx.signing_context.ui.byte.wait_in_buffer <= 0 ||
      chunk_data_start_index + tmp_ctx.signing_context.ui.byte.chunk_used >
          150) {
    return THROW(EXCEPTION_OVERFLOW);
  }
  os_memmove((unsigned char *)&tmp_ctx.signing_context.ui.byte
                 .buffer[tmp_ctx.signing_context.ui.byte.buffer_used],
             &G_io_apdu_buffer[chunk_data_start_index +
                               tmp_ctx.signing_context.ui.byte.chunk_used],
             step_read_bytes_left);
  tmp_ctx.signing_context.ui.byte.chunk_used += step_read_bytes_left;
  tmp_ctx.signing_context.ui.byte.buffer_used += step_read_bytes_left;
  tmp_ctx.signing_context.ui.byte.wait_in_buffer -= step_read_bytes_left;
}

void build_other_data_ui() {
  unsigned char tx_type = tmp_ctx.signing_context.data_type;
  // just one step here
  os_memmove(&tmp_ctx.signing_context.ui.line2, &"Transaction Id\0", 15);
  if (tx_type == 3) {
    os_memmove(&tmp_ctx.signing_context.ui.line1, &"issue\0", 6);
  } else if (tx_type == 4) {
    os_memmove(&tmp_ctx.signing_context.ui.line1, &"transfer\0", 9);
  } else if (tx_type == 5) {
    os_memmove(&tmp_ctx.signing_context.ui.line1, &"reissue\0", 8);
  } else if (tx_type == 6) {
    os_memmove(&tmp_ctx.signing_context.ui.line1, &"burn\0", 5);
  } else if (tx_type == 8) {
    os_memmove(&tmp_ctx.signing_context.ui.line1, &"start leasing\0", 14);
  } else if (tx_type == 9) {
    os_memmove(&tmp_ctx.signing_context.ui.line1, &"cancel leasing\0", 15);
  } else if (tx_type == 10) {
    os_memmove(&tmp_ctx.signing_context.ui.line2, &"Transaction Hash\0", 17);
    os_memmove(&tmp_ctx.signing_context.ui.line1, &"creating an alias\0", 18);
  } else if (tx_type == 11) {
    os_memmove(&tmp_ctx.signing_context.ui.line1, &"mass transfer\0", 14);
  } else if (tx_type == 12) {
    os_memmove(&tmp_ctx.signing_context.ui.line1, &"data\0", 5);
  } else if (tx_type == 13) {
    os_memmove(&tmp_ctx.signing_context.ui.line1, &"set script\0", 11);
  } else if (tx_type == 14) {
    os_memmove(&tmp_ctx.signing_context.ui.line1, &"sponsorship\0", 12);
  } else if (tx_type == 15) {
    os_memmove(&tmp_ctx.signing_context.ui.line1, &"asset script\0", 13);
  } else if (tx_type == 16) {
    os_memmove(&tmp_ctx.signing_context.ui.line1, &"script invocation\0", 18);
  } else if (tx_type == 17) {
    os_memmove(&tmp_ctx.signing_context.ui.line1, &"update asset info\0", 18);
  } else if (tx_type > 200) {
    // type byte >200 are 'reserved', it will not be signed
    os_memmove(&tmp_ctx.signing_context.ui.line2, &"Hash\0", 5);
    if (tx_type == 252) {
      os_memmove(&tmp_ctx.signing_context.ui.line1, &"order\0", 6);
    } else if (tx_type == 253) {
      os_memmove(&tmp_ctx.signing_context.ui.line1, &"data\0", 5);
    } else if (tx_type == 254) {
      os_memmove(&tmp_ctx.signing_context.ui.line1, &"request\0", 8);
    } else if (tx_type == 255) {
      os_memmove(&tmp_ctx.signing_context.ui.line1, &"message\0", 8);
    } else {
      os_memmove(&tmp_ctx.signing_context.ui.line1, &"something\0", 10);
    }
  }

  if (strlen((const char *)tmp_ctx.signing_context.ui.line1) == 0) {
    os_memmove(&tmp_ctx.signing_context.ui.line1, &"transaction\0", 12);
  }

  // Get the public key and return it.
  cx_ecfp_public_key_t public_key;

  if (!get_curve25519_public_key_for_path(
          (uint32_t *)tmp_ctx.signing_context.bip32, &public_key)) {
    THROW(INVALID_PARAMETER);
  }

  os_memmove(&tmp_ctx.signing_context.ui.from, public_key.W, 32);
  tmp_ctx.signing_context.ui.finished = true;
}

// getting message type based on tx type and version
int getMessageType() {
  unsigned char tx_type = tmp_ctx.signing_context.data_type;
  unsigned char tx_ver = tmp_ctx.signing_context.data_version;
  // just one step here
  if (tx_type == 3) {
    if (tx_ver <= 2) {
      return BYTE_DATA;
    } else if (tx_ver >= 3) {
      return PROTOBUF_DATA;
    }
  } else if (tx_type == 4) {
    if (tx_ver <= 2) {
      return BYTE_DATA;
    } else if (tx_ver >= 3) {
      return PROTOBUF_DATA;
    }
  } else if (tx_type == 5) {
    if (tx_ver <= 2) {
      return BYTE_DATA;
    } else if (tx_ver >= 3) {
      return PROTOBUF_DATA;
    }
  } else if (tx_type == 6) {
    if (tx_ver <= 2) {
      return BYTE_DATA;
    } else if (tx_ver >= 3) {
      return PROTOBUF_DATA;
    }
  } else if (tx_type == 8) {
    if (tx_ver <= 2) {
      return BYTE_DATA;
    } else if (tx_ver >= 3) {
      return PROTOBUF_DATA;
    }
  } else if (tx_type == 9) {
    if (tx_ver <= 2) {
      return BYTE_DATA;
    } else if (tx_ver >= 3) {
      return PROTOBUF_DATA;
    }
  } else if (tx_type == 10) {
    if (tx_ver <= 2) {
      return BYTE_DATA;
    } else if (tx_ver >= 3) {
      return PROTOBUF_DATA;
    }
  } else if (tx_type == 11) {
    if (tx_ver == 1) {
      return BYTE_DATA;
    } else if (tx_ver >= 2) {
      return PROTOBUF_DATA;
    }
  } else if (tx_type == 12) {
    if (tx_ver == 1) {
      return BYTE_DATA;
    } else if (tx_ver >= 2) {
      return PROTOBUF_DATA;
    }
  } else if (tx_type == 13) {
    if (tx_ver == 1) {
      return BYTE_DATA;
    } else if (tx_ver >= 2) {
      return PROTOBUF_DATA;
    }
  } else if (tx_type == 14) {
    if (tx_ver == 1) {
      return BYTE_DATA;
    } else if (tx_ver >= 2) {
      return PROTOBUF_DATA;
    }
  } else if (tx_type == 15) {
    if (tx_ver == 1) {
      return BYTE_DATA;
    } else if (tx_ver >= 2) {
      return PROTOBUF_DATA;
    }
  } else if (tx_type == 16) {
    if (tx_ver == 1) {
      return BYTE_DATA;
    } else if (tx_ver >= 2) {
      return PROTOBUF_DATA;
    }
  } else if (tx_type == 17) {
    return PROTOBUF_DATA;
  } else if (tx_type > 200) {
    if (tx_type == 252) {
      if (tx_ver <= 3) {
        return BYTE_DATA;
      } else if (tx_ver >= 4) {
        return PROTOBUF_DATA;
      }
    } else if (tx_type == 253) {
      return BYTE_DATA;
    } else if (tx_type == 254) {
      return BYTE_DATA;
    } else if (tx_type == 255) {
      return BYTE_DATA;
    } else {
      return BYTE_DATA;
    }
  }
  THROW(SW_INCORRECT_TRANSACTION_TYPE_VERSION);
}

void make_allowed_ui_steps(bool is_last) {
  uint8_t start_index;
  uint8_t chunk_size;
  PRINTF("make_allowed_ui_steps start\n");
  if (tmp_ctx.signing_context.message_type == PROTOBUF_DATA) { // if protobuf
    if (is_last && G_io_apdu_buffer[4] == tmp_ctx.signing_context.chunk_used &&
        tmp_ctx.signing_context.step == 6) {
      THROW(SW_DEPRECATED_SIGN_PROTOCOL);
    }
    if (tmp_ctx.signing_context.ui.finished != true) {
      start_index = 5 + tmp_ctx.signing_context.chunk_used;
      chunk_size = G_io_apdu_buffer[4] - tmp_ctx.signing_context.chunk_used;
      if (tmp_ctx.signing_context.chunk == 0) {
        start_index += 29;
        chunk_size -= 29;
      }
      if (tmp_ctx.signing_context.data_type == 252) {
        if (tmp_ctx.signing_context.step == 6) {
          build_protobuf_order(&tmp_ctx.signing_context.ui.proto,
                               G_io_apdu_buffer + start_index, chunk_size,
                               tmp_ctx.signing_context.data_size, start_index);
          os_memset(&tmp_ctx.signing_context.ui.proto.data, 0, 64);
          cx_hash(&tmp_ctx.signing_context.ui.hash_ctx.header, CX_LAST, NULL, 0,
                  tmp_ctx.signing_context.ui.proto.data, 32);
          // check view data eq to signed data
          if (os_memcmp(&tmp_ctx.signing_context.first_data_hash,
                        &tmp_ctx.signing_context.ui.proto.data, 32) != 0) {
            THROW(SW_SIGN_DATA_NOT_MATCH);
          }
        }
        //not parse 4 tx data because no child message in order proto message
        if (is_last) {
          tmp_ctx.signing_context.step = 8;
          tmp_ctx.signing_context.ui.finished = true;
          return;
        } else {
          THROW(SW_OK);
        }
        
      } else {
        build_protobuf_root_tx(&tmp_ctx.signing_context.ui.proto,
                               G_io_apdu_buffer + start_index, chunk_size,
                               tmp_ctx.signing_context.data_size, start_index);
        os_memset(&tmp_ctx.signing_context.ui.proto.data, 0, 64);
        cx_hash(&tmp_ctx.signing_context.ui.hash_ctx.header, CX_LAST, NULL, 0,
                tmp_ctx.signing_context.ui.proto.data, 32);
        // check view data eq to signed data
        if (os_memcmp(&tmp_ctx.signing_context.first_data_hash,
                      &tmp_ctx.signing_context.ui.proto.data, 32) != 0) {
          THROW(SW_SIGN_DATA_NOT_MATCH);
        }
        os_memset(&tmp_ctx.signing_context.ui.proto, 0,
                  sizeof(tmp_ctx.signing_context.ui.proto));
        os_memset(&tmp_ctx.signing_context.ui.hash_ctx, 0,
                  sizeof(tmp_ctx.signing_context.ui.hash_ctx));
        cx_blake2b_init(&tmp_ctx.signing_context.ui.hash_ctx, 256);
        build_protobuf_child_tx(
            &tmp_ctx.signing_context.ui.proto,
            G_io_apdu_buffer + 5 + tmp_ctx.signing_context.sign_from,
            G_io_apdu_buffer[4] - tmp_ctx.signing_context.sign_from,
            tmp_ctx.signing_context.data_size);
      }
      os_memset(&tmp_ctx.signing_context.ui.proto.data, 0, 64);
      cx_hash(&tmp_ctx.signing_context.ui.hash_ctx.header, CX_LAST, NULL, 0,
              tmp_ctx.signing_context.ui.proto.data, 32);
      // check view data eq to signed data
      if (os_memcmp(&tmp_ctx.signing_context.first_data_hash,
                    &tmp_ctx.signing_context.ui.proto.data, 32) != 0) {
        THROW(SW_SIGN_DATA_NOT_MATCH);
      }
    } else {
      THROW(SW_INS_NOT_SUPPORTED);
    }
  } else {
    if (tmp_ctx.signing_context.ui.byte.step == 0 &&
        tmp_ctx.signing_context.step == 6) {
      if (is_last &&
          G_io_apdu_buffer[4] == tmp_ctx.signing_context.chunk_used) {
        THROW(SW_DEPRECATED_SIGN_PROTOCOL);
      }
      start_index = tmp_ctx.signing_context.chunk_used;
      // if all data in one apdu move start index on 29 bytes to skip options
      // data
      if (tmp_ctx.signing_context.chunk == 0) {
        start_index += 29;
      }
    } else {
      start_index = tmp_ctx.signing_context.ui.byte.chunk_used;
    }
    if (tmp_ctx.signing_context.step == 6) {
      if (tmp_ctx.signing_context.data_type == 4) {
        uint8_t chunk_data_size = G_io_apdu_buffer[4];
        while (
            (chunk_data_size - tmp_ctx.signing_context.ui.byte.chunk_used > 0 &&
             tmp_ctx.signing_context.ui.byte.step < 15) ||
            (tmp_ctx.signing_context.ui.byte.step == 15 &&
             !tmp_ctx.signing_context.ui.finished)) {
          build_transfer_ui_step(is_last);
        }
      } else {
        tmp_ctx.signing_context.ui.byte.step++;
      }
      uint8_t hash_data_size = G_io_apdu_buffer[4] - start_index;
      bool last_hash = false;
      if (tmp_ctx.signing_context.ui.byte.total_received + hash_data_size >=
          tmp_ctx.signing_context.data_size) {
        hash_data_size = tmp_ctx.signing_context.data_size -
                         tmp_ctx.signing_context.ui.byte.total_received;
        last_hash = true;
        tmp_ctx.signing_context.ui.byte.total_received = 0;
        if (tmp_ctx.signing_context.data_type != 4) {
          build_other_data_ui();
          tmp_ctx.signing_context.step = 7;
        }
      }
      tmp_ctx.signing_context.ui.byte.total_received += hash_data_size;
      cx_hash(&tmp_ctx.signing_context.ui.hash_ctx.header, CX_NONE,
              G_io_apdu_buffer + 5 + start_index, hash_data_size, NULL, 0);
      if (last_hash) {
        os_memset(&tmp_ctx.signing_context.ui.byte.buffer, 0, 64);
        cx_hash(&tmp_ctx.signing_context.ui.hash_ctx.header, CX_LAST, NULL, 0,
                tmp_ctx.signing_context.ui.byte.buffer, 32);
        // check view data eq to signed data
        if (os_memcmp(&tmp_ctx.signing_context.first_data_hash,
                      &tmp_ctx.signing_context.ui.byte.buffer, 32) != 0) {
          THROW(SW_SIGN_DATA_NOT_MATCH);
        }
      }
    }
    if (is_last) {
      tmp_ctx.signing_context.step = 8;
    }

    tmp_ctx.signing_context.ui.byte.chunk_used = 0;
  }
  PRINTF("make_allowed_ui_steps end\n");
}

// Show the transaction details for the user to approve
void show_sign_ui() {
  unsigned char tx_type = tmp_ctx.signing_context.data_type;
  if (tx_type == 4) {
    // Set the step/step count, and ui_state before requesting the UI
    ux_step = 0;
    ux_step_count = 9;
    ui_state = UI_VERIFY;

#if defined(TARGET_BLUE)
    UX_DISPLAY(ui_verify_transfer_blue, NULL);
#else
    ux_flow_init(0, ux_transfer_flow, NULL);
#endif // #if TARGET_ID
  } else {
    ux_step = 0;
    ux_step_count = 3;
    ui_state = UI_VERIFY;
#if defined(TARGET_BLUE)
    UX_DISPLAY(ui_approval_blue, ui_approval_blue_prepro);
#else
    ux_flow_init(0, ux_verify_transaction_flow, NULL);
#endif // #if TARGET_ID
  }
}

void show_sign_protobuf_ui() {
  unsigned char tx_type = tmp_ctx.signing_context.data_type;
  ux_step = 0;
  ui_state = UI_VERIFY;
  if (tx_type == 3) {
    ux_step_count = 10;
#if defined(TARGET_BLUE)
    UX_DISPLAY(ui_verify_issue_blue, NULL);
#else
    ux_flow_init(0, ux_issue_flow, NULL);
#endif // #if TARGET_ID
  } else if (tx_type == 4) {
    ux_step_count = 9;
#if defined(TARGET_BLUE)
    UX_DISPLAY(ui_verify_transfer_blue, NULL);
#else
    ux_flow_init(0, ux_transfer_flow, NULL);
#endif // #if TARGET_ID
  } else if (tx_type == 5) {
    ux_step_count = 7;
#if defined(TARGET_BLUE)
    UX_DISPLAY(ui_verify_reissue_blue, NULL);
#else
    ux_flow_init(0, ux_reissue_flow, NULL);
#endif // #if TARGET_ID
  } else if (tx_type == 6) {
    ux_step_count = 7;
#if defined(TARGET_BLUE)
    UX_DISPLAY(ui_verify_burn_blue, NULL);
#else
    ux_flow_init(0, ux_burn_flow, NULL);
#endif // #if TARGET_ID
  } else if (tx_type == 8) {
    ux_step_count = 7;
#if defined(TARGET_BLUE)
    UX_DISPLAY(ui_verify_lease_blue, NULL);
#else
    ux_flow_init(0, ux_lease_flow, NULL);
#endif // #if TARGET_ID
  } else if (tx_type == 9) {
    ux_step_count = 6;
#if defined(TARGET_BLUE)
    UX_DISPLAY(ui_verify_cancel_lease_blue, NULL);
#else
    ux_flow_init(0, ux_cancel_lease_flow, NULL);
#endif // #if TARGET_ID
  } else if (tx_type == 10) {
    ux_step_count = 6;
#if defined(TARGET_BLUE)
    UX_DISPLAY(ui_verify_create_alias_blue, NULL);
#else
    ux_flow_init(0, ux_create_alias_flow, NULL);
#endif // #if TARGET_ID
  } else if (tx_type == 11) {
    ux_step_count = 7;
#if defined(TARGET_BLUE)
    UX_DISPLAY(ui_verify_masstransfer_blue, NULL);
#else
    ux_flow_init(0, ux_masstransfer_flow, NULL);
#endif // #if TARGET_ID
  } else if (tx_type == 12) {
    ux_step_count = 5;
#if defined(TARGET_BLUE)
    UX_DISPLAY(ui_verify_data_blue, NULL);
#else
    ux_flow_init(0, ux_data_flow, NULL);
#endif // #if TARGET_ID
  } else if (tx_type == 13) {
    ux_step_count = 5;
#if defined(TARGET_BLUE)
    UX_DISPLAY(ui_verify_set_ac_script_blue, NULL);
#else
    ux_flow_init(0, ux_set_ac_script_flow, NULL);
#endif // #if TARGET_ID
  } else if (tx_type == 14) {
    ux_step_count = 7;
#if defined(TARGET_BLUE)
    UX_DISPLAY(ui_verify_sponsorship_blue, NULL);
#else
    ux_flow_init(0, ux_sponsorship_flow, NULL);
#endif // #if TARGET_ID
  } else if (tx_type == 15) {
    ux_step_count = 6;
#if defined(TARGET_BLUE)
    UX_DISPLAY(ui_verify_set_as_script_blue, NULL);
#else
    ux_flow_init(0, ux_set_as_script_flow, NULL);
#endif // #if TARGET_ID
  } else if (tx_type == 16) {
    ux_step_count = 11;
#if defined(TARGET_BLUE)
    UX_DISPLAY(ui_verify_invoke_blue, NULL);
#else
    ux_flow_init(0, ux_invoke_flow, NULL);
#endif // #if TARGET_ID
  } else if (tx_type == 17) {
    ux_step_count = 8;
#if defined(TARGET_BLUE)
    UX_DISPLAY(ui_verify_update_asset_blue, NULL);
#else
    ux_flow_init(0, ux_update_asset_flow, NULL);
#endif // #if TARGET_ID
  } else if (tx_type == 252) {
    ux_step_count = 8;
#if defined(TARGET_BLUE)
    UX_DISPLAY(ui_verify_order_blue, NULL);
#else
    ux_flow_init(0, ux_order_flow, NULL);
#endif // #if TARGET_ID
  }
}

void show_processing() {
#if defined(TARGET_BLUE)
// this freeze device after pb update
//  UX_DISPLAY(ui_processing_blue, NULL);
#else
  ux_flow_init(0, ux_processing_flow, NULL);
#endif
}