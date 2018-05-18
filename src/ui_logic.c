#include "ui_logic.h"
#include "main.h"
#include "ui.h"

// UI
unsigned int io_seproxyhal_touch_address_ok(const bagl_element_t *e) {
    uint32_t tx = set_result_get_address();
    unsigned short sw = SW_OK;

    G_io_apdu_buffer[tx++] = sw >> 8;
    G_io_apdu_buffer[tx++] = sw;

    // Send back the response, do not restart the event loop
    io_exchange(CHANNEL_APDU | IO_RETURN_AFTER_TX, tx);

    init_context();

    // Display back the original UX
    ui_idle();
    return 0; // do not redraw the widget
}

unsigned int io_seproxyhal_cancel(const bagl_element_t *e) {
    uint32_t tx = 0;

    unsigned short sw = SW_USER_CANCELLED;

    G_io_apdu_buffer[tx++] = sw >> 8;
    G_io_apdu_buffer[tx++] = sw;

    // Send back the response, do not restart the event loop
    io_exchange(CHANNEL_APDU | IO_RETURN_AFTER_TX, 2);

    init_context();

    // Display back the original UX
    ui_idle();
    return 0; // do not redraw the widget
}

unsigned int io_seproxyhal_touch_sign_approve(const bagl_element_t *e) {
    // first 64 byte - signature
    uint32_t tx = set_result_sign();
    unsigned short sw = SW_OK;

    G_io_apdu_buffer[tx++] = sw >> 8;
    G_io_apdu_buffer[tx++] = sw;

    io_exchange(CHANNEL_APDU | IO_RETURN_AFTER_TX, tx);

    init_context();

    ui_idle();

    return 0; // do not redraw the widget
}