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

#ifndef __UI_MENUS_NANOX_H__
#define __UI_MENUS_NANOX_H__

#include "os.h"

#include "cx.h"
#include "../ui_logic.h"

//////////////////////////////////////////////////////////////////////
UX_STEP_NOCB(ux_idle_flow_1_step, pnn,
             {
                 &C_icon_waves,
                 "Application",
                 "is ready",
             });
UX_STEP_NOCB(ux_idle_flow_2_step, bn,
             {
                 "Version",
                 APPVERSION,
             });
UX_STEP_VALID(ux_idle_flow_3_step, pb, os_sched_exit(-1),
              {
                  &C_icon_dashboard_x,
                  "Quit",
              });

UX_FLOW(ux_idle_flow, &ux_idle_flow_1_step, &ux_idle_flow_2_step,
        &ux_idle_flow_3_step);

//////////////////////////////////////////////////////////////////////
UX_STEP_NOCB(ux_display_address_flow_1_step, pnn,
             {
                 &C_icon_eye,
                 "Verify",
                 "address",
             });
UX_STEP_NOCB(ux_display_address_flow_4_step, bnnn_paging,
             {
                 .title = "Address",
                 .text = (const char *)tmp_ctx.address_context.address,
             });
UX_STEP_VALID(ux_display_address_flow_5_step, pb,
              io_seproxyhal_touch_address_ok(NULL),
              {
                  &C_icon_validate_14,
                  "Approve",
              });
UX_STEP_VALID(ux_display_address_flow_6_step, pb, io_seproxyhal_cancel(NULL),
              {
                  &C_icon_crossmark,
                  "Reject",
              });

UX_FLOW(ux_display_address_flow, &ux_display_address_flow_1_step,
        &ux_display_address_flow_4_step, &ux_display_address_flow_5_step,
        &ux_display_address_flow_6_step);

//////////////////////////////////////////////////////////////////////

void display_if_buffer_not_empty(const char *buffer, size_t buffer_len) {
  if (strnlen(buffer, buffer_len) == 0) {
    if (G_ux.flow_stack[0].index < G_ux.flow_stack[0].prev_index) {
      ux_flow_prev();
    } else if (G_ux.flow_stack[0].index > G_ux.flow_stack[0].prev_index) {
      ux_flow_next();
    }
  }
}

UX_STEP_NOCB(ux_transfer_1_step, pnn,
             {
                 &C_icon_eye,
                 "Confirm",
                 "Transfer",
             });
UX_STEP_NOCB(ux_transfer_2_step, bnnn_paging,
             {
                 .title = "Amount",
                 .text = (const char *)tmp_ctx.signing_context.ui.line1,
             });
UX_STEP_NOCB(ux_transfer_3_step, bnnn_paging,
             {
                 .title = "Asset",
                 .text = (const char *)tmp_ctx.signing_context.ui.line2,
             });
UX_STEP_NOCB(ux_transfer_4_step, bnnn_paging,
             {
                 .title = "To",
                 .text = (const char *)tmp_ctx.signing_context.ui.line3,
             });
UX_STEP_NOCB(ux_transfer_5_step, bnnn_paging,
             {
                 .title = "Fee",
                 .text = (const char *)tmp_ctx.signing_context.ui.fee_amount,
             });
UX_STEP_NOCB(ux_transfer_6_step, bnnn_paging,
             {
                 .title = "Fee asset",
                 .text = (const char *)tmp_ctx.signing_context.ui.fee_asset,
             });
UX_STEP_NOCB_INIT(
    ux_transfer_7_step, bnnn_paging,
    display_if_buffer_not_empty((const char *)tmp_ctx.signing_context.ui.line4,
                                sizeof(tmp_ctx.signing_context.ui.line4)),
    {
        .title = "Attachment",
        .text = (const char *)tmp_ctx.signing_context.ui.line4,
    });
UX_STEP_NOCB(ux_transfer_8_step, bnnn_paging,
             {
                 .title = "From",
                 .text = (const char *)tmp_ctx.signing_context.ui.from,
             });
UX_STEP_NOCB(ux_transfer_9_step, bnnn_paging,
             {
                 .title = "Transaction Id",
                 .text = (const char *)tmp_ctx.signing_context.ui.txid,
             });
UX_STEP_VALID(ux_transfer_10_step, pbb, io_seproxyhal_touch_sign_approve(NULL),
              {
                  &C_icon_validate_14,
                  "Accept",
                  "and send",
              });
UX_STEP_VALID(ux_transfer_11_step, pb, io_seproxyhal_cancel(NULL),
              {
                  &C_icon_crossmark,
                  "Reject",
              });

UX_FLOW(ux_transfer_flow, &ux_transfer_1_step, &ux_transfer_2_step,
        &ux_transfer_3_step, &ux_transfer_4_step, &ux_transfer_5_step,
        &ux_transfer_6_step, &ux_transfer_7_step, &ux_transfer_8_step,
        &ux_transfer_9_step, &ux_transfer_10_step, &ux_transfer_11_step);

