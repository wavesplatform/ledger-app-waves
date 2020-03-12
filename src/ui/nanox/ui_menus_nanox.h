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
#include "ux.h"
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
                 "Review",
                 "transfer",
             });
UX_STEP_NOCB(ux_transfer_2_step, bnnn_paging,
             {
                 .title = "Amount",
                 .text = (const char *)ui_context.line1,
             });
UX_STEP_NOCB(ux_transfer_3_step, bnnn_paging,
             {
                 .title = "Asset",
                 .text = (const char *)ui_context.line2,
             });
UX_STEP_NOCB(ux_transfer_4_step, bnnn_paging,
             {
                 .title = "To",
                 .text = (const char *)ui_context.line3,
             });
UX_STEP_NOCB(ux_transfer_5_step, bnnn_paging,
             {
                 .title = "Fee",
                 .text = (const char *)ui_context.line4,
             });
UX_STEP_NOCB(ux_transfer_6_step, bnnn_paging,
             {
                 .title = "Fee asset",
                 .text = (const char *)ui_context.line5,
             });
UX_STEP_NOCB_INIT(ux_transfer_7_step, bnnn_paging,
                  display_if_buffer_not_empty((const char *)ui_context.line6,
                                              sizeof(ui_context.line6)),
                  {
                      .title = "Attachment",
                      .text = (const char *)ui_context.line6,
                  });
UX_STEP_NOCB(ux_transfer_8_step, bnnn_paging,
             {
                 .title = "From",
                 .text = (const char *)ui_context.line7,
             });
UX_STEP_NOCB(ux_transfer_9_step, bnnn_paging,
             {
                 .title = "Transaction Id",
                 .text = (const char *)ui_context.line8,
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

UX_STEP_NOCB(ux_verify_transaction_1_step, bnnn_paging,
             {.title = "Confirm", .text = (const char *)ui_context.line1});
UX_STEP_NOCB(ux_verify_transaction_2_step, bnnn_paging,
             {
                 .title = (const char *)ui_context.line2,
                 .text = (const char *)ui_context.line3,
             });
UX_STEP_NOCB(ux_verify_transaction_3_step, bnnn_paging,
             {
                 .title = "From",
                 .text = (const char *)ui_context.line4,
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

#endif