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

void update_wait_in_buffer() {
  ui_context.buffer_used = 0;
  switch (ui_context.step) {
  case 2:
  case 4:
  case 9:
    ui_context.wait_in_buffer = 1;
    break;
  case 11:
    ui_context.wait_in_buffer = 4;
    break;
  case 13:
    ui_context.wait_in_buffer = 2;
    break;
  case 6:
  case 7:
  case 8:
    ui_context.wait_in_buffer = 8;
    break;
  case 10:
    // use first byte from step 9
    ui_context.chunk_used -= 1;
    ui_context.wait_in_buffer = 26;
    break;
  case 1:
  case 3:
  case 5:
    ui_context.wait_in_buffer = 32;
    break;
  case 12:
    ui_context.wait_in_buffer = ui_context.alias_size;
    break;
  case 14:
    ui_context.wait_in_buffer = ui_context.attachment_size;
    break;
  case 15:
    // last
    ui_context.wait_in_buffer = 0;
    break;
  }
}

void build_transfer_ui_step(bool is_last) {
  uint8_t chunk_data_start_index = 5;
  uint8_t chunk_data_size = G_io_apdu_buffer[4];

  if (tmp_ctx.signing_context.chunk == 0) {
    chunk_data_start_index += 28;
    chunk_data_size -= 28;
  }

  if (ui_context.wait_in_buffer > 0) {
    try_to_fill_buffer(chunk_data_start_index, chunk_data_size);
  }

  if (ui_context.wait_in_buffer == 0 && !ui_context.finished) {
    size_t length = 45;
    bool is_flag_set = ui_context.buffer[0] == 1;
    uint64_t amount = 0;
    uint64_t fee = 0;

    PRINTF("build_ui_step step %d\n", ui_context.step);

    switch (ui_context.step) {
    case 0:
      // type
      ui_context.chunk_used = 1;

      // skip version
      if (tmp_ctx.signing_context.data_version == 2) {
        ui_context.chunk_used += 1;
      }

      ui_context.step = 1;

      update_wait_in_buffer();
      break;
    case 1:
      // sender public key 32 bytes
      waves_public_key_to_address((const unsigned char *)ui_context.buffer,
                                  tmp_ctx.signing_context.network_byte,
                                  (unsigned char *)ui_context.line7);

      ui_context.step = 2;

      update_wait_in_buffer();
      break;
    case 2:
      // amount asset flag
      if (is_flag_set) {
        ui_context.step = 3;
      } else {
        os_memmove((char *)ui_context.line2, WAVES_CONST, 5);
        ui_context.step = 4;
      }

      update_wait_in_buffer();
      break;
    case 3:
      // amount asset
      if (!b58enc((char *)ui_context.line2, &length,
                  (const void *)ui_context.buffer, 32)) {
        return THROW(SW_CONDITIONS_NOT_SATISFIED);
      }

      ui_context.step = 4;

      update_wait_in_buffer();
      break;
    case 4:
      // fee asset flag
      if (is_flag_set) {
        ui_context.step = 5;
      } else {
        os_memmove((char *)ui_context.line5, WAVES_CONST, 5);
        ui_context.step = 6;
      }

      update_wait_in_buffer();
      break;
    case 5:
      // fee asset
      if (!b58enc((char *)ui_context.line5, &length,
                  (const void *)ui_context.buffer, 32)) {
        return THROW(SW_CONDITIONS_NOT_SATISFIED);
      }

      ui_context.step = 6;

      update_wait_in_buffer();
      break;
    case 6:
      // timestamp, skip it
      ui_context.step = 7;

      update_wait_in_buffer();
      break;
    case 7:
      // amount
      copy_in_reverse_order((unsigned char *)&amount,
                            (const unsigned char *)ui_context.buffer, 8);
      print_amount(amount, tmp_ctx.signing_context.amount_decimals,
                   (unsigned char *)ui_context.line1, 20);

      ui_context.step = 8;

      update_wait_in_buffer();
      break;
    case 8:
      // fee
      copy_in_reverse_order((unsigned char *)&fee,
                            (const unsigned char *)ui_context.buffer, 8);
      print_amount(fee, tmp_ctx.signing_context.fee_decimals,
                   (unsigned char *)ui_context.line4, 20);

      ui_context.step = 9;

      update_wait_in_buffer();
      break;
    case 9:
      // address or alias flag is a part of address
      if (ui_context.buffer[0] == 1) {
        ui_context.step = 10;
      } else if (ui_context.buffer[0] == 2) {
        ui_context.step = 11;
      } else {
        return THROW(SW_CONDITIONS_NOT_SATISFIED);
      }

      update_wait_in_buffer();
      break;
    case 10:
      // address
      if (!b58enc((char *)ui_context.line3, &length,
                  (const void *)ui_context.buffer, 26)) {
        return THROW(SW_CONDITIONS_NOT_SATISFIED);
      }

      ui_context.step = 13;

      update_wait_in_buffer();
      break;
    case 11:
      // alias len
      // also skip address scheme byte (first 2)
      copy_in_reverse_order((unsigned char *)&ui_context.alias_size,
                            (unsigned char *)&ui_context.buffer[2], 2);

      ui_context.step = 12;

      update_wait_in_buffer();
      break;
    case 12:
      // alias
      os_memmove((unsigned char *)ui_context.line3,
                 (const unsigned char *)ui_context.buffer,
                 ui_context.alias_size);

      ui_context.step = 13;

      update_wait_in_buffer();
      break;
    case 13:
      // attachment size in bytes
      copy_in_reverse_order((unsigned char *)&ui_context.attachment_size,
                            (unsigned char *)ui_context.buffer, 2);

      ui_context.step = 14;

      update_wait_in_buffer();
      break;
    case 14:
      // attachment
      if (ui_context.attachment_size > 41) {
        os_memmove((unsigned char *)&ui_context.line6[41], &"...\0", 4);
        ui_context.attachment_size = 41;
      }

      os_memmove((unsigned char *)ui_context.line6,
                 (const unsigned char *)ui_context.buffer,
                 ui_context.attachment_size);

      ui_context.step = 15;

      update_wait_in_buffer();
      break;
    case 15:
      if (is_last) {
        size_t length = 45;
        // id should be calculated on sign step
        if (!b58enc((char *)ui_context.line8, &length,
                    (const void *)&ui_context.id, 32)) {
          return THROW(SW_CONDITIONS_NOT_SATISFIED);
        }
        ui_context.finished = true;
      }
      break;
    default:
      THROW(INVALID_COUNTER);
      break;
    }
  }
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
  } else {
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
    }
  }

  if (strlen((const char *)ui_context.line1) == 0) {
    os_memmove(&ui_context.line1, &"transaction\0", 12);
  }
  // id should be calculated on sign step
  size_t length = 45;
  if (!b58enc((char *)ui_context.line8, &length, (const void *)&ui_context.id,
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

// borrowed from the Stellar wallet code and modified
bool print_amount(uint64_t amount, int decimals, unsigned char *out,
                  uint8_t len) {
  uint64_t dVal = amount;
  int i, j;

  if (decimals == 0)
    decimals--;

  memset(ui_context.tmp, 0, len);
  for (i = 0; dVal > 0 || i < decimals + 2; i++) {
    if (dVal > 0) {
      ui_context.tmp[i] = (char)((dVal % 10) + '0');
      dVal /= 10;
    } else {
      ui_context.tmp[i] = '0';
    }
    if (i == decimals - 1) {
      i += 1;
      ui_context.tmp[i] = '.';
    }
    if (i >= len) {
      return false;
    }
  }
  // reverse order
  for (i -= 1, j = 0; i >= 0 && j < len - 1; i--, j++) {
    out[j] = ui_context.tmp[i];
  }
  if (decimals > 0) {
    // strip trailing 0s
    for (j -= 1; j > 0; j--) {
      if (out[j] != '0')
        break;
    }
    j += 1;
    if (out[j - 1] == '.')
      j -= 1;
  }

  out[j] = '\0';
  return true;
}