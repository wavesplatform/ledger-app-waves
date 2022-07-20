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
#include "../../crypto/waves.h"
#include "../print_amount.h"

void update_transfer_wait_in_buffer() {
  tmp_ctx.signing_context.ui.byte.buffer_used = 0;
  switch (tmp_ctx.signing_context.ui.byte.step) {
  case 2:
  case 4:
  case 9:
    tmp_ctx.signing_context.ui.byte.wait_in_buffer = 1;
    break;
  case 11:
    tmp_ctx.signing_context.ui.byte.wait_in_buffer = 3;
    break;
  case 13:
    tmp_ctx.signing_context.ui.byte.wait_in_buffer = 2;
    break;
  case 6:
  case 7:
  case 8:
    tmp_ctx.signing_context.ui.byte.wait_in_buffer = 8;
    break;
  case 10:
    // use first byte from step 9
    tmp_ctx.signing_context.ui.byte.chunk_used -= 1;
    tmp_ctx.signing_context.ui.byte.wait_in_buffer = 26;
    break;
  case 1:
  case 3:
  case 5:
    tmp_ctx.signing_context.ui.byte.wait_in_buffer = 32;
    break;
  case 12:
    tmp_ctx.signing_context.ui.byte.wait_in_buffer =
        tmp_ctx.signing_context.ui.byte.alias_size;
    break;
  case 14:
    tmp_ctx.signing_context.ui.byte.wait_in_buffer =
        tmp_ctx.signing_context.ui.byte.attachment_size;
    break;
  case 15:
    // last
    tmp_ctx.signing_context.ui.byte.wait_in_buffer = 0;
    break;
  }
}

