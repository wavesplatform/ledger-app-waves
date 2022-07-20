/*******************************************************************************
 *   Waves Platform Wallet App for Nano Ledger devices
 *   Copyright (c) 2017-2020 Vladislav Petushkov <vladislav.petushkov@gmail.com>
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

#include "protobuf.h"
#include "../ui.h"
#include "../print_amount.h"
#include "../../crypto/waves.h"

bool asset_callback(pb_istream_t *stream, const pb_field_t *field, void **arg) {
  PRINTF("Start asset callback\n");
  size_t length = 45;
  int len = stream->bytes_left;
  memset(&G_io_apdu_buffer[150], 0, len);
  if (!pb_read(stream, &G_io_apdu_buffer[150], (size_t)stream->bytes_left)) {
    return false;
  }
  if (len == 32) {
    if (!b58enc((char *)*arg, &length, (const void *)&G_io_apdu_buffer[150],
                32)) {
      return false;
    }
  } else {
    memmove((char *)*arg, WAVES_CONST, 5);
  }
  PRINTF("End asset callback\n");
  return true;
}

bool from_callback(pb_istream_t *stream, const pb_field_t *field, void **arg) {
  memset(&G_io_apdu_buffer[150], 0, 32);
  PRINTF("Start from callback\n");
  if (!pb_read(stream, &G_io_apdu_buffer[150], (size_t)stream->bytes_left)) {
    return false;
  }
  memmove((char *)*arg, &G_io_apdu_buffer[150], 32);
  PRINTF("End from callback\n");
  return true;
}

bool string_callback(pb_istream_t *stream, const pb_field_t *field,
                     void **arg) {
  PRINTF("Start string callback\n");
  int len = stream->bytes_left;
  memset(&G_io_apdu_buffer[150], 0, len);
  if (!pb_read(stream, &G_io_apdu_buffer[150], (size_t)stream->bytes_left)) {
    return false;
  }
  memmove((char *)*arg, &G_io_apdu_buffer[150], len);
  PRINTF("End string callback\n");
  return true;
}

bool text_callback(pb_istream_t *stream, const pb_field_t *field, void **arg) {
  int len = stream->bytes_left;
  PRINTF("Start text callback\n");
  if (len > 41) {
    size_t length = 41;
    memset(&G_io_apdu_buffer[150], 0, 45);
    size_t left = stream->bytes_left - length;
    if (!pb_read(stream, &G_io_apdu_buffer[150], length)) {
      return false;
    }
    memmove((char *)&G_io_apdu_buffer[191], &"...\0", 4);
    memmove((char *)*arg, &G_io_apdu_buffer[150], 45);
    if (!pb_read(stream, NULL, left)) {
      return false;
    }
  } else {
    memset(&G_io_apdu_buffer[150], 0, len);
    if (!pb_read(stream, &G_io_apdu_buffer[150], (size_t)stream->bytes_left)) {
      return false;
    }
    memmove((char *)*arg, &G_io_apdu_buffer[150], len);
  }
  PRINTF("End text callback\n");
  return true;
}

bool issue_script_callback(pb_istream_t *stream, const pb_field_t *field,
                            void **arg) {
    PRINTF("Start issue script callback\n");
    int len = stream->bytes_left;
    if (!pb_read(stream, NULL, len)) { // read other data
      return false;
    }  
    memmove((char *)*arg, &"True\0", 5);
    PRINTF("End issue script callback\n");                   
}

bool function_call_callback(pb_istream_t *stream, const pb_field_t *field,
                            void **arg) {
  uint32_t name_len;
  PRINTF("Start function call callback\n");
  memset(&G_io_apdu_buffer[150], 0, 45);
  int len = stream->bytes_left;
  if (len <= 7) {
    memmove((char *)*arg, &"default\0", 45);
    return true;
  }
  if (!pb_read(stream, &G_io_apdu_buffer[150],
               7)) { // read setting 3 bytes and 4 byte of function name size
    return false;
  }
  len -= 7;
  name_len = deserialize_uint32_t(&G_io_apdu_buffer[153]);
  if (name_len > 41) { // if function name len  is
    if (!pb_read(stream, &G_io_apdu_buffer[150],
                 41)) { // read 41 byte of the name
      return false;
    }
    len -= 41;
    memmove((char *)&G_io_apdu_buffer[191], &"...\0", 4);
    memmove((char *)*arg, &G_io_apdu_buffer[150], 45);
    if (!pb_read(stream, NULL, len)) { // read last str to null
      return false;
    }
  } else {
    if (!pb_read(stream, &G_io_apdu_buffer[150],
                 name_len)) { // read all name str
      return false;
    }
    len -= name_len;
    memmove((char *)*arg, &G_io_apdu_buffer[150], 45);
    if (!pb_read(stream, NULL, len)) { // read other data
      return false;
    }
  }
  PRINTF("End function call callback\n");
  return true;
}

bool transaction_data_callback(pb_istream_t *stream, const pb_field_t *field,
                               void **arg) {
  if (!pb_read(stream, NULL, stream->bytes_left)) {
    return false;
  }
  return true;
}

uint32_t pb_find_child(pb_istream_t *stream) {
  pb_wire_type_t wire_type;
  uint32_t tag;
  bool eof;
  PRINTF("Start finding child msg\n");
  while (pb_decode_tag(stream, &wire_type, &tag, &eof)) {
    if (wire_type == PB_WT_STRING) {
      pb_field_iter_t iter;
      if (pb_field_iter_begin(&iter, waves_Transaction_fields, NULL) &&
          pb_field_iter_find(&iter, tag)) {
        if (tag >= waves_Transaction_issue_tag &&
            tag <= waves_Transaction_update_asset_info_tag) {
          return tag;
        }
      }
    }

    /* Wasn't our field.. */
    pb_skip_field(stream, wire_type);
  }
  return 0;
  PRINTF("End finding child msg\n");
}

