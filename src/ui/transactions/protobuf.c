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

bool waves_Recipient_callback(pb_istream_t *istream, pb_ostream_t *ostream,
                              const pb_field_t *field) {
  if (istream) {
    int len = istream->bytes_left;
    unsigned char buff[len];
    if (!pb_read(istream, buff, (size_t)istream->bytes_left)) {
      return false;
    }
    if (field->tag == waves_Recipient_public_key_hash_tag) {
      os_memmove((unsigned char *)&tmp_ctx.signing_context.ui.line3, buff, len);
      tmp_ctx.signing_context.ui.pkhash = true;
    } else if (field->tag == waves_Recipient_alias_tag) {
      os_memmove((unsigned char *)&tmp_ctx.signing_context.ui.line3, buff, len);
    }
  }
  return true;
}

bool asset_callback(pb_istream_t *stream, const pb_field_t *field, void **arg) {
  size_t length = 45;
  int len = stream->bytes_left;
  unsigned char buff[len];
  if (!pb_read(stream, buff, (size_t)stream->bytes_left)) {
    return false;
  }
  if (len == 32) {
    if (!b58enc((char *)*arg, &length, (const void *)buff, 32)) {
      return false;
    }
  } else {
    os_memmove((char *)*arg, WAVES_CONST, 5);
  }
  return true;
}

bool from_callback(pb_istream_t *stream, const pb_field_t *field, void **arg) {
  unsigned char buff[32];

  if (!pb_read(stream, buff, (size_t)stream->bytes_left)) {
    return false;
  }
  os_memmove((char *)*arg, buff, 32);
  return true;
}

bool string_callback(pb_istream_t *stream, const pb_field_t *field,
                     void **arg) {
  int strlen = stream->bytes_left;
  unsigned char buff[strlen];
  if (!pb_read(stream, buff, (size_t)stream->bytes_left)) {
    return false;
  }
  os_memmove((char *)*arg, buff, strlen);
  return true;
}

bool text_callback(pb_istream_t *stream, const pb_field_t *field, void **arg) {
  int strlen = stream->bytes_left;
  if (strlen > 41) {
    size_t length = 41;
    unsigned char buff[45];
    size_t left = stream->bytes_left - length;
    if (!pb_read(stream, buff, length)) {
      return false;
    }
    if (!pb_read(stream, NULL, left)) {
      return false;
    }
    os_memmove((char *)&buff[41], &"...\0", 4);
    os_memmove((char *)*arg, buff, 45);
  } else {
    unsigned char buff[strlen];
    if (!pb_read(stream, buff, (size_t)stream->bytes_left)) {
      return false;
    }
    os_memmove((char *)*arg, buff, strlen);
  }
  return true;
}

bool function_call_callback(pb_istream_t *stream, const pb_field_t *field,
void **arg) {
  unsigned char buff[45];
  uint32_t name_len;
  int len = stream->bytes_left;
  if (!pb_read(stream, buff, 7)) { // read setting 3 bytes and 4 byte of function name size
    return false;
  }
  len -= 7;
  name_len = deserialize_uint32_t(&buff[3]);
  if(name_len > 41) { //if function name len  is 
    if (!pb_read(stream, buff, 41)) { // read 41 byte of the name
      return false;
    }
    len -= 41;
    os_memmove((char *)&buff[41], &"...\0", 4);
    os_memmove((char *)*arg, buff, 45);
    if (!pb_read(stream, NULL, len)) { // read last str to null
      return false;
    }
  } else {
    if (!pb_read(stream, buff, name_len)) { // read all name str
      return false;
    }
    len -= name_len;
    os_memmove((char *)*arg, buff, 45);
    if (!pb_read(stream, NULL, len)) { // read setting 3 bytes and 4 byte of function name size
      return false;
    }
  }
  return true;
}

bool copy_amount(uint64_t amount, int decimals,  unsigned char * out) {
  return print_amount(amount, decimals, out, 20);
}

bool amount_callback(pb_istream_t *stream, const pb_field_t *field,
void **arg) {
  uint64_t value;
  if (!pb_decode_varint(stream, &value))
      return false;
  return copy_amount(value, tmp_ctx.signing_context.amount_decimals, (unsigned char *)*arg);  
}

bool amount2_callback(pb_istream_t *stream, const pb_field_t *field,
void **arg) {
  uint64_t value;
  if (!pb_decode_varint(stream, &value))
      return false;
  return copy_amount(value, tmp_ctx.signing_context.amount2_decimals, (unsigned char *)*arg);  
}