//////////////////////////////////////////////////////////////////////

UX_STEP_NOCB(ux_data_1_step, pnn,
             {
                 &C_icon_eye,
                 "Confirm",
                 "Data transaction",
             });
UX_STEP_NOCB(ux_data_2_step, bnnn_paging,
             {
                 .title = "Fee",
                 .text = (const char *)tmp_ctx.signing_context.ui.fee_amount,
             });
UX_STEP_NOCB(ux_data_3_step, bnnn_paging,
             {
                 .title = "Fee asset",
                 .text = (const char *)tmp_ctx.signing_context.ui.fee_asset,
             });
UX_STEP_NOCB(ux_data_4_step, bnnn_paging,
             {
                 .title = "From",
                 .text = (const char *)tmp_ctx.signing_context.ui.from,
             });

UX_STEP_NOCB(ux_data_5_step, bnnn_paging,
             {
                 .title = "Transaction Id",
                 .text = (const char *)tmp_ctx.signing_context.ui.txid,
             });
UX_STEP_VALID(ux_data_6_step, pbb, io_seproxyhal_touch_sign_approve(NULL),
              {
                  &C_icon_validate_14,
                  "Accept",
                  "and send",
              });
UX_STEP_VALID(ux_data_7_step, pb, io_seproxyhal_cancel(NULL),
              {
                  &C_icon_crossmark,
                  "Reject",
              });

UX_FLOW(ux_data_flow, &ux_data_1_step, &ux_data_2_step, &ux_data_3_step,
        &ux_data_4_step, &ux_data_5_step, &ux_data_6_step, &ux_data_7_step);

//////////////////////////////////////////////////////////////////////

UX_STEP_NOCB(ux_issue_1_step, pnn,
             {
                 &C_icon_eye,
                 "Confirm",
                 "Asset issue",
             });
UX_STEP_NOCB(ux_issue_2_step, bnnn_paging,
             {
                 .title = "Name",
                 .text = (const char *)tmp_ctx.signing_context.ui.line1,
             });
UX_STEP_NOCB(ux_issue_3_step, bnnn_paging,
             {
                 .title = "Description",
                 .text = (const char *)tmp_ctx.signing_context.ui.line2,
             });
UX_STEP_NOCB(ux_issue_4_step, bnnn_paging,
             {
                 .title = "Amount",
                 .text = (const char *)tmp_ctx.signing_context.ui.line3,
             });
UX_STEP_NOCB(ux_issue_5_step, bnnn_paging,
             {
                 .title = "Decimals",
                 .text = (const char *)tmp_ctx.signing_context.ui.line4,
             });
UX_STEP_NOCB(ux_issue_6_step, bnnn_paging,
             {
                 .title = "Reissuable",
                 .text = (const char *)tmp_ctx.signing_context.ui.line5,
             });
UX_STEP_NOCB(ux_issue_7_step, bnnn_paging,
             {
                 .title = "Fee",
                 .text = (const char *)tmp_ctx.signing_context.ui.fee_amount,
             });
UX_STEP_NOCB(ux_issue_8_step, bnnn_paging,
             {
                 .title = "Fee asset",
                 .text = (const char *)tmp_ctx.signing_context.ui.fee_asset,
             });
UX_STEP_NOCB(ux_issue_9_step, bnnn_paging,
             {
                 .title = "From",
                 .text = (const char *)tmp_ctx.signing_context.ui.from,
             });

UX_STEP_NOCB(ux_issue_10_step, bnnn_paging,
             {
                 .title = "Transaction Id",
                 .text = (const char *)tmp_ctx.signing_context.ui.txid,
             });
UX_STEP_VALID(ux_issue_11_step, pbb, io_seproxyhal_touch_sign_approve(NULL),
              {
                  &C_icon_validate_14,
                  "Accept",
                  "and send",
              });
UX_STEP_VALID(ux_issue_12_step, pb, io_seproxyhal_cancel(NULL),
              {
                  &C_icon_crossmark,
                  "Reject",
              });

UX_FLOW(ux_issue_flow, &ux_issue_1_step, &ux_issue_2_step, &ux_issue_3_step,
        &ux_issue_4_step, &ux_issue_5_step, &ux_issue_6_step, &ux_issue_7_step,
        &ux_issue_8_step, &ux_issue_9_step, &ux_issue_10_step,
        &ux_issue_11_step, &ux_issue_12_step);

//////////////////////////////////////////////////////////////////////

UX_STEP_NOCB(ux_reissue_1_step, pnn,
             {
                 &C_icon_eye,
                 "Confirm",
                 "Asset reissue",
             });