void pb_decode_child(pb_istream_t *stream, const pb_msgdesc_t *msg,
                     void *dest) {
  PRINTF("Start decoding child msg\n");
  pb_istream_t substream;
  uint8_t status;
  if (!pb_make_string_substream(stream, &substream))
    THROW(SW_PROTOBUF_DECODING_FAILED);

  status = pb_decode(&substream, msg, dest);
  pb_close_string_substream(stream, &substream);
  if (!status) {
    PRINTF("Decoding failed: %s\n", PB_GET_ERROR(stream));
    THROW(SW_PROTOBUF_DECODING_FAILED);
  }
  PRINTF("End decoding child msg\n");
}

void build_issue_protobuf(pb_istream_t *stream) {
  waves_IssueTransactionData tx = waves_IssueTransactionData_init_default;
  tx.name.funcs.decode = text_callback;
  tx.name.arg = &tmp_ctx.signing_context.ui.line1;
  tx.description.funcs.decode = text_callback;
  tx.description.arg = &tmp_ctx.signing_context.ui.line2;
  tx.script.funcs.decode = issue_script_callback;
  tx.script.arg = &tmp_ctx.signing_context.ui.line6;
  pb_decode_child(stream, waves_IssueTransactionData_fields, &tx);
  snprintf((char *)tmp_ctx.signing_context.ui.line4,
           sizeof(tmp_ctx.signing_context.ui.line4), "%d", tx.decimals);
  print_amount(tx.amount, (unsigned char)tx.decimals,
               (unsigned char *)tmp_ctx.signing_context.ui.line3, 22);
  if (tx.reissuable == true) {
    memmove((unsigned char *)&tmp_ctx.signing_context.ui.line5, &"True\0",
               5);
  } else {
    memmove((unsigned char *)&tmp_ctx.signing_context.ui.line5, &"False\0",
               6);
  }
  if(strlen((const char *)tmp_ctx.signing_context.ui.line6) == 0) {
    memmove((unsigned char *)&tmp_ctx.signing_context.ui.line6, &"False\0",
               6);
  }
}