bool transaction_data_callback(pb_istream_t *stream, const pb_field_t *field,
                               void **arg) {
  if (field->tag == waves_Transaction_transfer_tag) {
    waves_TransferTransactionData *tx = field->pData;
    tx->amount.asset_id.funcs.decode = asset_callback;
    tx->amount.asset_id.arg = &tmp_ctx.signing_context.ui.line2;
    tx->attachment.funcs.decode = text_callback;
    tx->attachment.arg = &tmp_ctx.signing_context.ui.line4;
  } else if (field->tag == waves_Transaction_issue_tag) {
    waves_IssueTransactionData *tx = field->pData;
    tx->name.funcs.decode = string_callback;
    tx->name.arg = &tmp_ctx.signing_context.ui.line1;
    tx->description.funcs.decode = text_callback;
    tx->description.arg = &tmp_ctx.signing_context.ui.line2;
  } else if (field->tag == waves_Transaction_reissue_tag) {
    waves_ReissueTransactionData *tx = field->pData;
    tx->asset_amount.asset_id.funcs.decode = asset_callback;
    tx->asset_amount.asset_id.arg = &tmp_ctx.signing_context.ui.line2;
  } else if (field->tag == waves_Transaction_burn_tag) {
    waves_BurnTransactionData *tx = field->pData;
    tx->asset_amount.asset_id.funcs.decode = asset_callback;
    tx->asset_amount.asset_id.arg = &tmp_ctx.signing_context.ui.line2;
  } else if (field->tag == waves_Transaction_lease_cancel_tag) {
    waves_LeaseCancelTransactionData *tx = field->pData;
    tx->lease_id.funcs.decode = asset_callback;
    tx->lease_id.arg = &tmp_ctx.signing_context.ui.line1;
  } else if (field->tag == waves_Transaction_create_alias_tag) {
    waves_CreateAliasTransactionData *tx = field->pData;
    tx->alias.funcs.decode = string_callback;
    tx->alias.arg = &tmp_ctx.signing_context.ui.line1;
  } else if (field->tag == waves_Transaction_mass_transfer_tag) {
    waves_MassTransferTransactionData *tx = field->pData;
    tx->asset_id.funcs.decode = asset_callback;
    tx->asset_id.arg = &tmp_ctx.signing_context.ui.line1;
    tx->attachment.funcs.decode = text_callback;
    tx->attachment.arg = &tmp_ctx.signing_context.ui.line2;
  } else if (field->tag == waves_Transaction_set_asset_script_tag) {
    waves_SetAssetScriptTransactionData *tx = field->pData;
    tx->asset_id.funcs.decode = asset_callback;
    tx->asset_id.arg = &tmp_ctx.signing_context.ui.line1;
  } else if (field->tag == waves_Transaction_sponsor_fee_tag) {
    waves_SponsorFeeTransactionData *tx = field->pData;
    tx->min_fee.asset_id.funcs.decode = asset_callback;
    tx->min_fee.asset_id.arg = &tmp_ctx.signing_context.ui.line2;
  } else if (field->tag == waves_Transaction_update_asset_info_tag) {
    waves_UpdateAssetInfoTransactionData *tx = field->pData;
    tx->asset_id.funcs.decode = asset_callback;
    tx->asset_id.arg = &tmp_ctx.signing_context.ui.line1;
    tx->name.funcs.decode = string_callback;
    tx->name.arg = &tmp_ctx.signing_context.ui.line2;
    tx->description.funcs.decode = text_callback;
    tx->description.arg = &tmp_ctx.signing_context.ui.line3;
  } else if (field->tag == waves_Transaction_invoke_script_tag) {
    waves_InvokeScriptTransactionData *tx = field->pData;
    tx->function_call.funcs.decode = function_call_callback;
    tx->function_call.arg = &tmp_ctx.signing_context.ui.line2;
    tx->payments[0].asset_id.funcs.decode = asset_callback;
    tx->payments[0].asset_id.arg = &tmp_ctx.signing_context.ui.line1;
    tx->payments[1].asset_id.funcs.decode = asset_callback;
    tx->payments[1].asset_id.arg = &tmp_ctx.signing_context.ui.line5;
  } else if (field->tag == waves_Transaction_exchange_tag) {
    waves_ExchangeTransactionData *tx = field->pData;
    
  }
  return true;
}

void make_transfer_ui(waves_Transaction *tx) {
  print_amount(tx->data.transfer.amount.amount,
               tmp_ctx.signing_context.amount_decimals,
               (unsigned char *)tmp_ctx.signing_context.ui.line1, 20);
}

