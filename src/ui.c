
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

ux_state_t ux;

// UI currently displayed
enum UI_STATE ui_state;

//unsigned int current_text_pos; // parsing cursor in the text to display
int ux_step, ux_step_count;
//unsigned int text_y;           // current location of the displayed text


void print_amount(uint64_t amount, int decimals, char *out, uint8_t len);

#ifdef HAVE_U2F

// change the setting
void menu_settings_browser_change(unsigned int enabled) {
    uint8_t fido_transport = enabled;
    nvm_write(&N_storage.fido_transport, (void *)&fido_transport, sizeof(uint8_t));
    USB_power_U2F(0, 0);
    USB_power_U2F(1, N_storage.fido_transport);
    // go back to the menu entry
    UX_MENU_DISPLAY(1, menu_settings, NULL);
}

// show the currently activated entry
void menu_settings_browser_init(unsigned int ignored) {
    UNUSED(ignored);
    UX_MENU_DISPLAY(N_storage.fido_transport ? 1 : 0, menu_settings_browser, NULL);
}

#endif

unsigned int ui_address_nanos_button(unsigned int button_mask,
                                     unsigned int button_mask_counter) {
    switch (button_mask) {
    case BUTTON_EVT_RELEASED | BUTTON_LEFT: // CANCEL
        io_seproxyhal_touch_address_cancel(NULL);
        break;

    case BUTTON_EVT_RELEASED | BUTTON_RIGHT: { // OK
        io_seproxyhal_touch_address_ok(NULL);
        break;
    }
    }
    return 0;
}

const bagl_element_t ui_address_nanos[] = {
    // type                               userid    x    y   w    h  str rad
    // fill      fg        bg      fid iid  txt   touchparams...       ]
    {{BAGL_RECTANGLE, 0x00, 0, 0, 128, 32, 0, 0, BAGL_FILL, 0x000000, 0xFFFFFF,
      0, 0},
     NULL,
     0,
     0,
     0,
     NULL,
     NULL,
     NULL},

    {{BAGL_ICON, 0x00, 3, 12, 7, 7, 0, 0, 0, 0xFFFFFF, 0x000000, 0,
      BAGL_GLYPH_ICON_CROSS},
     NULL,
     0,
     0,
     0,
     NULL,
     NULL,
     NULL},
    {{BAGL_ICON, 0x00, 117, 13, 8, 6, 0, 0, 0, 0xFFFFFF, 0x000000, 0,
      BAGL_GLYPH_ICON_CHECK},
     NULL,
     0,
     0,
     0,
     NULL,
     NULL,
     NULL},

    //{{BAGL_ICON                           , 0x01,  31,   9,  14,  14, 0, 0, 0
    //, 0xFFFFFF, 0x000000, 0, BAGL_GLYPH_ICON_EYE_BADGE  }, NULL, 0, 0, 0,
    //NULL, NULL, NULL },
    {{BAGL_LABELINE, 0x01, 0, 12, 128, 12, 0, 0, 0, 0xFFFFFF, 0x000000,
      BAGL_FONT_OPEN_SANS_EXTRABOLD_11px | BAGL_FONT_ALIGNMENT_CENTER, 0},
     "Confirm",
     0,
     0,
     0,
     NULL,
     NULL,
     NULL},
    {{BAGL_LABELINE, 0x01, 0, 26, 128, 12, 0, 0, 0, 0xFFFFFF, 0x000000,
      BAGL_FONT_OPEN_SANS_EXTRABOLD_11px | BAGL_FONT_ALIGNMENT_CENTER, 0},
     "address",
     0,
     0,
     0,
     NULL,
     NULL,
     NULL},

    {{BAGL_LABELINE, 0x02, 0, 12, 128, 12, 0, 0, 0, 0xFFFFFF, 0x000000,
      BAGL_FONT_OPEN_SANS_REGULAR_11px | BAGL_FONT_ALIGNMENT_CENTER, 0},
     "Address",
     0,
     0,
     0,
     NULL,
     NULL,
     NULL},
    {{BAGL_LABELINE, 0x02, 23, 26, 82, 12, 0x80 | 10, 0, 0, 0xFFFFFF, 0x000000,
      BAGL_FONT_OPEN_SANS_EXTRABOLD_11px | BAGL_FONT_ALIGNMENT_CENTER, 26},
     (char *)tmp_ctx.address_context.address,
     0,
     0,
     0,
     NULL,
     NULL,
     NULL},
};

