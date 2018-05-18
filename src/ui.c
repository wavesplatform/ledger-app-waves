
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

int ux_step, ux_step_count;

bool print_amount(uint64_t amount, int decimals, unsigned char *out, uint8_t len);

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
        io_seproxyhal_cancel(NULL);
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
     NULL, 0, 0, 0, NULL, NULL, NULL},

    {{BAGL_ICON, 0x00, 3, 12, 7, 7, 0, 0, 0, 0xFFFFFF, 0x000000, 0,
      BAGL_GLYPH_ICON_CROSS},
     NULL, 0, 0, 0, NULL, NULL, NULL},
    {{BAGL_ICON, 0x00, 117, 13, 8, 6, 0, 0, 0, 0xFFFFFF, 0x000000, 0,
      BAGL_GLYPH_ICON_CHECK},
     NULL, 0, 0, 0, NULL, NULL, NULL},

    //{{BAGL_ICON                           , 0x01,  31,   9,  14,  14, 0, 0, 0
    //, 0xFFFFFF, 0x000000, 0, BAGL_GLYPH_ICON_EYE_BADGE  }, NULL, 0, 0, 0,
    //NULL, NULL, NULL },
    {{BAGL_LABELINE, 0x01, 0, 12, 128, 12, 0, 0, 0, 0xFFFFFF, 0x000000,
      BAGL_FONT_OPEN_SANS_EXTRABOLD_11px | BAGL_FONT_ALIGNMENT_CENTER, 0},
     "Confirm", 0, 0, 0, NULL, NULL, NULL},
    {{BAGL_LABELINE, 0x01, 0, 26, 128, 12, 0, 0, 0, 0xFFFFFF, 0x000000,
      BAGL_FONT_OPEN_SANS_EXTRABOLD_11px | BAGL_FONT_ALIGNMENT_CENTER, 0},
     "address", 0, 0, 0, NULL, NULL, NULL},

    {{BAGL_LABELINE, 0x02, 0, 12, 128, 12, 0, 0, 0, 0xFFFFFF, 0x000000,
      BAGL_FONT_OPEN_SANS_REGULAR_11px | BAGL_FONT_ALIGNMENT_CENTER, 0},
     "Address", 0, 0, 0, NULL, NULL, NULL},
    {{BAGL_LABELINE, 0x02, 23, 26, 82, 12, 0x80 | 10, 0, 0, 0xFFFFFF, 0x000000,
      BAGL_FONT_OPEN_SANS_EXTRABOLD_11px | BAGL_FONT_ALIGNMENT_CENTER, 26},
     (const char *)tmp_ctx.address_context.address, 0, 0, 0, NULL, NULL, NULL},
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
     NULL, 0, 0, 0, NULL, NULL, NULL},

    {{BAGL_ICON, 0x00, 3, 12, 7, 7, 0, 0, 0, 0xFFFFFF, 0x000000, 0,
      BAGL_GLYPH_ICON_CROSS},
     NULL, 0, 0, 0, NULL, NULL, NULL},
    {{BAGL_ICON, 0x00, 117, 13, 8, 6, 0, 0, 0, 0xFFFFFF, 0x000000, 0,
      BAGL_GLYPH_ICON_CHECK},
     NULL, 0, 0, 0, NULL, NULL, NULL},
    {{BAGL_LABELINE, 0x01, 0, 12, 128, 12, 0, 0, 0, 0xFFFFFF, 0x000000,
      BAGL_FONT_OPEN_SANS_EXTRABOLD_11px | BAGL_FONT_ALIGNMENT_CENTER, 0},
     "Confirm", 0, 0, 0, NULL, NULL, NULL},
    {{BAGL_LABELINE, 0x01, 0, 26, 128, 12, 0, 0, 0, 0xFFFFFF, 0x000000,
      BAGL_FONT_OPEN_SANS_EXTRABOLD_11px | BAGL_FONT_ALIGNMENT_CENTER, 0},
     "transfer", 0, 0, 0, NULL, NULL, NULL},

    {{BAGL_LABELINE, 0x02, 0, 12, 128, 12, 0, 0, 0, 0xFFFFFF, 0x000000,
      BAGL_FONT_OPEN_SANS_REGULAR_11px | BAGL_FONT_ALIGNMENT_CENTER, 0},
     "Transaction Id", 0, 0, 0, NULL, NULL, NULL},
    {{BAGL_LABELINE, 0x02, 23, 26, 82, 12, 0x80 | 10, 0, 0, 0xFFFFFF, 0x000000,
      BAGL_FONT_OPEN_SANS_EXTRABOLD_11px | BAGL_FONT_ALIGNMENT_CENTER, 26},
     (const char *)ui_context.line1, 0, 0, 0, NULL, NULL, NULL},

    {{BAGL_LABELINE, 0x03, 0, 12, 128, 12, 0, 0, 0, 0xFFFFFF, 0x000000,
      BAGL_FONT_OPEN_SANS_REGULAR_11px | BAGL_FONT_ALIGNMENT_CENTER, 0},
     "Amount", 0, 0, 0, NULL, NULL, NULL},
    {{BAGL_LABELINE, 0x03, 23, 26, 82, 12, 0x80 | 10, 0, 0, 0xFFFFFF, 0x000000,
      BAGL_FONT_OPEN_SANS_EXTRABOLD_11px | BAGL_FONT_ALIGNMENT_CENTER, 26},
     (const char *)ui_context.line2, 0, 0, 0, NULL, NULL, NULL},

    {{BAGL_LABELINE, 0x04, 0, 12, 128, 12, 0, 0, 0, 0xFFFFFF, 0x000000,
      BAGL_FONT_OPEN_SANS_REGULAR_11px | BAGL_FONT_ALIGNMENT_CENTER, 0},
     "Asset",0, 0, 0, NULL, NULL, NULL},
    {{BAGL_LABELINE, 0x04, 23, 26, 82, 12, 0x80 | 10, 0, 0, 0xFFFFFF, 0x000000,
      BAGL_FONT_OPEN_SANS_EXTRABOLD_11px | BAGL_FONT_ALIGNMENT_CENTER, 26},
     (const char *)ui_context.line3, 0, 0, 0, NULL, NULL, NULL},

    {{BAGL_LABELINE, 0x05, 0, 12, 128, 12, 0, 0, 0, 0xFFFFFF, 0x000000,
      BAGL_FONT_OPEN_SANS_REGULAR_11px | BAGL_FONT_ALIGNMENT_CENTER, 0},
     "From", 0, 0, 0, NULL, NULL, NULL},
    {{BAGL_LABELINE, 0x05, 23, 26, 82, 12, 0x80 | 10, 0, 0, 0xFFFFFF, 0x000000,
      BAGL_FONT_OPEN_SANS_EXTRABOLD_11px | BAGL_FONT_ALIGNMENT_CENTER, 26},
     (const char *)ui_context.line4, 0, 0, 0, NULL, NULL, NULL},

    {{BAGL_LABELINE, 0x06, 0, 12, 128, 12, 0, 0, 0, 0xFFFFFF, 0x000000,
      BAGL_FONT_OPEN_SANS_REGULAR_11px | BAGL_FONT_ALIGNMENT_CENTER, 0},
     "To", 0, 0, 0, NULL, NULL, NULL},
    {{BAGL_LABELINE, 0x06, 23, 26, 82, 12, 0x80 | 10, 0, 0, 0xFFFFFF, 0x000000,
      BAGL_FONT_OPEN_SANS_EXTRABOLD_11px | BAGL_FONT_ALIGNMENT_CENTER, 26},
     (const char *)ui_context.line5, 0, 0, 0, NULL, NULL, NULL},

     {{BAGL_LABELINE, 0x07, 0, 12, 128, 12, 0, 0, 0, 0xFFFFFF, 0x000000,
       BAGL_FONT_OPEN_SANS_REGULAR_11px | BAGL_FONT_ALIGNMENT_CENTER, 0},
      "Attachment", 0, 0, 0, NULL, NULL, NULL},
     {{BAGL_LABELINE, 0x07, 23, 26, 82, 12, 0x80 | 10, 0, 0, 0xFFFFFF, 0x000000,
       BAGL_FONT_OPEN_SANS_EXTRABOLD_11px | BAGL_FONT_ALIGNMENT_CENTER, 26},
      (const char *)ui_context.line6, 0, 0, 0, NULL, NULL, NULL},

    {{BAGL_LABELINE, 0x08, 0, 12, 128, 12, 0, 0, 0, 0xFFFFFF, 0x000000,
      BAGL_FONT_OPEN_SANS_REGULAR_11px | BAGL_FONT_ALIGNMENT_CENTER, 0},
     "Fee", 0, 0, 0, NULL, NULL, NULL},
    {{BAGL_LABELINE, 0x08, 23, 26, 82, 12, 0x80 | 10, 0, 0, 0xFFFFFF, 0x000000,
      BAGL_FONT_OPEN_SANS_EXTRABOLD_11px | BAGL_FONT_ALIGNMENT_CENTER, 26},
     (const char *)ui_context.line7, 0, 0, 0, NULL, NULL, NULL},

    {{BAGL_LABELINE, 0x09, 0, 12, 128, 12, 0, 0, 0, 0xFFFFFF, 0x000000,
      BAGL_FONT_OPEN_SANS_REGULAR_11px | BAGL_FONT_ALIGNMENT_CENTER, 0},
     "Fee asset", 0, 0, 0, NULL, NULL, NULL},
    {{BAGL_LABELINE, 0x09, 23, 26, 82, 12, 0x80 | 10, 0, 0, 0xFFFFFF, 0x000000,
      BAGL_FONT_OPEN_SANS_EXTRABOLD_11px | BAGL_FONT_ALIGNMENT_CENTER, 26},
     (const char *)ui_context.line8, 0, 0, 0, NULL, NULL, NULL}
};