void build_transfer_protobuf(pb_istream_t *stream) {
  waves_TransferTransactionData tx = waves_TransferTransactionData_init_default;
  tx.amount.asset_id.funcs.decode = asset_callback;
  tx.amount.asset_id.arg = &tmp_ctx.signing_context.ui.line2;
  tx.attachment.funcs.decode = text_callback;
  tx.attachment.arg = &tmp_ctx.signing_context.ui.line4;
  pb_decode_child(stream, waves_TransferTransactionData_fields, &tx);
  print_amount(tx.amount.amount, tmp_ctx.signing_context.amount_decimals,
               (unsigned char *)tmp_ctx.signing_context.ui.line1, 22);
  if (tx.recipient.which_recipient == waves_Recipient_public_key_hash_tag) {
    waves_public_key_hash_to_address(tx.recipient.recipient.public_key_hash,
                                     tmp_ctx.signing_context.network_byte,
                                     tmp_ctx.signing_context.ui.line3);
  } else {
    memmove(tmp_ctx.signing_context.ui.line3, tx.recipient.recipient.alias,
               31);
  }
  if (strlen((const char *)tmp_ctx.signing_context.ui.line2) == 0) {
    memmove(tmp_ctx.signing_context.ui.line2, WAVES_CONST, 5);
  }
}

void build_reissue_protobuf(pb_istream_t *stream) {
  waves_ReissueTransactionData tx = waves_ReissueTransactionData_init_default;
  tx.asset_amount.asset_id.funcs.decode = asset_callback;
  tx.asset_amount.asset_id.arg = &tmp_ctx.signing_context.ui.line2;
  pb_decode_child(stream, waves_ReissueTransactionData_fields, &tx);
  print_amount(tx.asset_amount.amount, tmp_ctx.signing_context.amount_decimals,
               (unsigned char *)tmp_ctx.signing_context.ui.line1, 22);
  if (tx.reissuable == true) {
    memmove((unsigned char *)&tmp_ctx.signing_context.ui.line3, &"True\0",
               5);
  } else {
    memmove((unsigned char *)&tmp_ctx.signing_context.ui.line3, &"False\0",
               6);
  }
}

void build_burn_protobuf(pb_istream_t *stream) {
  waves_BurnTransactionData tx = waves_BurnTransactionData_init_default;
  tx.asset_amount.asset_id.funcs.decode = asset_callback;
  tx.asset_amount.asset_id.arg = &tmp_ctx.signing_context.ui.line2;
  pb_decode_child(stream, waves_BurnTransactionData_fields, &tx);
  print_amount(tx.asset_amount.amount, tmp_ctx.signing_context.amount_decimals,
               (unsigned char *)tmp_ctx.signing_context.ui.line1, 22);
}

void build_lease_protobuf(pb_istream_t *stream) {
  waves_LeaseTransactionData tx = waves_LeaseTransactionData_init_default;
  pb_decode_child(stream, waves_LeaseTransactionData_fields, &tx);
  print_amount(tx.amount, tmp_ctx.signing_context.amount_decimals,
               (unsigned char *)tmp_ctx.signing_context.ui.line1, 22);
  if (tx.recipient.which_recipient == waves_Recipient_public_key_hash_tag) {
    waves_public_key_hash_to_address(tx.recipient.recipient.public_key_hash,
                                     tmp_ctx.signing_context.network_byte,
                                     tmp_ctx.signing_context.ui.line3);
  } else {
    memmove(tmp_ctx.signing_context.ui.line3, tx.recipient.recipient.alias,
               31);
  }
}

void build_lease_cancel_protobuf(pb_istream_t *stream) {
  waves_LeaseCancelTransactionData tx =
      waves_LeaseCancelTransactionData_init_default;
  tx.lease_id.funcs.decode = asset_callback;
  tx.lease_id.arg = &tmp_ctx.signing_context.ui.line1;
  pb_decode_child(stream, waves_LeaseCancelTransactionData_fields, &tx);
}