UX_STEP_NOCB(ux_reissue_2_step, bnnn_paging,
             {
                 .title = "Amount",
                 .text = (const char *)tmp_ctx.signing_context.ui.line1,
             });
UX_STEP_NOCB(ux_reissue_3_step, bnnn_paging,
             {
                 .title = "Asset",
                 .text = (const char *)tmp_ctx.signing_context.ui.line2,
             });
UX_STEP_NOCB(ux_reissue_4_step, bnnn_paging,
             {
                 .title = "Reissuable",
                 .text = (const char *)tmp_ctx.signing_context.ui.line3,
             });
UX_STEP_NOCB(ux_reissue_5_step, bnnn_paging,
             {
                 .title = "Fee",
                 .text = (const char *)tmp_ctx.signing_context.ui.fee_amount,
             });
UX_STEP_NOCB(ux_reissue_6_step, bnnn_paging,
             {
                 .title = "Fee asset",
                 .text = (const char *)tmp_ctx.signing_context.ui.fee_asset,
             });
UX_STEP_NOCB(ux_reissue_7_step, bnnn_paging,
             {
                 .title = "From",
                 .text = (const char *)tmp_ctx.signing_context.ui.from,
             });

UX_STEP_NOCB(ux_reissue_8_step, bnnn_paging,
             {
                 .title = "Transaction Id",
                 .text = (const char *)tmp_ctx.signing_context.ui.txid,
             });
UX_STEP_VALID(ux_reissue_9_step, pbb, io_seproxyhal_touch_sign_approve(NULL),
              {
                  &C_icon_validate_14,
                  "Accept",
                  "and send",
              });
UX_STEP_VALID(ux_reissue_10_step, pb, io_seproxyhal_cancel(NULL),
              {
                  &C_icon_crossmark,
                  "Reject",
              });

UX_FLOW(ux_reissue_flow, &ux_reissue_1_step, &ux_reissue_2_step,
        &ux_reissue_3_step, &ux_reissue_4_step, &ux_reissue_5_step,
        &ux_reissue_6_step, &ux_reissue_7_step, &ux_reissue_8_step,
        &ux_reissue_9_step, &ux_reissue_10_step);

//////////////////////////////////////////////////////////////////////

UX_STEP_NOCB(ux_burn_1_step, pnn,
             {
                 &C_icon_eye,
                 "Confirm",
                 "Asset burn",
             });
UX_STEP_NOCB(ux_burn_2_step, bnnn_paging,
             {
                 .title = "Amount",
                 .text = (const char *)tmp_ctx.signing_context.ui.line1,
             });
UX_STEP_NOCB(ux_burn_3_step, bnnn_paging,
             {
                 .title = "Asset",
                 .text = (const char *)tmp_ctx.signing_context.ui.line2,
             });
UX_STEP_NOCB(ux_burn_4_step, bnnn_paging,
             {
                 .title = "Fee",
                 .text = (const char *)tmp_ctx.signing_context.ui.fee_amount,
             });
UX_STEP_NOCB(ux_burn_5_step, bnnn_paging,
             {
                 .title = "Fee asset",
                 .text = (const char *)tmp_ctx.signing_context.ui.fee_asset,
             });
UX_STEP_NOCB(ux_burn_6_step, bnnn_paging,
             {
                 .title = "From",
                 .text = (const char *)tmp_ctx.signing_context.ui.from,
             });

UX_STEP_NOCB(ux_burn_7_step, bnnn_paging,
             {
                 .title = "Transaction Id",
                 .text = (const char *)tmp_ctx.signing_context.ui.txid,
             });
UX_STEP_VALID(ux_burn_8_step, pbb, io_seproxyhal_touch_sign_approve(NULL),
              {
                  &C_icon_validate_14,
                  "Accept",
                  "and send",
              });
UX_STEP_VALID(ux_burn_9_step, pb, io_seproxyhal_cancel(NULL),
              {
                  &C_icon_crossmark,
                  "Reject",
              });

UX_FLOW(ux_burn_flow, &ux_burn_1_step, &ux_burn_2_step, &ux_burn_3_step,
        &ux_burn_4_step, &ux_burn_5_step, &ux_burn_6_step, &ux_burn_7_step,
        &ux_burn_8_step, &ux_burn_9_step);

//////////////////////////////////////////////////////////////////////

UX_STEP_NOCB(ux_lease_1_step, pnn,
             {
                 &C_icon_eye,
                 "Confirm",
                 "Asset leasing",
             });
UX_STEP_NOCB(ux_lease_2_step, bnnn_paging,
             {
                 .title = "Amount",
                 .text = (const char *)tmp_ctx.signing_context.ui.line1,
             });
UX_STEP_NOCB(ux_lease_3_step, bnnn_paging,
             {
                 .title = "To",
                 .text = (const char *)tmp_ctx.signing_context.ui.line3,
             });