void menu_address_init(uint32_t *waves_bip32_path) {
    ux_step = 0;
    ux_step_count = 2;
    UX_DISPLAY(ui_address_nanos, ui_address_prepro);
}

const bagl_element_t * ui_address_prepro(const bagl_element_t *element) {
    if (element->component.userid > 0) {
        unsigned int display = (ux_step == element->component.userid - 1);
        if (display) {
            switch (element->component.userid) {
            case 1:
                UX_CALLBACK_SET_INTERVAL(2000);
                break;
            case 2:
                UX_CALLBACK_SET_INTERVAL(MAX(
                    3000, 1000 + bagl_label_roundtrip_duration_ms(element, 7)));
                break;
            }
        }
        if (!display)
             return NULL;
    }
    return element;
}

#ifdef HAVE_U2F

const ux_menu_entry_t menu_settings_browser[] = {
    {NULL, menu_settings_browser_change, 0, NULL, "No", NULL, 0, 0},
    {NULL, menu_settings_browser_change, 1, NULL, "Yes", NULL, 0, 0},
    UX_MENU_END};

const ux_menu_entry_t menu_settings[] = {
    {NULL, menu_settings_browser_init, 0, NULL, "Browser support", NULL, 0, 0},
    {menu_main, NULL, 1, &C_icon_back, "Back", NULL, 61, 40},
    UX_MENU_END};
#endif

const ux_menu_entry_t menu_about[] = {
    {NULL, NULL, 0, NULL, "Version", APPVERSION, 0, 0},
    {menu_main, NULL, 2, &C_icon_back, "Back", NULL, 61, 40},
    UX_MENU_END};

const ux_menu_entry_t menu_main[] = {
    {NULL, NULL, 0, &C_icon_waves, "Use wallet to", "view accounts", 33, 12},
#ifdef HAVE_U2F
    {menu_settings, NULL, 0, NULL, "Settings", NULL, 0, 0},
#endif
    {menu_about, NULL, 0, NULL, "About", NULL, 0, 0},
    {NULL, os_sched_exit, 0, &C_icon_dashboard, "Quit app", NULL, 50, 29},
    UX_MENU_END};