void build_create_alias_protobuf(pb_istream_t *stream) {
  waves_CreateAliasTransactionData tx =
      waves_CreateAliasTransactionData_init_default;
  tx.alias.funcs.decode = string_callback;
  tx.alias.arg = &tmp_ctx.signing_context.ui.line1;
  pb_decode_child(stream, waves_CreateAliasTransactionData_fields, &tx);
}

void build_mass_transfer_protobuf(pb_istream_t *stream) {
  waves_MassTransferTransactionData tx =
      waves_MassTransferTransactionData_init_default;
  tx.asset_id.funcs.decode = asset_callback;
  tx.asset_id.arg = &tmp_ctx.signing_context.ui.line1;
  tx.attachment.funcs.decode = text_callback;
  tx.attachment.arg = &tmp_ctx.signing_context.ui.line2;
  pb_decode_child(stream, waves_MassTransferTransactionData_fields, &tx);
  if (strlen((const char *)tmp_ctx.signing_context.ui.line1) == 0) {
    memmove(tmp_ctx.signing_context.ui.line1, WAVES_CONST, 5);
  }
}

void build_data_transaction_protobuf(pb_istream_t *stream) {
  waves_DataTransactionData tx = waves_DataTransactionData_init_default;
  pb_decode_child(stream, waves_DataTransactionData_fields, &tx);
}

void build_set_script_protobuf(pb_istream_t *stream) {
  waves_SetScriptTransactionData tx =
      waves_SetScriptTransactionData_init_default;
  pb_decode_child(stream, waves_SetScriptTransactionData_fields, &tx);
}

void build_sponsor_fee_protobuf(pb_istream_t *stream) {
  waves_SponsorFeeTransactionData tx =
      waves_SponsorFeeTransactionData_init_default;
  tx.min_fee.asset_id.funcs.decode = asset_callback;
  tx.min_fee.asset_id.arg = &tmp_ctx.signing_context.ui.line2;
  pb_decode_child(stream, waves_SponsorFeeTransactionData_fields, &tx);
  print_amount(tx.min_fee.amount, tmp_ctx.signing_context.amount_decimals,
               (unsigned char *)tmp_ctx.signing_context.ui.line1, 22);
}

void build_set_asset_script_protobuf(pb_istream_t *stream) {
  waves_SetAssetScriptTransactionData tx =
      waves_SetAssetScriptTransactionData_init_default;
  tx.asset_id.funcs.decode = asset_callback;
  tx.asset_id.arg = &tmp_ctx.signing_context.ui.line1;
  pb_decode_child(stream, waves_SetAssetScriptTransactionData_fields, &tx);
}

void build_invoke_script_protobuf(pb_istream_t *stream) {
  waves_InvokeScriptTransactionData tx =
      waves_InvokeScriptTransactionData_init_default;
  tx.function_call.funcs.decode = function_call_callback;
  tx.function_call.arg = &tmp_ctx.signing_context.ui.line2;
  tx.payments[0].asset_id.funcs.decode = asset_callback;
  tx.payments[0].asset_id.arg = &tmp_ctx.signing_context.ui.line1;
  tx.payments[1].asset_id.funcs.decode = asset_callback;
  tx.payments[1].asset_id.arg = &tmp_ctx.signing_context.ui.line5;
  pb_decode_child(stream, waves_InvokeScriptTransactionData_fields, &tx);
  if (tx.payments_count >= 1) {
    print_amount(tx.payments[0].amount, tmp_ctx.signing_context.amount_decimals,
                 (unsigned char *)&tmp_ctx.signing_context.ui.line4, 22);
    if (strlen((const char *)tmp_ctx.signing_context.ui.line1) == 0) {
      memmove(tmp_ctx.signing_context.ui.line1, WAVES_CONST, 5);
    }
  }
  if (tx.payments_count == 2) {
    print_amount(tx.payments[1].amount, tmp_ctx.signing_context.amount2_decimals,
                 (unsigned char *)&tmp_ctx.signing_context.ui.line6, 22);
    if (strlen((const char *)tmp_ctx.signing_context.ui.line5) == 0) {
      memmove(tmp_ctx.signing_context.ui.line1, WAVES_CONST, 5);
    }
  }
  if (tx.d_app.which_recipient == waves_Recipient_public_key_hash_tag) {
    waves_public_key_hash_to_address(tx.d_app.recipient.public_key_hash,
                                     tmp_ctx.signing_context.network_byte,
                                     tmp_ctx.signing_context.ui.line3);
  } else {
    memmove(tmp_ctx.signing_context.ui.line3, tx.d_app.recipient.alias, 31);
  }
}