UX_STEP_NOCB(ux_lease_4_step, bnnn_paging,
             {
                 .title = "Fee",
                 .text = (const char *)tmp_ctx.signing_context.ui.fee_amount,
             });
UX_STEP_NOCB(ux_lease_5_step, bnnn_paging,
             {
                 .title = "Fee asset",
                 .text = (const char *)tmp_ctx.signing_context.ui.fee_asset,
             });
UX_STEP_NOCB(ux_lease_6_step, bnnn_paging,
             {
                 .title = "From",
                 .text = (const char *)tmp_ctx.signing_context.ui.from,
             });

UX_STEP_NOCB(ux_lease_7_step, bnnn_paging,
             {
                 .title = "Transaction Id",
                 .text = (const char *)tmp_ctx.signing_context.ui.txid,
             });
UX_STEP_VALID(ux_lease_8_step, pbb, io_seproxyhal_touch_sign_approve(NULL),
              {
                  &C_icon_validate_14,
                  "Accept",
                  "and send",
              });
UX_STEP_VALID(ux_lease_9_step, pb, io_seproxyhal_cancel(NULL),
              {
                  &C_icon_crossmark,
                  "Reject",
              });

UX_FLOW(ux_lease_flow, &ux_lease_1_step, &ux_lease_2_step, &ux_lease_3_step,
        &ux_lease_4_step, &ux_lease_5_step, &ux_lease_6_step, &ux_lease_7_step,
        &ux_lease_8_step, &ux_lease_9_step);

//////////////////////////////////////////////////////////////////////

UX_STEP_NOCB(ux_cancel_lease_1_step, pnn,
             {
                 &C_icon_eye,
                 "Confirm",
                 "Asset leasing cancel",
             });
UX_STEP_NOCB(ux_cancel_lease_2_step, bnnn_paging,
             {
                 .title = "Lease id",
                 .text = (const char *)tmp_ctx.signing_context.ui.line1,
             });
UX_STEP_NOCB(ux_cancel_lease_3_step, bnnn_paging,
             {
                 .title = "Fee",
                 .text = (const char *)tmp_ctx.signing_context.ui.fee_amount,
             });
UX_STEP_NOCB(ux_cancel_lease_4_step, bnnn_paging,
             {
                 .title = "Fee asset",
                 .text = (const char *)tmp_ctx.signing_context.ui.fee_asset,
             });
UX_STEP_NOCB(ux_cancel_lease_5_step, bnnn_paging,
             {
                 .title = "From",
                 .text = (const char *)tmp_ctx.signing_context.ui.from,
             });

UX_STEP_NOCB(ux_cancel_lease_6_step, bnnn_paging,
             {
                 .title = "Transaction Id",
                 .text = (const char *)tmp_ctx.signing_context.ui.txid,
             });
UX_STEP_VALID(ux_cancel_lease_7_step, pbb,
              io_seproxyhal_touch_sign_approve(NULL),
              {
                  &C_icon_validate_14,
                  "Accept",
                  "and send",
              });
UX_STEP_VALID(ux_cancel_lease_8_step, pb, io_seproxyhal_cancel(NULL),
              {
                  &C_icon_crossmark,
                  "Reject",
              });

UX_FLOW(ux_cancel_lease_flow, &ux_cancel_lease_1_step, &ux_cancel_lease_2_step,
        &ux_cancel_lease_3_step, &ux_cancel_lease_4_step,
        &ux_cancel_lease_5_step, &ux_cancel_lease_6_step,
        &ux_cancel_lease_7_step, &ux_cancel_lease_8_step);

//////////////////////////////////////////////////////////////////////

UX_STEP_NOCB(ux_create_alias_1_step, pnn,
             {
                 &C_icon_eye,
                 "Confirm",
                 "Creating alias",
             });
UX_STEP_NOCB(ux_create_alias_2_step, bnnn_paging,
             {
                 .title = "Alias",
                 .text = (const char *)tmp_ctx.signing_context.ui.line1,
             });
UX_STEP_NOCB(ux_create_alias_3_step, bnnn_paging,
             {
                 .title = "Fee",
                 .text = (const char *)tmp_ctx.signing_context.ui.fee_amount,
             });
UX_STEP_NOCB(ux_create_alias_4_step, bnnn_paging,
             {
                 .title = "Fee asset",
                 .text = (const char *)tmp_ctx.signing_context.ui.fee_asset,
             });
UX_STEP_NOCB(ux_create_alias_5_step, bnnn_paging,
             {
                 .title = "From",
                 .text = (const char *)tmp_ctx.signing_context.ui.from,
             });

UX_STEP_NOCB(ux_create_alias_6_step, bnnn_paging,
             {
                 .title = "Transaction Id",
                 .text = (const char *)tmp_ctx.signing_context.ui.txid,
             });