const bagl_element_t ui_verify_transaction_nanos[] = {
    // type                               userid    x    y   w    h  str rad
    // fill      fg        bg      fid iid  txt   touchparams...       ]
    {{BAGL_RECTANGLE, 0x00, 0, 0, 128, 32, 0, 0, BAGL_FILL, 0x000000, 0xFFFFFF,
      0, 0},
     NULL, 0, 0, 0, NULL, NULL, NULL},

    {{BAGL_ICON, 0x00, 3, 12, 7, 7, 0, 0, 0, 0xFFFFFF, 0x000000, 0,
      BAGL_GLYPH_ICON_CROSS},
     NULL, 0, 0, 0, NULL, NULL, NULL},
    {{BAGL_ICON, 0x00, 117, 13, 8, 6, 0, 0, 0, 0xFFFFFF, 0x000000, 0,
      BAGL_GLYPH_ICON_CHECK},
     NULL, 0, 0, 0, NULL, NULL, NULL},
    {{BAGL_LABELINE, 0x01, 0, 12, 128, 12, 0, 0, 0, 0xFFFFFF, 0x000000,
      BAGL_FONT_OPEN_SANS_EXTRABOLD_11px | BAGL_FONT_ALIGNMENT_CENTER, 0},
     "Confirm", 0, 0, 0, NULL, NULL, NULL},
    {{BAGL_LABELINE, 0x01, 0, 26, 128, 12, 0, 0, 0, 0xFFFFFF, 0x000000,
      BAGL_FONT_OPEN_SANS_EXTRABOLD_11px | BAGL_FONT_ALIGNMENT_CENTER, 0},
     (const char *) ui_context.line1, 0, 0, 0, NULL, NULL, NULL},

    {{BAGL_LABELINE, 0x02, 0, 12, 128, 12, 0, 0, 0, 0xFFFFFF, 0x000000,
      BAGL_FONT_OPEN_SANS_REGULAR_11px | BAGL_FONT_ALIGNMENT_CENTER, 0},
     (const char *)ui_context.line2, 0, 0, 0, NULL, NULL, NULL},
    {{BAGL_LABELINE, 0x02, 23, 26, 82, 12, 0x80 | 10, 0, 0, 0xFFFFFF, 0x000000,
      BAGL_FONT_OPEN_SANS_EXTRABOLD_11px | BAGL_FONT_ALIGNMENT_CENTER, 26},
     (const char *)ui_context.line3, 0, 0, 0, NULL, NULL, NULL},

    {{BAGL_LABELINE, 0x03, 0, 12, 128, 12, 0, 0, 0, 0xFFFFFF, 0x000000,
      BAGL_FONT_OPEN_SANS_REGULAR_11px | BAGL_FONT_ALIGNMENT_CENTER, 0},
     "From", 0, 0, 0, NULL, NULL, NULL},
    {{BAGL_LABELINE, 0x03, 23, 26, 82, 12, 0x80 | 10, 0, 0, 0xFFFFFF, 0x000000,
      BAGL_FONT_OPEN_SANS_EXTRABOLD_11px | BAGL_FONT_ALIGNMENT_CENTER, 26},
     (const char *)ui_context.line4, 0, 0, 0, NULL, NULL, NULL},
};