const bagl_element_t ui_verify_transfer_nanos[] = {
    // type                               userid    x    y   w    h  str rad
    // fill      fg        bg      fid iid  txt   touchparams...       ]
    {{BAGL_RECTANGLE, 0x00, 0, 0, 128, 32, 0, 0, BAGL_FILL, 0x000000, 0xFFFFFF,
      0, 0},
     NULL,
     0,
     0,
     0,
     NULL,
     NULL,
     NULL},

    {{BAGL_ICON, 0x00, 3, 12, 7, 7, 0, 0, 0, 0xFFFFFF, 0x000000, 0,
      BAGL_GLYPH_ICON_CROSS},
     NULL,
     0,
     0,
     0,
     NULL,
     NULL,
     NULL},
    {{BAGL_ICON, 0x00, 117, 13, 8, 6, 0, 0, 0, 0xFFFFFF, 0x000000, 0,
      BAGL_GLYPH_ICON_CHECK},
     NULL,
     0,
     0,
     0,
     NULL,
     NULL,
     NULL},
    {{BAGL_LABELINE, 0x01, 0, 12, 128, 12, 0, 0, 0, 0xFFFFFF, 0x000000,
      BAGL_FONT_OPEN_SANS_EXTRABOLD_11px | BAGL_FONT_ALIGNMENT_CENTER, 0},
     "Confirm",
     0,
     0,
     0,
     NULL,
     NULL,
     NULL},
    {{BAGL_LABELINE, 0x01, 0, 26, 128, 12, 0, 0, 0, 0xFFFFFF, 0x000000,
      BAGL_FONT_OPEN_SANS_EXTRABOLD_11px | BAGL_FONT_ALIGNMENT_CENTER, 0},
     "transfer",
     0,
     0,
     0,
     NULL,
     NULL,
     NULL},

    {{BAGL_LABELINE, 0x02, 0, 12, 128, 12, 0, 0, 0, 0xFFFFFF, 0x000000,
      BAGL_FONT_OPEN_SANS_REGULAR_11px | BAGL_FONT_ALIGNMENT_CENTER, 0},
     "Amount",
     0,
     0,
     0,
     NULL,
     NULL,
     NULL},
    {{BAGL_LABELINE, 0x02, 23, 26, 82, 12, 0x80 | 10, 0, 0, 0xFFFFFF, 0x000000,
      BAGL_FONT_OPEN_SANS_EXTRABOLD_11px | BAGL_FONT_ALIGNMENT_CENTER, 26},
     (char *)tmp_ctx.transaction_context.amount,
     0,
     0,
     0,
     NULL,
     NULL,
     NULL},

    {{BAGL_LABELINE, 0x03, 0, 12, 128, 12, 0, 0, 0, 0xFFFFFF, 0x000000,
      BAGL_FONT_OPEN_SANS_REGULAR_11px | BAGL_FONT_ALIGNMENT_CENTER, 0},
     "Asset",
     0,
     0,
     0,
     NULL,
     NULL,
     NULL},
    {{BAGL_LABELINE, 0x03, 23, 26, 82, 12, 0x80 | 10, 0, 0, 0xFFFFFF, 0x000000,
      BAGL_FONT_OPEN_SANS_EXTRABOLD_11px | BAGL_FONT_ALIGNMENT_CENTER, 26},
     (char *)tmp_ctx.transaction_context.amount_asset_id,
     0,
     0,
     0,
     NULL,
     NULL,
     NULL},

    {{BAGL_LABELINE, 0x04, 0, 12, 128, 12, 0, 0, 0, 0xFFFFFF, 0x000000,
      BAGL_FONT_OPEN_SANS_REGULAR_11px | BAGL_FONT_ALIGNMENT_CENTER, 0},
     "From",
     0,
     0,
     0,
     NULL,
     NULL,
     NULL},
    {{BAGL_LABELINE, 0x04, 23, 26, 82, 12, 0x80 | 10, 0, 0, 0xFFFFFF, 0x000000,
      BAGL_FONT_OPEN_SANS_EXTRABOLD_11px | BAGL_FONT_ALIGNMENT_CENTER, 26},
     (char *)tmp_ctx.transaction_context.sender_address,
     0,
     0,
     0,
     NULL,
     NULL,
     NULL},

    {{BAGL_LABELINE, 0x05, 0, 12, 128, 12, 0, 0, 0, 0xFFFFFF, 0x000000,
      BAGL_FONT_OPEN_SANS_REGULAR_11px | BAGL_FONT_ALIGNMENT_CENTER, 0},
     "To",
     0,
     0,
     0,
     NULL,
     NULL,
     NULL},
    {{BAGL_LABELINE, 0x05, 23, 26, 82, 12, 0x80 | 10, 0, 0, 0xFFFFFF, 0x000000,
      BAGL_FONT_OPEN_SANS_EXTRABOLD_11px | BAGL_FONT_ALIGNMENT_CENTER, 26},
     (char *)tmp_ctx.transaction_context.recipient_address,
     0,
     0,
     0,
     NULL,
     NULL,
     NULL},

     {{BAGL_LABELINE, 0x06, 0, 12, 128, 12, 0, 0, 0, 0xFFFFFF, 0x000000,
       BAGL_FONT_OPEN_SANS_REGULAR_11px | BAGL_FONT_ALIGNMENT_CENTER, 0},
      "Attachment",
      0,
      0,
      0,
      NULL,
      NULL,
      NULL},
     {{BAGL_LABELINE, 0x06, 23, 26, 82, 12, 0x80 | 10, 0, 0, 0xFFFFFF, 0x000000,
       BAGL_FONT_OPEN_SANS_EXTRABOLD_11px | BAGL_FONT_ALIGNMENT_CENTER, 26},
      (char *)tmp_ctx.transaction_context.attachment,
      0,
      0,
      0,
      NULL,
      NULL,
      NULL},

    {{BAGL_LABELINE, 0x07, 0, 12, 128, 12, 0, 0, 0, 0xFFFFFF, 0x000000,
      BAGL_FONT_OPEN_SANS_REGULAR_11px | BAGL_FONT_ALIGNMENT_CENTER, 0},
     "Fee",
     0,
     0,
     0,
     NULL,
     NULL,
     NULL},
    {{BAGL_LABELINE, 0x07, 23, 26, 82, 12, 0x80 | 10, 0, 0, 0xFFFFFF, 0x000000,
      BAGL_FONT_OPEN_SANS_EXTRABOLD_11px | BAGL_FONT_ALIGNMENT_CENTER, 26},
     (char *)tmp_ctx.transaction_context.fee,
     0,
     0,
     0,
     NULL,
     NULL,
     NULL},

    {{BAGL_LABELINE, 0x08, 0, 12, 128, 12, 0, 0, 0, 0xFFFFFF, 0x000000,
      BAGL_FONT_OPEN_SANS_REGULAR_11px | BAGL_FONT_ALIGNMENT_CENTER, 0},
     "Fee asset",
     0,
     0,
     0,
     NULL,
     NULL,
     NULL},
    {{BAGL_LABELINE, 0x08, 23, 26, 82, 12, 0x80 | 10, 0, 0, 0xFFFFFF, 0x000000,
      BAGL_FONT_OPEN_SANS_EXTRABOLD_11px | BAGL_FONT_ALIGNMENT_CENTER, 26},
     (char *)tmp_ctx.transaction_context.fee_asset_id,
     0,
     0,
     0,
     NULL,
     NULL,
     NULL}
};

