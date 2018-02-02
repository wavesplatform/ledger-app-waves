/*******************************************************************************
*   Burstcoin Wallet App for Nano Ledger S.
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

#include <stdbool.h>

#include "main.h"
#include "crypto/curve25519_i64.h"
#include "crypto/rs_address.h"

// Ledger Stuff
#include "ui.h"
#include "os.h"
#include "cx.h"
#include "os_io_seproxyhal.h"

// This symbol is defined by the link script to be at the start of the stack
// area.  Intended for stack canary
extern unsigned long _stack;
#define STACK_CANARY (*((volatile uint32_t*) &_stack))

void init_canary() {
    STACK_CANARY = 0xDEADBEEF;
}

void check_canary() {
    if (STACK_CANARY != 0xDEADBEEF)
        THROW(EXCEPTION_OVERFLOW);
}

// Temporary area to sore stuff and reuse the same memory
tmpContext_t tmpCtx;

#ifdef HAVE_U2F

// U2F Stuff
#include "u2f/u2f_service.h"
#include "u2f/u2f_transport.h"

volatile unsigned char u2fMessageBuffer[U2F_MAX_MESSAGE_SIZE];
volatile u2f_service_t u2fService;

#endif

// Non-volatile storage for the wallet app's stuff
WIDE internalStorage_t N_storage_real;

// SPI Buffer for io_event
unsigned char G_io_seproxyhal_spi_buffer[IO_SEPROXYHAL_BUFFER_SIZE_B];

// Stuff for the SHA-256 hashing
volatile unsigned int hashCount;     // notification to restart the hash
cx_sha256_t hash;

// Supported device errors for preprocessor
#ifdef TARGET_BLUE
#error This application does not support the Ledger Blue
#endif

#ifndef TARGET_NANOS
#error This application only supports the Ledger Nano S
#endif

#ifdef HAVE_U2F

// Function to respond to a u2f request.  Similar to the io_exchange function
void u2f_proxy_response(u2f_service_t *service, unsigned int tx) {
    os_memset(service->messageBuffer, 0, 5);
    os_memmove(service->messageBuffer + 5, G_io_apdu_buffer, tx);
    service->messageBuffer[tx + 5] = 0x90;
    service->messageBuffer[tx + 6] = 0x00;
    u2f_send_fragmented_response(service, U2F_CMD_MSG, service->messageBuffer,
                                 tx + 7, true);
}

#endif

unsigned short io_exchange_al(unsigned char channel, unsigned short tx_len) {
    switch (channel & ~(IO_FLAGS)) {
    case CHANNEL_KEYBOARD:
        break;

    // multiplexed io exchange over a SPI channel and TLV encapsulated protocol
    case CHANNEL_SPI:
        if (tx_len) {
            io_seproxyhal_spi_send(G_io_apdu_buffer, tx_len);

            if (channel & IO_RESET_AFTER_REPLIED) {
                reset();
            }
            return 0; // nothing received from the master so far (it's a tx
                      // transaction)
        } else {
            return io_seproxyhal_spi_recv(G_io_apdu_buffer,
                                          sizeof(G_io_apdu_buffer), 0);
        }

    default:
        THROW(INVALID_PARAMETER);
    }
    return 0;
}

// Get a public key from the 44'/5741564' keypath.
static bool getPublicKeyForIndex(int index, cx_ecfp_public_key_t* publicKey) {
    if (!os_global_pin_is_validated()) {
        return false;
    }

    if ((N_storage.keyIndex != NO_KEY_STORED) && (N_storage.keyIndex == index)) {
        publicKey->W_len = 32;
        publicKey->curve = CX_CURVE_Curve25519;
        os_memmove(publicKey->W, N_storage.publicKey, 32);
        return true;
    }

    // BURST keypath of 44'/5741564'0'/0'/n' https://github.com/satoshilabs/slips/pull/189/
    uint32_t path[] = {44 | 0x80000000, 5741564 | 0x80000000, 0x80000000, 0x80000000, index | 0x80000000};

    unsigned char privateKeyData[32];
    os_perso_derive_node_bip32(CX_CURVE_Ed25519, path, 5, privateKeyData, NULL);
    keygen25519(publicKey->W, NULL, privateKeyData);
    publicKey->W_len = 32;
    publicKey->curve = CX_CURVE_Curve25519;
    
    // Store the computed key in flash
    internalStorage_t storage;
    os_memmove(&storage, &N_storage, sizeof(internalStorage_t));
    storage.keyIndex = index;
    os_memmove(storage.publicKey, publicKey->W, 32);
    nvm_write(&N_storage, (void *)&storage, sizeof(internalStorage_t));

    return true;
}

// // Get a signing key from the 44'/5741564' keypath.
// todo receive link to privateKeyData array and returns boolean
static bool getSigningKeyForIndex(int index) {
    if (!os_global_pin_is_validated()) {
        return false;
    }

    // BURST keypath of 44'/5741564'/n'/0'/0'
    uint32_t path[] = {44 | 0x80000000, 5741564 | 0x80000000, 0x80000000, 0x80000000, index | 0x80000000};

    unsigned char privateKeyData[32];
    os_perso_derive_node_bip32(CX_CURVE_Ed25519, path, 5, privateKeyData, NULL);

    clamp25519(privateKeyData);

    return privateKeyData;
}

// Hanlde a signing request -- called both from the main apdu loop as well as from
// the button handler after the user verifies the transaction.
bool handleSigning(volatile unsigned int *tx, volatile unsigned int *flags) {
    // realize that
    return true;
}

// Called by both the U2F and the standard communications channel
void handleApdu(volatile unsigned int *flags, volatile unsigned int *tx, volatile unsigned int rx) {
    unsigned short sw = 0;
    BEGIN_TRY {
        TRY {
            
            if (G_io_apdu_buffer[0] != CLA) {
                THROW(SW_CLA_NOT_SUPPORTED);
            }

            switch (G_io_apdu_buffer[1]) {
            case INS_SIGN: {
                if (G_io_apdu_buffer[4] != rx - 5) {
                    // the length of the APDU should match what's int he 5-byte header.
                    // If not fail.  Don't want to buffer overrun or anything.
                    THROW(SW_CONDITIONS_NOT_SATISFIED);
                }
                if ((G_io_apdu_buffer[2] != P1_MORE) &&
                    (G_io_apdu_buffer[2] != P1_LAST)) {
                    THROW(SW_INCORRECT_P1_P2);
                }

                if (hashCount == 0) {
                    if (G_io_apdu_buffer)
                    ui_verify();
                    *flags |= IO_ASYNCH_REPLY;
                } else {
                    bool more = handleSigning(tx, flags);
                    THROW(SW_OK);    
                }
                
            } break;

            case INS_GET_PUBLIC_KEY: {
                // Get the public key and return it.
                cx_ecfp_public_key_t publicKey;
                // todo return private key only for debug
                // todo pass link to privateKeyData array
                unsigned char* privateKeyData = getSigningKeyForIndex(0);
                if (getPublicKeyForIndex(0, &publicKey)) {
                    os_memmove(G_io_apdu_buffer, publicKey.W, 32);
                    os_memmove(G_io_apdu_buffer + 32, privateKeyData, 32);
                    *tx = 64;
                    THROW(SW_OK);
                } else {
                    // Return an error
                    THROW(SW_INS_NOT_SUPPORTED);
                }
            } break;

            default:
                // Instruction not supported
                THROW(SW_INS_NOT_SUPPORTED);
                break;
            }
        }
        CATCH(EXCEPTION_IO_RESET) {
            THROW(EXCEPTION_IO_RESET);
        }
        CATCH_OTHER(e) {
            switch (e & 0xF000) {
            case 0x6000:
                // TODO: WIPE/Clean Up if necessary?
                sw = e;                
                break;
            case 0x9000:
                // All is well
                sw = e;
                break;
            default:
                // Internal error
                sw = 0x6800 | (e & 0x7FF);
                break;
            }
            // Unexpected exception => report
            G_io_apdu_buffer[*tx] = sw >> 8;
            G_io_apdu_buffer[*tx + 1] = sw;
            *tx += 2;
        }
        FINALLY {
        }
    END_TRY;
    }
}

static void waves_main(void) {
    volatile unsigned int rx = 0;
    volatile unsigned int tx = 0;
    volatile unsigned int flags = 0;

    // next timer callback in 500 ms
    UX_CALLBACK_SET_INTERVAL(500);

    // DESIGN NOTE: the bootloader ignores the way APDU are fetched. The only
    // goal is to retrieve APDU.
    // When APDU are to be fetched from multiple IOs, like NFC+USB+BLE, make
    // sure the io_event is called with a
    // switch event, before the apdu is replied to the bootloader. This avoid
    // APDU injection faults.
    for (;;) {
        volatile unsigned short sw = 0;

        BEGIN_TRY {
            TRY {
                rx = tx;
                tx = 0; // ensure no race in catch_other if io_exchange throws
                        // an error
                rx = io_exchange(CHANNEL_APDU | flags, rx);
                flags = 0;

                // no apdu received, well, reset the session, and reset the
                // bootloader configuration
                if (rx == 0) {
                    THROW(SW_SECURITY_STATUS_NOT_SATISFIED);
                }

                // Call the Apdu handler,
                handleApdu(&flags, &tx, rx);
            }
            CATCH(EXCEPTION_IO_RESET) {
                THROW(EXCEPTION_IO_RESET);
            }
            CATCH_OTHER(e) {
                switch (e & 0xF000) {
                case 0x6000:
                case 0x9000:
                    sw = e;
                    break;
                default:
                    sw = 0x6800 | (e & 0x7FF);
                    break;
                }
                // Unexpected exception => report
                G_io_apdu_buffer[tx] = sw >> 8;
                G_io_apdu_buffer[tx + 1] = sw;
                tx += 2;
            }
            FINALLY {
            }
        }
        END_TRY;
    }

    return;
}

void io_seproxyhal_display(const bagl_element_t *element) {
    io_seproxyhal_display_default((bagl_element_t *)element);
}

unsigned char io_event(unsigned char channel) {
    //check_canary();
    // nothing done with the event, throw an error on the transport layer if
    // needed
    // can't have more than one tag in the reply, not supported yet.
    switch (G_io_seproxyhal_spi_buffer[0]) {
    case SEPROXYHAL_TAG_FINGER_EVENT:
        UX_FINGER_EVENT(G_io_seproxyhal_spi_buffer);
        break;

    case SEPROXYHAL_TAG_BUTTON_PUSH_EVENT: // for Nano S
        UX_BUTTON_PUSH_EVENT(G_io_seproxyhal_spi_buffer);
        break;

    case SEPROXYHAL_TAG_DISPLAY_PROCESSED_EVENT:
        UX_DISPLAYED_EVENT({ });
        break;

    case SEPROXYHAL_TAG_TICKER_EVENT:
        UX_TICKER_EVENT(G_io_seproxyhal_spi_buffer, {
            if (ux_step_count && UX_ALLOWED) {
                // prepare next screen
                ux_step = (ux_step + 1) % ux_step_count;
                // redisplay screen
                UX_REDISPLAY();
            }
        });
        break;

    // unknown events are acknowledged
    default:
        UX_DEFAULT_EVENT();
        break;
    }

    // close the event if not done previously (by a display or whatever)
    if (!io_seproxyhal_spi_is_status_sent()) {
        io_seproxyhal_general_status();
    }

    // command has been processed, DO NOT reset the current APDU transport
    return 1;
}

void app_exit(void) {
    BEGIN_TRY_L(exit) {
        TRY_L(exit) {
            os_sched_exit(-1);
        }
        FINALLY_L(exit) {
        }
    }
    END_TRY_L(exit);
}

__attribute__((section(".boot"))) int main(void) {
    // exit critical section
    __asm volatile("cpsie i");

    //init_canary();

    // current_text_pos = 0;
    // text_y = 60;
    hashCount = 0;
    uiState = UI_IDLE;

    for (;;) {
        // ensure exception will work as planned
        os_boot();

        UX_INIT();

        BEGIN_TRY {
            TRY {
                io_seproxyhal_init();

                if (N_storage.initialized != 0x01) {
                    internalStorage_t storage;
                    storage.fidoTransport = 0x00;
                    storage.initialized = 0x01;
                    storage.keyIndex = NO_KEY_STORED;
                    os_memset(storage.publicKey, 0, 32);
                    nvm_write(&N_storage, (void *)&storage,
                              sizeof(internalStorage_t));
                }

    #ifdef HAVE_U2F
                    os_memset((unsigned char *)&u2fService, 0, sizeof(u2fService));
                    u2fService.inputBuffer = G_io_apdu_buffer;
                    u2fService.outputBuffer = G_io_apdu_buffer;
                    u2fService.messageBuffer = (uint8_t *)u2fMessageBuffer;
                    u2fService.messageBufferSize = U2F_MAX_MESSAGE_SIZE;
                    u2f_initialize_service((u2f_service_t *)&u2fService);

                    USB_power_U2F(1, N_storage.fidoTransport);
    #else  // HAVE_U2F
                    USB_power_U2F(1, 0);
    #endif // HAVE_U2F

                ui_idle();

                waves_main();
            }
            CATCH(EXCEPTION_IO_RESET) {
                // reset IO and UX before continuing
                continue;
            }
            CATCH_ALL {
                break;
            }
            FINALLY {
            }
        }
        END_TRY;
    }
    app_exit();
    return 0;
}