unsigned int ui_verify_transfer_nanos_button(unsigned int button_mask,
                                    unsigned int button_mask_counter) {
    switch (button_mask) {
        case BUTTON_EVT_RELEASED | BUTTON_LEFT:
            io_seproxyhal_cancel(NULL);
            break;

        case BUTTON_EVT_RELEASED | BUTTON_RIGHT:
            io_seproxyhal_touch_sign_approve(NULL);
            break;
    }
    return 0;
}

unsigned int ui_verify_transaction_nanos_button(unsigned int button_mask,
                                    unsigned int button_mask_counter) {
    switch (button_mask) {
        case BUTTON_EVT_RELEASED | BUTTON_LEFT:
            io_seproxyhal_cancel(NULL);
            break;

        case BUTTON_EVT_RELEASED | BUTTON_RIGHT:
            io_seproxyhal_touch_sign_approve(NULL);
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
            case 9:
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

const bagl_element_t * ui_verify_transaction_prepro(const bagl_element_t *element) {
    if (element->component.userid > 0) {
        unsigned int display = (ux_step == element->component.userid - 1);
        if (display) {
            switch (element->component.userid) {
            case 1:
                UX_CALLBACK_SET_INTERVAL(2000);
                break;
            case 2:
            case 3:
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
    os_memset((unsigned char *) &ui_context, 0, sizeof(uiContext_t));
    unsigned int processed = 1;
    unsigned char tx_type = tmp_ctx.signing_context.buffer[0];

    // transfer
    if (tx_type == 4) {
        // Sender public key 32 bytes
        waves_public_key_to_address((const unsigned char *) &tmp_ctx.signing_context.buffer[processed], 'W', (unsigned char *) ui_context.line4);
        processed += 32;

        // amount asset flag
        bool is_amount_in_asset = tmp_ctx.signing_context.buffer[processed] == 1;
        processed += 1;

        if (is_amount_in_asset) {
          size_t length = 91;
          if (!b58enc((char *) ui_context.line3, &length, (const void *) &tmp_ctx.signing_context.buffer[processed], 32)) {
              THROW(SW_CONDITIONS_NOT_SATISFIED);
          }
          processed += 32;
        } else {
          os_memmove((char *) ui_context.line3, WAVES_CONST, 5);
        }

        // fee asset flag
        bool is_fee_in_asset = tmp_ctx.signing_context.buffer[processed] == 1;
        processed += 1;
        if (is_fee_in_asset) {
          size_t length = 91;
          if (!b58enc((char *) ui_context.line8, &length, (const void *) &tmp_ctx.signing_context.buffer[processed], 32)) {
              THROW(SW_CONDITIONS_NOT_SATISFIED);
          }
          processed += 32;
        } else {
          os_memmove((char *) ui_context.line8, WAVES_CONST, 5);
        }

        // timestamp;
        processed += 8;

        uint64_t amount = 0;
        copy_in_reverse_order((unsigned char *) &amount, (const unsigned char *) &tmp_ctx.signing_context.buffer[processed], 8);
        print_amount(amount, tmp_ctx.signing_context.amount_decimals, (unsigned char*) ui_context.line2, 91);
        processed += 8;

        uint64_t fee = 0;
        copy_in_reverse_order((unsigned char *) &fee, (unsigned char *) &tmp_ctx.signing_context.buffer[processed], 8);
        print_amount(fee, tmp_ctx.signing_context.fee_decimals, (unsigned char*) ui_context.line7, 91);
        processed += 8;

        // address or alias flag is a part of address
        if (tmp_ctx.signing_context.buffer[processed] == 1) {
          size_t length = 91;
          if (!b58enc((char *) ui_context.line5, &length, (const void *) &tmp_ctx.signing_context.buffer[processed], 26)) {
              THROW(SW_CONDITIONS_NOT_SATISFIED);
          }
          processed += 26;
        } else {
          // also skip address scheme byte
          processed += 2;
          uint16_t alias_size = 0;
          copy_in_reverse_order((unsigned char *) &alias_size, (unsigned char *) &tmp_ctx.signing_context.buffer[processed], 2);
          processed += 2;

          os_memmove((unsigned char *) ui_context.line5, (const unsigned char *) &tmp_ctx.signing_context.buffer[processed], alias_size);
          processed += alias_size;
        }

        // in bytes
        uint16_t attachment_size = 0;
        copy_in_reverse_order((unsigned char *) &attachment_size, (unsigned char *) &tmp_ctx.signing_context.buffer[processed], 2);
        processed += 2;

        if (attachment_size > 87) {
          os_memmove((unsigned char *) &ui_context.line6[87], &"...\0", 4);
          attachment_size = 87;
        }

        os_memmove((unsigned char *) ui_context.line6, (const unsigned char *) &tmp_ctx.signing_context.buffer[processed], attachment_size);
        processed += attachment_size;

        // id
        unsigned char id[32];
        blake2b((unsigned char *) tmp_ctx.signing_context.buffer, tmp_ctx.signing_context.buffer_used, &id, 32);
        size_t length = 91;
        if (!b58enc((char *) ui_context.line1, &length, (const void *) &id, 32)) {
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
            if (tx_type == 253) {
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
    uint32_t sign_data_offset = get_sign_data_offset();
    blake2b((unsigned char *) tmp_ctx.signing_context.buffer + sign_data_offset, tmp_ctx.signing_context.buffer_used - sign_data_offset, &id, 32);
    size_t length = 91;
    if (!b58enc((char *) ui_context.line3, &length, (const void *) &id, 32)) {
        THROW(SW_CONDITIONS_NOT_SATISFIED);
    }

    // Get the public key and return it.
    cx_ecfp_public_key_t public_key;

    if (get_curve25519_public_key_for_path((uint32_t *) tmp_ctx.signing_context.bip32, &public_key) != 0) {
        THROW(INVALID_PARAMETER);
    }

    waves_public_key_to_address(public_key.W, 'W', ui_context.line4);

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
            if (dVal == 0) {
                buffer[i] = '.';
            }
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
    }

    out[j] = '\0';
    return  true;
}