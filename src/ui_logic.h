#ifndef __UI_H__
#define __UI_H__

#include "os_io_seproxyhal.h"

//unsigned int io_seproxyhal_touch_tx_ok(const bagl_element_t *e);
//unsigned int io_seproxyhal_touch_tx_cancel(const bagl_element_t *e);
unsigned int io_seproxyhal_touch_address_ok(const bagl_element_t *e);
unsigned int io_seproxyhal_touch_address_cancel(const bagl_element_t *e);

#endif