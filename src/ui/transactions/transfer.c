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

#include "transfer.h"
#include "../../main.h"
#include "../ui.h"
#include "../print_amount.h"
#include "../../crypto/waves.h"

void update_transfer_wait_in_buffer() {
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

      update_transfer_wait_in_buffer();
      break;
    case 1:
      // sender public key 32 bytes
      waves_public_key_to_address((const unsigned char *)ui_context.buffer,
                                  tmp_ctx.signing_context.network_byte,
                                  (unsigned char *)ui_context.line7);

      ui_context.step = 2;

      update_transfer_wait_in_buffer();
      break;
    case 2:
      // amount asset flag
      if (is_flag_set) {
        ui_context.step = 3;
      } else {
        os_memmove((char *)ui_context.line2, WAVES_CONST, 5);
        ui_context.step = 4;
      }

      update_transfer_wait_in_buffer();
      break;
    case 3:
      // amount asset
      if (!b58enc((char *)ui_context.line2, &length,
                  (const void *)ui_context.buffer, 32)) {
        return THROW(SW_CONDITIONS_NOT_SATISFIED);
      }

      ui_context.step = 4;

      update_transfer_wait_in_buffer();
      break;
    case 4:
      // fee asset flag
      if (is_flag_set) {
        ui_context.step = 5;
      } else {
        os_memmove((char *)ui_context.line5, WAVES_CONST, 5);
        ui_context.step = 6;
      }

      update_transfer_wait_in_buffer();
      break;
    case 5:
      // fee asset
      if (!b58enc((char *)ui_context.line5, &length,
                  (const void *)ui_context.buffer, 32)) {
        return THROW(SW_CONDITIONS_NOT_SATISFIED);
      }

      ui_context.step = 6;

      update_transfer_wait_in_buffer();
      break;
    case 6:
      // timestamp, skip it
      ui_context.step = 7;

      update_transfer_wait_in_buffer();
      break;
    case 7:
      // amount
      copy_in_reverse_order((unsigned char *)&amount,
                            (const unsigned char *)ui_context.buffer, 8);
      print_amount(amount, tmp_ctx.signing_context.amount_decimals,
                   (unsigned char *)ui_context.line1, 20);

      ui_context.step = 8;

      update_transfer_wait_in_buffer();
      break;
    case 8:
      // fee
      copy_in_reverse_order((unsigned char *)&fee,
                            (const unsigned char *)ui_context.buffer, 8);
      print_amount(fee, tmp_ctx.signing_context.fee_decimals,
                   (unsigned char *)ui_context.line4, 20);

      ui_context.step = 9;

      update_transfer_wait_in_buffer();
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

      update_transfer_wait_in_buffer();
      break;
    case 10:
      // address
      if (!b58enc((char *)ui_context.line3, &length,
                  (const void *)ui_context.buffer, 26)) {
        return THROW(SW_CONDITIONS_NOT_SATISFIED);
      }

      ui_context.step = 13;

      update_transfer_wait_in_buffer();
      break;
    case 11:
      // alias len
      // also skip address scheme byte (first 2)
      copy_in_reverse_order((unsigned char *)&ui_context.alias_size,
                            (unsigned char *)&ui_context.buffer[2], 2);

      ui_context.step = 12;

      update_transfer_wait_in_buffer();
      break;
    case 12:
      // alias
      os_memmove((unsigned char *)ui_context.line3,
                 (const unsigned char *)ui_context.buffer,
                 ui_context.alias_size);

      ui_context.step = 13;

      update_transfer_wait_in_buffer();
      break;
    case 13:
      // attachment size in bytes
      copy_in_reverse_order((unsigned char *)&ui_context.attachment_size,
                            (unsigned char *)ui_context.buffer, 2);

      ui_context.step = 14;

      update_transfer_wait_in_buffer();
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

      update_transfer_wait_in_buffer();
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