void build_update_asset_info_protobuf(pb_istream_t *stream) {
  waves_UpdateAssetInfoTransactionData tx =
      waves_UpdateAssetInfoTransactionData_init_default;
  tx.asset_id.funcs.decode = asset_callback;
  tx.asset_id.arg = &tmp_ctx.signing_context.ui.line1;
  tx.name.funcs.decode = string_callback;
  tx.name.arg = &tmp_ctx.signing_context.ui.line2;
  tx.description.funcs.decode = text_callback;
  tx.description.arg = &tmp_ctx.signing_context.ui.line4;
  pb_decode_child(stream, waves_UpdateAssetInfoTransactionData_fields, &tx);
}

void build_protobuf_child_tx(uiProtobuf_t *ctx, uint8_t *init_buffer,
                             uint8_t init_buffer_size,
                             uint16_t total_buffer_size) {
  uint32_t tag;
  pb_istream_t stream = pb_istream_from_apdu(ctx, init_buffer, init_buffer_size,
                                             total_buffer_size, 0);
  tag = pb_find_child(&stream);
  switch (tag) {
  case waves_Transaction_issue_tag:
    build_issue_protobuf(&stream);
    break;
  case waves_Transaction_transfer_tag:
    build_transfer_protobuf(&stream);
    break;
  case waves_Transaction_reissue_tag:
    build_reissue_protobuf(&stream);
    break;
  case waves_Transaction_burn_tag:
    build_burn_protobuf(&stream);
    break;
  case waves_Transaction_lease_tag:
    build_lease_protobuf(&stream);
    break;
  case waves_Transaction_lease_cancel_tag:
    build_lease_cancel_protobuf(&stream);
    break;
  case waves_Transaction_create_alias_tag:
    build_create_alias_protobuf(&stream);
    break;
  case waves_Transaction_mass_transfer_tag:
    build_mass_transfer_protobuf(&stream);
    break;
  case waves_Transaction_data_transaction_tag:
    build_data_transaction_protobuf(&stream);
    break;
  case waves_Transaction_set_script_tag:
    build_set_script_protobuf(&stream);
    break;
  case waves_Transaction_sponsor_fee_tag:
    build_sponsor_fee_protobuf(&stream);
    break;
  case waves_Transaction_set_asset_script_tag:
    build_set_asset_script_protobuf(&stream);
    break;
  case waves_Transaction_invoke_script_tag:
    build_invoke_script_protobuf(&stream);
    break;
  case waves_Transaction_update_asset_info_tag:
    build_update_asset_info_protobuf(&stream);
    break;
  default:
    PRINTF("Error with child tag");
    THROW(SW_PROTOBUF_DECODING_FAILED);
    break;
  }

  tmp_ctx.signing_context.ui.finished = true;
  tmp_ctx.signing_context.step = 8;
}