UX_STEP_VALID(ux_create_alias_7_step, pbb,
              io_seproxyhal_touch_sign_approve(NULL),
              {
                  &C_icon_validate_14,
                  "Accept",
                  "and send",
              });
UX_STEP_VALID(ux_create_alias_8_step, pb, io_seproxyhal_cancel(NULL),
              {
                  &C_icon_crossmark,
                  "Reject",
              });

UX_FLOW(ux_create_alias_flow, &ux_create_alias_1_step, &ux_create_alias_2_step,
        &ux_create_alias_3_step, &ux_create_alias_4_step,
        &ux_create_alias_5_step, &ux_create_alias_6_step,
        &ux_create_alias_7_step, &ux_create_alias_8_step);

//////////////////////////////////////////////////////////////////////

UX_STEP_NOCB(ux_masstransfer_1_step, pnn,
             {
                 &C_icon_eye,
                 "Confirm",
                 "Mass transfer",
             });
UX_STEP_NOCB(ux_masstransfer_2_step, bnnn_paging,
             {
                 .title = "Asset",
                 .text = (const char *)tmp_ctx.signing_context.ui.line1,
             });
UX_STEP_NOCB(ux_masstransfer_3_step, bnnn_paging,
             {
                 .title = "Fee",
                 .text = (const char *)tmp_ctx.signing_context.ui.fee_amount,
             });
UX_STEP_NOCB(ux_masstransfer_4_step, bnnn_paging,
             {
                 .title = "Fee asset",
                 .text = (const char *)tmp_ctx.signing_context.ui.fee_asset,
             });
UX_STEP_NOCB_INIT(
    ux_masstransfer_5_step, bnnn_paging,
    display_if_buffer_not_empty((const char *)tmp_ctx.signing_context.ui.line2,
                                sizeof(tmp_ctx.signing_context.ui.line2)),
    {
        .title = "Attachment",
        .text = (const char *)tmp_ctx.signing_context.ui.line2,
    });
UX_STEP_NOCB(ux_masstransfer_6_step, bnnn_paging,
             {
                 .title = "From",
                 .text = (const char *)tmp_ctx.signing_context.ui.from,
             });
UX_STEP_NOCB(ux_masstransfer_7_step, bnnn_paging,
             {
                 .title = "Transaction Id",
                 .text = (const char *)tmp_ctx.signing_context.ui.txid,
             });
UX_STEP_VALID(ux_masstransfer_8_step, pbb,
              io_seproxyhal_touch_sign_approve(NULL),
              {
                  &C_icon_validate_14,
                  "Accept",
                  "and send",
              });
UX_STEP_VALID(ux_masstransfer_9_step, pb, io_seproxyhal_cancel(NULL),
              {
                  &C_icon_crossmark,
                  "Reject",
              });

UX_FLOW(ux_masstransfer_flow, &ux_masstransfer_1_step, &ux_masstransfer_2_step,
        &ux_masstransfer_3_step, &ux_masstransfer_4_step,
        &ux_masstransfer_5_step, &ux_masstransfer_6_step,
        &ux_masstransfer_7_step, &ux_masstransfer_8_step,
        &ux_masstransfer_9_step);

//////////////////////////////////////////////////////////////////////

UX_STEP_NOCB(ux_set_ac_script_1_step, pnn,
             {
                 &C_icon_eye,
                 "Confirm",
                 "Set account script",
             });
UX_STEP_NOCB(ux_set_ac_script_2_step, bnnn_paging,
             {
                 .title = "Fee",
                 .text = (const char *)tmp_ctx.signing_context.ui.fee_amount,
             });
UX_STEP_NOCB(ux_set_ac_script_3_step, bnnn_paging,
             {
                 .title = "Fee asset",
                 .text = (const char *)tmp_ctx.signing_context.ui.fee_asset,
             });
UX_STEP_NOCB(ux_set_ac_script_4_step, bnnn_paging,
             {
                 .title = "From",
                 .text = (const char *)tmp_ctx.signing_context.ui.from,
             });

UX_STEP_NOCB(ux_set_ac_script_5_step, bnnn_paging,
             {
                 .title = "Transaction Id",
                 .text = (const char *)tmp_ctx.signing_context.ui.txid,
             });
UX_STEP_VALID(ux_set_ac_script_6_step, pbb,
              io_seproxyhal_touch_sign_approve(NULL),
              {
                  &C_icon_validate_14,
                  "Accept",
                  "and send",
              });
UX_STEP_VALID(ux_set_ac_script_7_step, pb, io_seproxyhal_cancel(NULL),
              {
                  &C_icon_crossmark,
                  "Reject",
              });

UX_FLOW(ux_set_ac_script_flow, &ux_set_ac_script_1_step,
        &ux_set_ac_script_2_step, &ux_set_ac_script_3_step,
        &ux_set_ac_script_4_step, &ux_set_ac_script_5_step,
        &ux_set_ac_script_6_step, &ux_set_ac_script_7_step);

