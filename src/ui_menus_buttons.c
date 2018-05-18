#include "ui_menus_buttons.h"

#include "ui_logic.h"
#include "os_io_seproxyhal.h"

unsigned int ui_verify_transfer_nanos_button(unsigned int button_mask, unsigned int button_mask_counter) {
    switch (button_mask) {
        case BUTTON_EVT_RELEASED | BUTTON_LEFT: // CANCEL
            io_seproxyhal_cancel(NULL);
            break;

        case BUTTON_EVT_RELEASED | BUTTON_RIGHT:  // OK
            io_seproxyhal_touch_sign_approve(NULL);
            break;
    }
    return 0;
}

unsigned int ui_verify_transaction_nanos_button(unsigned int button_mask, unsigned int button_mask_counter) {
    switch (button_mask) {
        case BUTTON_EVT_RELEASED | BUTTON_LEFT: // CANCEL
            io_seproxyhal_cancel(NULL);
            break;

        case BUTTON_EVT_RELEASED | BUTTON_RIGHT:  // OK
            io_seproxyhal_touch_sign_approve(NULL);
            break;
    }
    return 0;
}

unsigned int ui_address_nanos_button(unsigned int button_mask, unsigned int button_mask_counter) {
    switch (button_mask) {
        case BUTTON_EVT_RELEASED | BUTTON_LEFT: // CANCEL
            io_seproxyhal_cancel(NULL);
            break;

        case BUTTON_EVT_RELEASED | BUTTON_RIGHT:  // OK
            io_seproxyhal_touch_address_ok(NULL);
            break;
        }
    return 0;
}