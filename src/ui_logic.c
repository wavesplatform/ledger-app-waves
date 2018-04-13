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
    // Display back the original UX
    ui_idle();
    return 0; // do not redraw the widget
}

unsigned int io_seproxyhal_touch_address_cancel(const bagl_element_t *e) {
    G_io_apdu_buffer[0] = 0x69;
    G_io_apdu_buffer[1] = 0x85;

    // Send back the response, do not restart the event loop
    io_exchange(CHANNEL_APDU | IO_RETURN_AFTER_TX, 2);
    // Display back the original UX
    ui_idle();
    return 0; // do not redraw the widget
}

unsigned int io_seproxyhal_touch_verify_transfer_approve(const bagl_element_t *e) {
    unsigned int tx = 0;
    unsigned short sw = SW_OK;

    handle_signing(&tx);

    G_io_apdu_buffer[tx++] = sw >> 8;
    G_io_apdu_buffer[tx++] = sw;

    io_exchange(CHANNEL_APDU | IO_RETURN_AFTER_TX, tx);

    ui_idle();

    return 0; // do not redraw the widget
}

unsigned int io_seproxyhal_touch_verify_transfer_deny(const bagl_element_t *e) {
    G_io_apdu_buffer[0] = 0x69;
    G_io_apdu_buffer[1] = 0x85;
    // Send back the response, do not restart the event loop
    // todo u2f?
//    #if HAVE_U2F
//        if (fido_activated) {
//            u2f_proxy_response((u2f_service_t *)&u2fService, 2);
//        } else {
//    #endif
//            // Send back the response, do not restart the event loop
            io_exchange(CHANNEL_APDU | IO_RETURN_AFTER_TX, 2);
//            #if HAVE_U2F
//        } // close fido_activated if statement
//    #endif
    // Display back the original UX
    ui_idle();
    return 0; // do not redraw the widget
}