//////////////////////////////////////////////////////////////////////

UX_STEP_NOCB(ux_set_as_script_1_step, pnn,
             {
                 &C_icon_eye,
                 "Confirm",
                 "Set asset script",
             });
UX_STEP_NOCB(ux_set_as_script_2_step, bnnn_paging,
             {
                 .title = "Asset",
                 .text = (const char *)tmp_ctx.signing_context.ui.line1,
             });
UX_STEP_NOCB(ux_set_as_script_3_step, bnnn_paging,
             {
                 .title = "Fee",
                 .text = (const char *)tmp_ctx.signing_context.ui.fee_amount,
             });
UX_STEP_NOCB(ux_set_as_script_4_step, bnnn_paging,
             {
                 .title = "Fee asset",
                 .text = (const char *)tmp_ctx.signing_context.ui.fee_asset,
             });
UX_STEP_NOCB(ux_set_as_script_5_step, bnnn_paging,
             {
                 .title = "From",
                 .text = (const char *)tmp_ctx.signing_context.ui.from,
             });

UX_STEP_NOCB(ux_set_as_script_6_step, bnnn_paging,
             {
                 .title = "Transaction Id",
                 .text = (const char *)tmp_ctx.signing_context.ui.txid,
             });
UX_STEP_VALID(ux_set_as_script_7_step, pbb,
              io_seproxyhal_touch_sign_approve(NULL),
              {
                  &C_icon_validate_14,
                  "Accept",
                  "and send",
              });
UX_STEP_VALID(ux_set_as_script_8_step, pb, io_seproxyhal_cancel(NULL),
              {
                  &C_icon_crossmark,
                  "Reject",
              });

UX_FLOW(ux_set_as_script_flow, &ux_set_as_script_1_step,
        &ux_set_as_script_2_step, &ux_set_as_script_3_step,
        &ux_set_as_script_4_step, &ux_set_as_script_5_step,
        &ux_set_as_script_6_step, &ux_set_as_script_7_step,
        &ux_set_as_script_8_step);

//////////////////////////////////////////////////////////////////////

UX_STEP_NOCB(ux_sponsorship_1_step, pnn,
             {
                 &C_icon_eye,
                 "Confirm",
                 "Fee sponsoring",
             });
UX_STEP_NOCB(ux_sponsorship_2_step, bnnn_paging,
             {
                 .title = "Amount",
                 .text = (const char *)tmp_ctx.signing_context.ui.line1,
             });
UX_STEP_NOCB(ux_sponsorship_3_step, bnnn_paging,
             {
                 .title = "Asset",
                 .text = (const char *)tmp_ctx.signing_context.ui.line2,
             });
UX_STEP_NOCB(ux_sponsorship_4_step, bnnn_paging,
             {
                 .title = "Fee",
                 .text = (const char *)tmp_ctx.signing_context.ui.fee_amount,
             });
UX_STEP_NOCB(ux_sponsorship_5_step, bnnn_paging,
             {
                 .title = "Fee asset",
                 .text = (const char *)tmp_ctx.signing_context.ui.fee_asset,
             });
UX_STEP_NOCB(ux_sponsorship_6_step, bnnn_paging,
             {
                 .title = "From",
                 .text = (const char *)tmp_ctx.signing_context.ui.from,
             });

UX_STEP_NOCB(ux_sponsorship_7_step, bnnn_paging,
             {
                 .title = "Transaction Id",
                 .text = (const char *)tmp_ctx.signing_context.ui.txid,
             });
UX_STEP_VALID(ux_sponsorship_8_step, pbb,
              io_seproxyhal_touch_sign_approve(NULL),
              {
                  &C_icon_validate_14,
                  "Accept",
                  "and send",
              });
UX_STEP_VALID(ux_sponsorship_9_step, pb, io_seproxyhal_cancel(NULL),
              {
                  &C_icon_crossmark,
                  "Reject",
              });

UX_FLOW(ux_sponsorship_flow, &ux_sponsorship_1_step, &ux_sponsorship_2_step,
        &ux_sponsorship_3_step, &ux_sponsorship_4_step, &ux_sponsorship_5_step,
        &ux_sponsorship_6_step, &ux_sponsorship_7_step, &ux_sponsorship_8_step,
        &ux_sponsorship_9_step);

//////////////////////////////////////////////////////////////////////

UX_STEP_NOCB(ux_update_asset_1_step, pnn,
             {
                 &C_icon_eye,
                 "Confirm",
                 "Update asset info",
             });
UX_STEP_NOCB(ux_update_asset_2_step, bnnn_paging,
             {
                 .title = "Asset",
                 .text = (const char *)tmp_ctx.signing_context.ui.line1,
             });
UX_STEP_NOCB(ux_update_asset_3_step, bnnn_paging,
             {
                 .title = "Name",
                 .text = (const char *)tmp_ctx.signing_context.ui.line2,
             });
