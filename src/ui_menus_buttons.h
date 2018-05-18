#ifndef __UI_MENUS_BUTTONS_H__
#define __UI_MENUS_BUTTONS_H__

#include "os.h"
#include "cx.h"

unsigned int ui_verify_transfer_nanos_button(unsigned int button_mask, unsigned int button_mask_counter);
unsigned int ui_verify_transaction_nanos_button(unsigned int button_mask, unsigned int button_mask_counter);
unsigned int ui_address_nanos_button(unsigned int button_mask, unsigned int button_mask_counter);

#endif