void build_protobuf_root_tx(uiProtobuf_t *ctx, uint8_t *init_buffer,
                            uint8_t init_buffer_size,
                            uint16_t total_buffer_size, uint8_t start_index) {
  uint8_t status;
  pb_istream_t stream = pb_istream_from_apdu(ctx, init_buffer, init_buffer_size,
                                             total_buffer_size, start_index);
  PRINTF("Start decoding root msg\n");
  // init variable for parsing
  waves_Transaction tx = waves_Transaction_init_zero;
  // set callback for parsing tx data field(transactions)
  tx.cb_data.funcs.decode = transaction_data_callback;
  tx.sender_public_key.funcs.decode = from_callback;
  tx.sender_public_key.arg = &tmp_ctx.signing_context.ui.from;
  tx.fee.asset_id.funcs.decode = asset_callback;
  tx.fee.asset_id.arg = &tmp_ctx.signing_context.ui.fee_asset;
  status = pb_decode_ex(&stream, waves_Transaction_fields, &tx, 0);
  if (!status) {
    PRINTF("Decoding failed: %s\n", PB_GET_ERROR(&stream));
    THROW(SW_PROTOBUF_DECODING_FAILED);
  }
  print_amount(tx.fee.amount, tmp_ctx.signing_context.fee_decimals,
               (unsigned char *)tmp_ctx.signing_context.ui.fee_amount, 22);
  if (strlen((const char *)tmp_ctx.signing_context.ui.fee_asset) == 0) {
    memmove(tmp_ctx.signing_context.ui.fee_asset, WAVES_CONST, 5);
  }
  PRINTF("End decoding root msg\n");
  tmp_ctx.signing_context.step = 7;
}

void build_protobuf_order(uiProtobuf_t *ctx, uint8_t *init_buffer,
                          uint8_t init_buffer_size, uint16_t total_buffer_size,
                          uint8_t start_index) {
  uint8_t status;
  // init variable for parsing
  waves_Order order = waves_Order_init_default;
  order.sender_public_key.funcs.decode = from_callback;
  order.sender_public_key.arg = &tmp_ctx.signing_context.ui.from;
  order.matcher_public_key.funcs.decode = from_callback;
  order.matcher_public_key.arg = &tmp_ctx.signing_context.ui.line2;
  order.matcher_fee.asset_id.funcs.decode = asset_callback;
  order.matcher_fee.asset_id.arg = &tmp_ctx.signing_context.ui.fee_asset;
  order.asset_pair.amount_asset_id.funcs.decode = asset_callback;
  order.asset_pair.amount_asset_id.arg = &tmp_ctx.signing_context.ui.line1;
  // create stream for parsing
  pb_istream_t stream = pb_istream_from_apdu(ctx, init_buffer, init_buffer_size,
                                             total_buffer_size, start_index);
  // decoding order message
  PRINTF("Start decoding\n");
  status = pb_decode(&stream, waves_Order_fields, &order);
  if (!status) {
    PRINTF("Decoding failed: %s\n", PB_GET_ERROR(&stream));
    THROW(0x6D00);
  }
  PRINTF("End decoding\n");
  print_amount(order.amount, tmp_ctx.signing_context.amount_decimals,
               (unsigned char *)tmp_ctx.signing_context.ui.line4, 22);
  print_amount(order.matcher_fee.amount, tmp_ctx.signing_context.fee_decimals,
               (unsigned char *)tmp_ctx.signing_context.ui.fee_amount, 22);
  if (order.order_side == waves_Order_Side_BUY) {
    memmove((unsigned char *)&tmp_ctx.signing_context.ui.line3,
               &"Buy order\0", 10);
  } else {
    memmove((unsigned char *)&tmp_ctx.signing_context.ui.line3,
               &"Sell order\0", 11);
  }
  if (strlen((const char *)tmp_ctx.signing_context.ui.fee_asset) == 0) {
    memmove(tmp_ctx.signing_context.ui.fee_asset, WAVES_CONST, 5);
  }
  waves_public_key_to_address(tmp_ctx.signing_context.ui.line2,
                                          tmp_ctx.signing_context.network_byte,
                                          tmp_ctx.signing_context.ui.line2);
  tmp_ctx.signing_context.step = 7;
}