void build_transfer_ui_step() {
  uint8_t chunk_data_size = G_io_apdu_buffer[4];
  uint8_t chunk_data_start_index = 5;

  if (tmp_ctx.signing_context.ui.byte.wait_in_buffer > 0) {
    try_to_fill_buffer(chunk_data_start_index, chunk_data_size);
  }

  if (tmp_ctx.signing_context.ui.byte.wait_in_buffer == 0 &&
      !tmp_ctx.signing_context.ui.finished) {
    size_t length = 45;
    bool is_flag_set = tmp_ctx.signing_context.ui.byte.buffer[0] == 1;
    uint64_t amount = 0;
    uint64_t fee = 0;

    PRINTF("build_ui_step step %d\n", tmp_ctx.signing_context.ui.byte.step);

    switch (tmp_ctx.signing_context.ui.byte.step) {
    case 0:
      // type
      tmp_ctx.signing_context.ui.byte.chunk_used =
          tmp_ctx.signing_context.chunk_used + 1;

      // skip version
      if (tmp_ctx.signing_context.data_version == 2) {
        tmp_ctx.signing_context.ui.byte.chunk_used += 1;
      }

      tmp_ctx.signing_context.ui.byte.step = 1;

      update_transfer_wait_in_buffer();
      break;
    case 1:
      // sender public key 32 bytes
      memmove(&tmp_ctx.signing_context.ui.from,
                 tmp_ctx.signing_context.ui.byte.buffer, 32);
      tmp_ctx.signing_context.ui.byte.step = 2;

      update_transfer_wait_in_buffer();
      break;
    case 2:
      // amount asset flag
      if (is_flag_set) {
        tmp_ctx.signing_context.ui.byte.step = 3;
      } else {
        memmove((char *)tmp_ctx.signing_context.ui.line2, WAVES_CONST, 5);
        tmp_ctx.signing_context.ui.byte.step = 4;
      }

      update_transfer_wait_in_buffer();
      break;
    case 3:
      // amount asset
      if (!b58enc((char *)tmp_ctx.signing_context.ui.line2, &length,
                  (const void *)tmp_ctx.signing_context.ui.byte.buffer, 32)) {
        return THROW(SW_CONDITIONS_NOT_SATISFIED);
      }

      tmp_ctx.signing_context.ui.byte.step = 4;

      update_transfer_wait_in_buffer();
      break;
    case 4:
      // fee asset flag
      if (is_flag_set) {
        tmp_ctx.signing_context.ui.byte.step = 5;
      } else {
        memmove((char *)tmp_ctx.signing_context.ui.fee_asset, WAVES_CONST,
                   5);
        tmp_ctx.signing_context.ui.byte.step = 6;
      }

      update_transfer_wait_in_buffer();
      break;
    case 5:
      // fee asset
      if (!b58enc((char *)tmp_ctx.signing_context.ui.fee_asset, &length,
                  (const void *)tmp_ctx.signing_context.ui.byte.buffer, 32)) {
        return THROW(SW_CONDITIONS_NOT_SATISFIED);
      }

      tmp_ctx.signing_context.ui.byte.step = 6;

      update_transfer_wait_in_buffer();
      break;
    case 6:
      // timestamp, skip it
      tmp_ctx.signing_context.ui.byte.step = 7;

      update_transfer_wait_in_buffer();
      break;
    case 7:
      // amount
      copy_in_reverse_order(
          (unsigned char *)&amount,
          (const unsigned char *)tmp_ctx.signing_context.ui.byte.buffer, 8);
      print_amount(amount, tmp_ctx.signing_context.amount_decimals,
                   (unsigned char *)tmp_ctx.signing_context.ui.line1, 20);

      tmp_ctx.signing_context.ui.byte.step = 8;

      update_transfer_wait_in_buffer();
      break;
    case 8:
      // fee
      copy_in_reverse_order(
          (unsigned char *)&fee,
          (const unsigned char *)tmp_ctx.signing_context.ui.byte.buffer, 8);
      print_amount(fee, tmp_ctx.signing_context.fee_decimals,
                   (unsigned char *)tmp_ctx.signing_context.ui.fee_amount, 20);

      tmp_ctx.signing_context.ui.byte.step = 9;
      update_transfer_wait_in_buffer();
      break;
    case 9:
      // address or alias flag is a part of address
      if (tmp_ctx.signing_context.ui.byte.buffer[0] == 1) {
        tmp_ctx.signing_context.ui.byte.step = 10;
      } else if (tmp_ctx.signing_context.ui.byte.buffer[0] == 2) {
        tmp_ctx.signing_context.ui.byte.step = 11;
      } else {
        return THROW(SW_CONDITIONS_NOT_SATISFIED);
      }
      update_transfer_wait_in_buffer();
      break;
    case 10:
      // address
      if (!b58enc((char *)tmp_ctx.signing_context.ui.line3, &length,
                  (const void *)tmp_ctx.signing_context.ui.byte.buffer, 26)) {
        return THROW(SW_CONDITIONS_NOT_SATISFIED);
      }
      tmp_ctx.signing_context.ui.byte.step = 13;
      update_transfer_wait_in_buffer();
      break;
    case 11:
      // alias len
      // also skip address scheme byte (first 2)
      tmp_ctx.signing_context.ui.byte.alias_size =
          tmp_ctx.signing_context.ui.byte.buffer[1] << 8 |
          tmp_ctx.signing_context.ui.byte.buffer[2];
      tmp_ctx.signing_context.ui.byte.step = 12;

      update_transfer_wait_in_buffer();
      break;
    case 12:
      // alias
      if (tmp_ctx.signing_context.ui.byte.alias_size > 30 ||
          tmp_ctx.signing_context.ui.byte.alias_size < 4) {
        THROW(SW_BYTE_DECODING_FAILED);
      }
      memmove((unsigned char *)tmp_ctx.signing_context.ui.line3,
                 (const unsigned char *)tmp_ctx.signing_context.ui.byte.buffer,
                 tmp_ctx.signing_context.ui.byte.alias_size);

      tmp_ctx.signing_context.ui.byte.step = 13;

      update_transfer_wait_in_buffer();
      break;
    case 13:
      // attachment size in bytes
      copy_in_reverse_order(
          (unsigned char *)&tmp_ctx.signing_context.ui.byte.attachment_size,
          (unsigned char *)tmp_ctx.signing_context.ui.byte.buffer, 2);

      tmp_ctx.signing_context.ui.byte.step = 14;

      update_transfer_wait_in_buffer();
      break;
    case 14:
      // attachment
      if (tmp_ctx.signing_context.ui.byte.attachment_size > 41) {
        memmove((unsigned char *)&tmp_ctx.signing_context.ui.line4[41],
                   &"...\0", 4);
        tmp_ctx.signing_context.ui.byte.attachment_size = 41;
      }

      memmove((unsigned char *)tmp_ctx.signing_context.ui.line4,
                 (const unsigned char *)tmp_ctx.signing_context.ui.byte.buffer,
                 tmp_ctx.signing_context.ui.byte.attachment_size);

      tmp_ctx.signing_context.ui.byte.step = 15;

      update_transfer_wait_in_buffer();
      break;
    case 15:
      tmp_ctx.signing_context.ui.finished = true;
      tmp_ctx.signing_context.step = 7;
      break;
    default:
      THROW(INVALID_COUNTER);
      break;
    }
  }
}