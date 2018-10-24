
/*******************************************************************************
*   Burstcoin Wallet App for Nano Ledger S. Updated By Waves community.
*   Copyright (c) 2017-2018 Jake B.
* 
*   Based on Sample code provided and (c) 2016 Ledger
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
#include "glyphs.h"
#include "main.h"
#include "crypto/waves.h"
#include "ui_menus.h"
#include "ui_menus_buttons.h"
#include "ui_menus_prepro.h"

ux_state_t ux;

// UI currently displayed
enum UI_STATE ui_state;

int ux_step, ux_step_count;

bool print_amount(uint64_t amount, int decimals, unsigned char *out, uint8_t len);

void menu_address_init() {
    ux_step = 0;
    ux_step_count = 2;
    UX_DISPLAY(ui_address_nanos, ui_address_prepro);
}

// Idle state, sow the menu
void ui_idle() {
    ux_step = 0; ux_step_count = 0;
    ui_state = UI_IDLE;
    UX_MENU_DISPLAY(0, menu_main, NULL);
}

// Show the transaction details for the user to approve
void menu_sign_init() {
    os_memset((unsigned char *) &ui_context, 0, sizeof(uiContext_t));
    unsigned char tx_type = tmp_ctx.signing_context.buffer[0];
    unsigned char tx_version = tmp_ctx.signing_context.buffer[1];
    uint32_t sign_data_offset = 2;

    // transfer
    if (tx_type == 4) {
        unsigned int processed = sign_data_offset + 1;

        if (tx_version == 2) {
            processed += 1;
        }

        // Sender public key 32 bytes
        waves_public_key_to_address((const unsigned char *) &tmp_ctx.signing_context.buffer[processed], tmp_ctx.signing_context.network_byte, (unsigned char *) ui_context.line7);
        processed += 32;

        // amount asset flag
        bool is_amount_in_asset = tmp_ctx.signing_context.buffer[processed] == 1;
        processed += 1;

        if (is_amount_in_asset) {
          size_t length = 45;
          if (!b58enc((char *) ui_context.line2, &length, (const void *) &tmp_ctx.signing_context.buffer[processed], 32)) {
              THROW(SW_CONDITIONS_NOT_SATISFIED);
          }
          processed += 32;
        } else {
          os_memmove((char *) ui_context.line2, WAVES_CONST, 5);
        }

        // fee asset flag
        bool is_fee_in_asset = tmp_ctx.signing_context.buffer[processed] == 1;
        processed += 1;
        if (is_fee_in_asset) {
          size_t length = 45;
          if (!b58enc((char *) ui_context.line5, &length, (const void *) &tmp_ctx.signing_context.buffer[processed], 32)) {
              THROW(SW_CONDITIONS_NOT_SATISFIED);
          }
          processed += 32;
        } else {
          os_memmove((char *) ui_context.line5, WAVES_CONST, 5);
        }

        // timestamp;
        processed += 8;

        uint64_t amount = 0;
        copy_in_reverse_order((unsigned char *) &amount, (const unsigned char *) &tmp_ctx.signing_context.buffer[processed], 8);
        print_amount(amount, tmp_ctx.signing_context.amount_decimals, (unsigned char*) ui_context.line1, 45);
        processed += 8;

        uint64_t fee = 0;
        copy_in_reverse_order((unsigned char *) &fee, (unsigned char *) &tmp_ctx.signing_context.buffer[processed], 8);
        print_amount(fee, tmp_ctx.signing_context.fee_decimals, (unsigned char*) ui_context.line4, 45);
        processed += 8;

        // address or alias flag is a part of address
        if (tmp_ctx.signing_context.buffer[processed] == 1) {
          size_t length = 45;
          if (!b58enc((char *) ui_context.line3, &length, (const void *) &tmp_ctx.signing_context.buffer[processed], 26)) {
              THROW(SW_CONDITIONS_NOT_SATISFIED);
          }
          processed += 26;
        } else {
          // also skip address scheme byte
          processed += 2;
          uint16_t alias_size = 0;
          copy_in_reverse_order((unsigned char *) &alias_size, (unsigned char *) &tmp_ctx.signing_context.buffer[processed], 2);
          processed += 2;

          os_memmove((unsigned char *) ui_context.line3, (const unsigned char *) &tmp_ctx.signing_context.buffer[processed], alias_size);
          processed += alias_size;
        }

        // in bytes
        uint16_t attachment_size = 0;
        copy_in_reverse_order((unsigned char *) &attachment_size, (unsigned char *) &tmp_ctx.signing_context.buffer[processed], 2);
        processed += 2;

        if (attachment_size > 41) {
          os_memmove((unsigned char *) &ui_context.line6[41], &"...\0", 4);
          attachment_size = 41;
        }

        os_memmove((unsigned char *) ui_context.line6, (const unsigned char *) &tmp_ctx.signing_context.buffer[processed], attachment_size);
        processed += attachment_size;

        // id
        unsigned char id[32];
        blake2b((unsigned char *) tmp_ctx.signing_context.buffer + sign_data_offset, tmp_ctx.signing_context.buffer_used - sign_data_offset, &id, 32);
        size_t length = 45;
        if (!b58enc((char *) ui_context.line8, &length, (const void *) &id, 32)) {
          THROW(SW_CONDITIONS_NOT_SATISFIED);
        }

        // Set the step/step count, and ui_state before requesting the UI
        ux_step = 0; ux_step_count = 9;
        ui_state = UI_VERIFY;
        UX_DISPLAY(ui_verify_transfer_nanos, ui_verify_transfer_prepro);
        return;
    } else {
        os_memmove(&ui_context.line2, &"Transaction Id\0", 15);
        if (tx_type == 3) {
            os_memmove(&ui_context.line1, &"issue\0", 6);
        } else if (tx_type == 5) {
            os_memmove(&ui_context.line1, &"reissue\0", 8);
        } else if (tx_type == 6) {
            os_memmove(&ui_context.line1, &"burn\0", 5);
        } else if (tx_type == 8) {
            os_memmove(&ui_context.line1, &"lease\0", 6);
        } else if (tx_type == 9) {
            os_memmove(&ui_context.line1, &"lease cancel\0", 13);
        } else if (tx_type == 10) {
            os_memmove(&ui_context.line1, &"creating an alias\0", 18);
        } else if (tx_type == 11) {
            os_memmove(&ui_context.line1, &"mass transfer\0", 14);
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
    }

    if (strlen((const char *) ui_context.line1) == 0) {
        os_memmove(&ui_context.line1, &"transaction\0", 12);
    }
    // id
    unsigned char id[32];
    blake2b((unsigned char *) tmp_ctx.signing_context.buffer + sign_data_offset, tmp_ctx.signing_context.buffer_used - sign_data_offset, &id, 32);
    size_t length = 45;
    if (!b58enc((char *) ui_context.line3, &length, (const void *) &id, 32)) {
        THROW(SW_CONDITIONS_NOT_SATISFIED);
    }

    // Get the public key and return it.
    cx_ecfp_public_key_t public_key;

    if (!get_curve25519_public_key_for_path((uint32_t *) tmp_ctx.signing_context.bip32, &public_key)) {
        THROW(INVALID_PARAMETER);
    }

    waves_public_key_to_address(public_key.W, tmp_ctx.signing_context.network_byte, ui_context.line4);

    ux_step = 0; ux_step_count = 3;
    ui_state = UI_VERIFY;
    UX_DISPLAY(ui_verify_transaction_nanos, ui_verify_transaction_prepro);
}


// borrowed from the Stellar wallet code and modified
bool print_amount(uint64_t amount, int decimals, unsigned char *out, uint8_t len) {
    char buffer[len];
    uint64_t dVal = amount;
    int i, j;

    if (decimals == 0) decimals--;

    memset(buffer, 0, len);
    for (i = 0; dVal > 0 || i < decimals + 2; i++) {
        if (dVal > 0) {
            buffer[i] = (char) ((dVal % 10) + '0');
            dVal /= 10;
        } else {
            buffer[i] = '0';
        }
        if (i == decimals - 1) {
            i += 1;
            buffer[i] = '.';
        }
        if (i >= len) {
            return false;
        }
    }
    // reverse order
    for (i -= 1, j = 0; i >= 0 && j < len-1; i--, j++) {
        out[j] = buffer[i];
    }
    if (decimals > 0) {
        // strip trailing 0s
        for (j -= 1; j > 0; j--) {
            if (out[j] != '0') break;
        }
        j += 1;
        if (out[j - 1] == '.') j -= 1;
    }

    out[j] = '\0';
    return  true;
}