unsigned int ui_verify_transfer_nanos_button(unsigned int button_mask,
                                    unsigned int button_mask_counter) {
    switch (button_mask) {
        case BUTTON_EVT_RELEASED | BUTTON_LEFT:
            io_seproxyhal_touch_verify_transfer_deny(NULL);
            break;

        case BUTTON_EVT_RELEASED | BUTTON_RIGHT:
            io_seproxyhal_touch_verify_transfer_approve(NULL);
            break;
    }
    return 0;
}

// display or not according to step, and adjust delay
const bagl_element_t * ui_verify_transfer_prepro(const bagl_element_t *element) {
    if (element->component.userid > 0) {
        unsigned int display = (ux_step == element->component.userid - 1);
        if (display) {
            switch (element->component.userid) {
            case 1:
                UX_CALLBACK_SET_INTERVAL(2000);
                break;
            case 2:
            case 3:
            case 4:
            case 5:
            case 6:
            case 7:
            case 8:
                UX_CALLBACK_SET_INTERVAL(MAX(
                    3000, 1000 + bagl_label_roundtrip_duration_ms(element, 7)));
                break;
            }
        }
        if (!display)
             return NULL;
    }
    return element;
}

// Idle state, sow the menu
void ui_idle(void) {
    ux_step = 0; ux_step_count = 0;
    ui_state = UI_IDLE;
    UX_MENU_DISPLAY(0, menu_main, NULL);
}