UX_STEP_NOCB(ux_update_asset_4_step, bnnn_paging,
             {
                 .title = "Description",
                 .text = (const char *)tmp_ctx.signing_context.ui.line3,
             });
UX_STEP_NOCB(ux_update_asset_5_step, bnnn_paging,
             {
                 .title = "Fee",
                 .text = (const char *)tmp_ctx.signing_context.ui.fee_amount,
             });
UX_STEP_NOCB(ux_update_asset_6_step, bnnn_paging,
             {
                 .title = "Fee asset",
                 .text = (const char *)tmp_ctx.signing_context.ui.fee_asset,
             });
UX_STEP_NOCB(ux_update_asset_7_step, bnnn_paging,
             {
                 .title = "From",
                 .text = (const char *)tmp_ctx.signing_context.ui.from,
             });

UX_STEP_NOCB(ux_update_asset_8_step, bnnn_paging,
             {
                 .title = "Transaction Id",
                 .text = (const char *)tmp_ctx.signing_context.ui.txid,
             });
UX_STEP_VALID(ux_update_asset_9_step, pbb,
              io_seproxyhal_touch_sign_approve(NULL),
              {
                  &C_icon_validate_14,
                  "Accept",
                  "and send",
              });
UX_STEP_VALID(ux_update_asset_10_step, pb, io_seproxyhal_cancel(NULL),
              {
                  &C_icon_crossmark,
                  "Reject",
              });

UX_FLOW(ux_update_asset_flow, &ux_update_asset_1_step, &ux_update_asset_2_step,
        &ux_update_asset_3_step, &ux_update_asset_4_step,
        &ux_update_asset_5_step, &ux_update_asset_6_step,
        &ux_update_asset_7_step, &ux_update_asset_8_step,
        &ux_update_asset_9_step, &ux_update_asset_10_step);

//////////////////////////////////////////////////////////////////////
UX_STEP_NOCB(ux_invoke_1_step, pnn,
             {
                 &C_icon_eye,
                 "Confirm",
                 "Script invocation",
             });
UX_STEP_NOCB(ux_invoke_2_step, bnnn_paging,
             {
                 .title = "dApp",
                 .text = (const char *)tmp_ctx.signing_context.ui.line3,
             });
UX_STEP_NOCB(ux_invoke_3_step, bnnn_paging,
             {
                 .title = "Function",
                 .text = (const char *)tmp_ctx.signing_context.ui.line2,
             });
UX_STEP_NOCB_INIT(
    ux_invoke_4_step, bnnn_paging,
    display_if_buffer_not_empty((const char *)tmp_ctx.signing_context.ui.line4,
                                sizeof(tmp_ctx.signing_context.ui.line4)),
    {
        .title = "Payment 1 amount",
        .text = (const char *)tmp_ctx.signing_context.ui.line4,
    });
UX_STEP_NOCB_INIT(
    ux_invoke_5_step, bnnn_paging,
    display_if_buffer_not_empty((const char *)tmp_ctx.signing_context.ui.line1,
                                sizeof(tmp_ctx.signing_context.ui.line1)),
    {
        .title = "Payment 1 asset",
        .text = (const char *)tmp_ctx.signing_context.ui.line1,
    });
UX_STEP_NOCB_INIT(
    ux_invoke_6_step, bnnn_paging,
    display_if_buffer_not_empty((const char *)tmp_ctx.signing_context.ui.line6,
                                sizeof(tmp_ctx.signing_context.ui.line6)),
    {
        .title = "Payment 2 amount",
        .text = (const char *)tmp_ctx.signing_context.ui.line6,
    });
UX_STEP_NOCB_INIT(
    ux_invoke_7_step, bnnn_paging,
    display_if_buffer_not_empty((const char *)tmp_ctx.signing_context.ui.line5,
                                sizeof(tmp_ctx.signing_context.ui.line5)),
    {
        .title = "Payment 2 asset",
        .text = (const char *)tmp_ctx.signing_context.ui.line5,
    });
UX_STEP_NOCB(ux_invoke_8_step, bnnn_paging,
             {
                 .title = "Fee",
                 .text = (const char *)tmp_ctx.signing_context.ui.fee_amount,
             });
UX_STEP_NOCB(ux_invoke_9_step, bnnn_paging,
             {
                 .title = "Fee asset",
                 .text = (const char *)tmp_ctx.signing_context.ui.fee_asset,
             });
UX_STEP_NOCB(ux_invoke_10_step, bnnn_paging,
             {
                 .title = "From",
                 .text = (const char *)tmp_ctx.signing_context.ui.from,
             });
UX_STEP_NOCB(ux_invoke_11_step, bnnn_paging,
             {
                 .title = "Transaction Id",
                 .text = (const char *)tmp_ctx.signing_context.ui.txid,
             });
