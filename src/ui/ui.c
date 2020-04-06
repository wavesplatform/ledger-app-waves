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
#include "nanopb/pb_encode.h"
#include "nanopb/pb_decode.h"
#include "nanopb/simple.pb.h"

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

bool print_amount(uint64_t amount, int decimals, unsigned char *out,
                  uint8_t len);

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
  uint32_t chunk_data_left = chunk_data_size - ui_context.chunk_used;
  uint32_t step_read_bytes_left =
      MIN(chunk_data_left, ui_context.wait_in_buffer);
  if (ui_context.wait_in_buffer <= 0 ||
      chunk_data_start_index + ui_context.chunk_used > 150) {
    return THROW(EXCEPTION_OVERFLOW);
  }
  os_memmove((unsigned char *)&ui_context.buffer[ui_context.buffer_used],
             &G_io_apdu_buffer[chunk_data_start_index + ui_context.chunk_used],
             step_read_bytes_left);
  ui_context.chunk_used += step_read_bytes_left;
  ui_context.buffer_used += step_read_bytes_left;
  ui_context.wait_in_buffer -= step_read_bytes_left;
}

void build_other_data_ui() {
  unsigned char tx_type = tmp_ctx.signing_context.data_type;
  // just one step here
  os_memmove(&ui_context.line2, &"Transaction Id\0", 15);
  if (tx_type == 3) {
    os_memmove(&ui_context.line1, &"issue\0", 6);
  } else if (tx_type == 4) {
    os_memmove(&ui_context.line1, &"transfer\0", 9);
  } else if (tx_type == 5) {
    os_memmove(&ui_context.line1, &"reissue\0", 8);
  } else if (tx_type == 6) {
    os_memmove(&ui_context.line1, &"burn\0", 5);
  } else if (tx_type == 8) {
    os_memmove(&ui_context.line1, &"start leasing\0", 14);
  } else if (tx_type == 9) {
    os_memmove(&ui_context.line1, &"cancel leasing\0", 15);
  } else if (tx_type == 10) {
    os_memmove(&ui_context.line2, &"Transaction Hash\0", 17);
    os_memmove(&ui_context.line1, &"creating an alias\0", 18);
  } else if (tx_type == 11) {
    os_memmove(&ui_context.line1, &"mass transfer\0", 14);
  } else if (tx_type == 12) {
    os_memmove(&ui_context.line1, &"data\0", 5);
  } else if (tx_type == 13) {
    os_memmove(&ui_context.line1, &"set script\0", 11);
  } else if (tx_type == 14) {
    os_memmove(&ui_context.line1, &"sponsorship\0", 12);
  } else if (tx_type == 15) {
    os_memmove(&ui_context.line1, &"asset script\0", 13);
  } else if (tx_type == 16) {
    os_memmove(&ui_context.line1, &"script invocation\0", 18);
  } else if (tx_type == 17) {
    os_memmove(&ui_context.line1, &"update asset info\0", 18);
  } else if (tx_type > 200) {
    // type byte >200 are 'reserved', it will not be signed
    os_memmove(&ui_context.line2, &"Hash\0", 5);
    if (tx_type == 252) {
      os_memmove(&ui_context.line1, &"order\0", 6);
    } else if (tx_type == 253) {
      os_memmove(&ui_context.line1, &"data\0", 5);
    } else if (tx_type == 254) {
      os_memmove(&ui_context.line1, &"request\0", 8);
    } else if (tx_type == 255) {
      os_memmove(&ui_context.line1, &"message\0", 8);
    } else {
      os_memmove(&ui_context.line1, &"something\0", 10);
    }
  }

  if (strlen((const char *)ui_context.line1) == 0) {
    os_memmove(&ui_context.line1, &"transaction\0", 12);
  }
  // id should be calculated on sign step
  size_t length = 45;
  if (!b58enc((char *)ui_context.line3, &length, (const void *)&ui_context.id,
              32)) {
    THROW(SW_CONDITIONS_NOT_SATISFIED);
  }

  // Get the public key and return it.
  cx_ecfp_public_key_t public_key;

  if (!get_curve25519_public_key_for_path(
          (uint32_t *)tmp_ctx.signing_context.bip32, &public_key)) {
    THROW(INVALID_PARAMETER);
  }

  waves_public_key_to_address(
      public_key.W, tmp_ctx.signing_context.network_byte, ui_context.line4);
}

void make_allowed_ui_steps(bool is_last) {
  PRINTF("make_allowed_ui_steps start\n");
  if (tmp_ctx.signing_context.data_type == 4) {
    uint8_t chunk_data_size = G_io_apdu_buffer[4];
    if (tmp_ctx.signing_context.chunk == 0) {
      chunk_data_size -= 28;
    }
    while (
        (chunk_data_size - ui_context.chunk_used > 0 && ui_context.step < 15) ||
        (ui_context.step == 15 && !ui_context.finished && is_last)) {
      build_transfer_ui_step(is_last);
    }
  } else if (is_last) {
    build_other_data_ui();
  }
  PRINTF("make_allowed_ui_steps end\n");
  // Testing simpe protobuf
  /* This is the buffer where we will store our message. */
  PRINTF("init variables\n");
  uint8_t buffer[128];
  size_t message_length;
  bool status;

  /* Encode our message */
  //{
  /* Allocate space on the stack to store the message data.
   *
   * Nanopb generates simple struct definitions for all the messages.
   * - check out the contents of simple.pb.h!
   * It is a good idea to always initialize your structures
   * so that you do not have garbage data from RAM in there.
   */
  SimpleMessage message = SimpleMessage_init_zero;
  /* Create a stream that will write to our buffer. */
  pb_ostream_t stream = pb_ostream_from_buffer(buffer, sizeof(buffer));
  /* Fill in the lucky number */
  message.lucky_number = 13;
  /* Now we are ready to encode the message! */
  status = pb_encode(&stream, SimpleMessage_fields, &message);
  message_length = stream.bytes_written;

  /* Then just check for any errors.. */
  if (!status) {
    PRINTF("Encoding failed: %s\n", PB_GET_ERROR(&stream));
    return;
  }
  //}

  /* Now we could transmit the message over network, store it in a file or
   * wrap it to a pigeon's leg.
   */

  /* But because we are lazy, we will just decode it immediately. */

  //{
  // PRINTF("init message\n");
  /* Allocate space for the decoded message. */
  // SimpleMessage message = SimpleMessage_init_zero;
  // PRINTF("create stream\n");
  /* Create a stream that reads from the buffer. */
  // pb_istream_t stream = pb_istream_from_buffer(buffer, message_length);
  // PRINTF("decode message\n");
  /* Now we are ready to decode the message. */
  // status = pb_decode(&stream, SimpleMessage_fields, &message);

  /* Check for errors... */
  // if (!status)
  //{
  //  PRINTF("Decoding failed: %s\n", PB_GET_ERROR(&stream));
  // return ;
  //}

  /* Print the data contained in the message. */
  // PRINTF("Your lucky number was %d!\n", (int)message.lucky_number);
  //}
  //*****END TESTING SIMPLE*****
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