void make_reissue_ui(waves_Transaction *tx) {
  print_amount(tx->data.reissue.asset_amount.amount,
               tmp_ctx.signing_context.amount_decimals,
               (unsigned char *)tmp_ctx.signing_context.ui.line1, 20);
  if (tx->data.reissue.reissuable == true) {
    os_memmove((unsigned char *)&tmp_ctx.signing_context.ui.line3, &"True\0",
               5);
  } else {
    os_memmove((unsigned char *)&tmp_ctx.signing_context.ui.line3, &"False\0",
               6);
  }
}

void make_issue_ui(waves_Transaction *tx) {
  snprintf((char *)tmp_ctx.signing_context.ui.line4,
           sizeof(tmp_ctx.signing_context.ui.line4), "%d",
           tx->data.issue.decimals);
  print_amount(tx->data.issue.amount, (unsigned char)tx->data.issue.decimals,
               (unsigned char *)tmp_ctx.signing_context.ui.line3, 20);
  if (tx->data.issue.reissuable == true) {
    os_memmove((unsigned char *)&tmp_ctx.signing_context.ui.line5, &"True\0",
               5);
  } else {
    os_memmove((unsigned char *)&tmp_ctx.signing_context.ui.line5, &"False\0",
               6);
  }
}

void make_burn_ui(waves_Transaction *tx) {
  print_amount(tx->data.burn.asset_amount.amount,
               tmp_ctx.signing_context.amount_decimals,
               (unsigned char *)tmp_ctx.signing_context.ui.line1, 20);
}

void make_start_leasing_ui(waves_Transaction *tx) {
  print_amount(tx->data.lease.amount, tmp_ctx.signing_context.amount_decimals,
               (unsigned char *)tmp_ctx.signing_context.ui.line1, 20);
}

void make_sponsorship_ui(waves_Transaction *tx) {
  print_amount(tx->data.sponsor_fee.min_fee.amount,
               tmp_ctx.signing_context.amount_decimals,
               (unsigned char *)tmp_ctx.signing_context.ui.line1, 20);
}

void make_invoke_ui(waves_Transaction *tx) {
  if(tx->data.invoke_script.payments_count >= 1) {
      print_amount(tx->data.invoke_script.payments[0].amount, tmp_ctx.signing_context.amount_decimals, (unsigned char *)&tmp_ctx.signing_context.ui.line4, 20);
  }
  if(tx->data.invoke_script.payments_count == 2) {
      print_amount(tx->data.invoke_script.payments[1].amount, tmp_ctx.signing_context.amount_decimals, (unsigned char *)&tmp_ctx.signing_context.ui.line6, 20);
  }
}

void build_protobuf_ui(uiProtobuf_t *ctx, uint8_t *init_buffer,
                       uint8_t init_buffer_size, uint16_t total_buffer_size) {
  uint8_t status;
  waves_Transaction tx = waves_Transaction_init_default;
  tx.cb_data.funcs.decode = transaction_data_callback;
  tx.sender_public_key.funcs.decode = from_callback;
  tx.sender_public_key.arg = &tmp_ctx.signing_context.ui.from;
  tx.fee.asset_id.funcs.decode = asset_callback;
  tx.fee.asset_id.arg = &tmp_ctx.signing_context.ui.fee_asset;

  pb_istream_t stream = pb_istream_from_apdu(ctx, init_buffer, init_buffer_size,
                                             total_buffer_size);
  status = pb_decode(&stream, waves_Transaction_fields, &tx);
  if (!status) {
    PRINTF("Decoding failed: %s\n", PB_GET_ERROR(&stream));
    THROW(0x6D00);
  }
  
  print_amount(tx.fee.amount, tmp_ctx.signing_context.fee_decimals,
               (unsigned char *)tmp_ctx.signing_context.ui.fee_amount, 20);
  unsigned char tx_type = tmp_ctx.signing_context.data_type;
  if (tx_type == 3) {
    make_issue_ui(&tx);
  } else if (tx_type == 4) {
    make_transfer_ui(&tx);
  } else if (tx_type == 5) {
    make_reissue_ui(&tx);
  } else if (tx_type == 6) {
    make_burn_ui(&tx);
  } else if (tx_type == 8) {
    make_start_leasing_ui(&tx);
  } else if (tx_type == 14) {
    make_sponsorship_ui(&tx);
  } else if (tx_type == 16) {
    make_invoke_ui(&tx);
  }
  tmp_ctx.signing_context.step = 7;
  tmp_ctx.signing_context.ui.finished = true;
}