UX_STEP_VALID(ux_invoke_12_step, pbb, io_seproxyhal_touch_sign_approve(NULL),
              {
                  &C_icon_validate_14,
                  "Accept",
                  "and send",
              });
UX_STEP_VALID(ux_invoke_13_step, pb, io_seproxyhal_cancel(NULL),
              {
                  &C_icon_crossmark,
                  "Reject",
              });

UX_FLOW(ux_invoke_flow, &ux_invoke_1_step, &ux_invoke_2_step, &ux_invoke_3_step,
        &ux_invoke_4_step, &ux_invoke_5_step, &ux_invoke_6_step,
        &ux_invoke_7_step, &ux_invoke_8_step, &ux_invoke_9_step,
        &ux_invoke_10_step, &ux_invoke_11_step, &ux_invoke_12_step,
        &ux_invoke_13_step);

//////////////////////////////////////////////////////////////////////

UX_STEP_NOCB(ux_order_1_step, pnn,
             {
                 &C_icon_eye,
                 "Confirm",
                 (const char *)tmp_ctx.signing_context.ui.line1,
             });
UX_STEP_NOCB(ux_order_2_step, bnnn_paging,
             {
                 .title = "Amount",
                 .text = (const char *)tmp_ctx.signing_context.ui.line4,
             });
UX_STEP_NOCB(ux_order_3_step, bnnn_paging,
             {
                 .title = "Amount asset",
                 .text = (const char *)tmp_ctx.signing_context.ui.line3,
             });
UX_STEP_NOCB(ux_order_4_step, bnnn_paging,
             {
                 .title = "From",
                 .text = (const char *)tmp_ctx.signing_context.ui.from,
             });
UX_STEP_NOCB(ux_order_5_step, bnnn_paging,
             {
                 .title = "Matcher",
                 .text = (const char *)tmp_ctx.signing_context.ui.line2,
             });
UX_STEP_NOCB(ux_order_6_step, bnnn_paging,
             {
                 .title = "Matcher Fee",
                 .text = (const char *)tmp_ctx.signing_context.ui.fee_amount,
             });
UX_STEP_NOCB(ux_order_7_step, bnnn_paging,
             {
                 .title = "Fee asset",
                 .text = (const char *)tmp_ctx.signing_context.ui.fee_asset,
             });

UX_STEP_NOCB(ux_order_8_step, bnnn_paging,
             {
                 .title = "Hash",
                 .text = (const char *)tmp_ctx.signing_context.ui.txid,
             });
UX_STEP_VALID(ux_order_9_step, pbb, io_seproxyhal_touch_sign_approve(NULL),
              {
                  &C_icon_validate_14,
                  "Accept",
                  "and send",
              });
UX_STEP_VALID(ux_order_10_step, pb, io_seproxyhal_cancel(NULL),
              {
                  &C_icon_crossmark,
                  "Reject",
              });

UX_FLOW(ux_order_flow, &ux_order_1_step, &ux_order_2_step, &ux_order_3_step,
        &ux_order_4_step, &ux_order_5_step, &ux_order_6_step, &ux_order_7_step,
        &ux_order_8_step, &ux_order_9_step, &ux_order_10_step);

//////////////////////////////////////////////////////////////////////

UX_STEP_NOCB(ux_verify_transaction_1_step, bnnn_paging,
             {.title = "Confirm",
              .text = (const char *)tmp_ctx.signing_context.ui.line1});
UX_STEP_NOCB(ux_verify_transaction_2_step, bnnn_paging,
             {
                 .title = (const char *)tmp_ctx.signing_context.ui.line2,
                 .text = (const char *)tmp_ctx.signing_context.ui.line3,
             });
UX_STEP_NOCB(ux_verify_transaction_3_step, bnnn_paging,
             {
                 .title = "From",
                 .text = (const char *)tmp_ctx.signing_context.ui.from,
             });
UX_STEP_VALID(ux_verify_transaction_4_step, pbb,
              io_seproxyhal_touch_sign_approve(NULL),
              {
                  &C_icon_validate_14,
                  "Accept",
                  "and sign",
              });
UX_STEP_VALID(ux_verify_transaction_5_step, pb, io_seproxyhal_cancel(NULL),
              {
                  &C_icon_crossmark,
                  "Reject",
              });

UX_FLOW(ux_verify_transaction_flow, &ux_verify_transaction_1_step,
        &ux_verify_transaction_2_step, &ux_verify_transaction_3_step,
        &ux_verify_transaction_4_step, &ux_verify_transaction_5_step);

//////////////////////////////////////////////////////////////////////

UX_STEP_NOCB(ux_processing_step, pb,
             {
                 &C_badge_loading_v2,
                 "Processing",
             });

UX_FLOW(ux_processing_flow, &ux_processing_step);

//////////////////////////////////////////////////////////////////////

#endif