// Show the transaction details for the user to approve
void ui_verify(void) {
    unsigned int processed = 1;
    switch( tmp_ctx.signing_context.buffer[0] ) {
        // genesis, payment and exchange transactions are not supported
//        case 3: {// issue
//            break;}
        case 4: {// transfer
            // Sender public key 32 bytes
//            memset(tmp_ctx.transaction_context.sender_address, 0, sizeof(tmp_ctx.transaction_context.sender_address));
            waves_public_key_to_address(&tmp_ctx.signing_context.buffer[processed], 'W', tmp_ctx.transaction_context.sender_address);
            processed += 32;

            // amount asset flag
            bool is_amount_in_asset = tmp_ctx.signing_context.buffer[processed] == 1;
            processed += 1;

//            memset(tmp_ctx.transaction_context.amount_asset_id, 0, sizeof(tmp_ctx.transaction_context.amount_asset_id));
            if (is_amount_in_asset) {
                size_t length = sizeof(tmp_ctx.transaction_context.amount_asset_id);
                if (!b58enc(tmp_ctx.transaction_context.amount_asset_id, &length, &tmp_ctx.signing_context.buffer[processed], 32)) {
                    THROW(SW_CONDITIONS_NOT_SATISFIED);
                }
                processed += 32;
            } else {
                SPRINTF(tmp_ctx.transaction_context.amount_asset_id, "%s", "WAVES");
            }

            // fee asset flag
            bool is_fee_in_asset = tmp_ctx.signing_context.buffer[processed] == 1;
            processed += 1;
//            memset(tmp_ctx.transaction_context.fee_asset_id, 0, sizeof(tmp_ctx.transaction_context.fee_asset_id));
            if (is_fee_in_asset) {
                size_t length = sizeof(tmp_ctx.transaction_context.fee_asset_id);
                if (!b58enc(tmp_ctx.transaction_context.fee_asset_id, &length, &tmp_ctx.signing_context.buffer[processed], 32)) {
                    THROW(SW_CONDITIONS_NOT_SATISFIED);
                }
                processed += 32;
            } else {
                SPRINTF(tmp_ctx.transaction_context.fee_asset_id, "%s", "WAVES");
            }

//            uint64_t timestamp;
//            os_memmove(&timestamp, tmp_ctx.signing_context.buffer + processed, 8);
            processed += 8;

//            tmp_ctx.transaction_context.amount[0] = '\0';
//            uint64_t amount;
//            os_memmove(&amount, tmp_ctx.signing_context.buffer + processed, 8);
//            print_amount(amount, -1, tmp_ctx.transaction_context.amount, sizeof(tmp_ctx.transaction_context.amount));
            processed += 8;

            tmp_ctx.transaction_context.fee[0] = '\0';
//            uint64_t fee;
//            os_memmove(&fee, tmp_ctx.signing_context.buffer + processed, 8);
//            print_amount(fee, -1, tmp_ctx.transaction_context.fee, sizeof(tmp_ctx.transaction_context.fee));
            processed += 8;

            SPRINTF(tmp_ctx.transaction_context.amount, "%d", processed);

            // address or alias flag is a part of address
            if (tmp_ctx.signing_context.buffer[processed] == 1) {
                size_t length = sizeof(tmp_ctx.transaction_context.recipient_address);
                if (!b58enc(tmp_ctx.transaction_context.recipient_address, &length, &tmp_ctx.signing_context.buffer[processed], 26)) {
                    THROW(SW_CONDITIONS_NOT_SATISFIED);
                }
                processed += 26;
            } else {
                // also skip address scheme byte
                processed += 2;
                uint16_t alias_size;
                os_memmove(&alias_size, &tmp_ctx.signing_context.buffer[processed], 2);
                processed += 2;

                os_memmove(tmp_ctx.transaction_context.recipient_address, &tmp_ctx.signing_context.buffer[processed], alias_size);
                tmp_ctx.transaction_context.recipient_address[alias_size] = '\0';
                processed += alias_size;
            }

            tmp_ctx.transaction_context.attachment[0] = '\0';

//            uint16_t attachment_size;
//            os_memmove(&attachment_size, tmp_ctx.signing_context.buffer + processed, 2);
//            processed += 2;
//
//            char attachment[attachment_size];
//            os_memmove(tmp_ctx.transaction_context.attachment, tmp_ctx.signing_context.buffer + processed, attachment_size);
//            tmp_ctx.transaction_context.attachment[attachment_size] = '\0';
//            processed += attachment_size;

//            todo print with decimals?!
//            print_amount(amount, 8, (char*)tmp_ctx.transaction_context.amount,
//                         sizeof(tmp_ctx.transaction_context.amount));
//            print_amount(fee, 8, (char*)tmp_ctx.transaction_context.amount,
//                         sizeof(tmp_ctx.transaction_context.amount));
//            print_amount(fee, 8, (char*)tmp_ctx.transaction_context.amount,
//                         sizeof(tmp_ctx.transaction_context.amount));

            // Set the step/step count, and ui_state before requesting the UI
            ux_step = 0; ux_step_count = 8;
            ui_state = UI_VERIFY;
            UX_DISPLAY(ui_verify_transfer_nanos, ui_verify_transfer_prepro);
            break;
          }
//        case 5: {// reissue
//            break;}
//        case 6: {// burn
//            break;}
//        case 8: {// lease
//            break;}
//        case 10: {// create alias
//            break;}
//        case 11: {// mass transfer
//            break;}
        default: {
            THROW(SW_CONDITIONS_NOT_SATISFIED);
            break;
        }
    }
}


// borrowed from the Stellar wallet code, slgithly modified for BURST
void print_amount(uint64_t amount, int decimals, char *out, uint8_t len) {
    char buffer[len];
    uint64_t dVal = amount;
    int i, j;

    memset(buffer, 0, len);
    for (i = 0; dVal > 0 || i < 9; i++) {
        if (dVal > 0) {
            buffer[i] = (dVal % 10) + '0';
            dVal /= 10;
        } else {
            buffer[i] = '0';
        }
        if (i == decimals - 1) { // 1 BURST = 100000000 quants
            i += 1;
            buffer[i] = '.';
        }
        if (i >= len) {
            THROW(0x6700);
        }
    }
    // reverse order
    for (i -= 1, j = 0; i >= 0 && j < len-1; i--, j++) {
        out[j] = buffer[i];
    }
    // strip trailing 0s
    for (j -= 1; j > 0; j--) {
        if (out[j] != '0') break;
    }
    j += 2;

    // strip trailing .
    //if (out[j-1] == '.') j -= 1;

    out[j] = '\0';
}