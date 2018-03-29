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

#include <stdbool.h>

#include "main.h"
#include "constants.h"
#include "crypto/waves.h"

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
// Curve25519 support only full message hash
volatile unsigned int bufferUsed;
unsigned char buffer[MAX_DATA_SIZE];

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

static void getKeypairByPath(const uint32_t* path, cx_ecfp_public_key_t* publicKey, cx_ecfp_private_key_t* privateKey) {
    unsigned char privateKeyData[32];
    os_perso_derive_node_bip32(CX_CURVE_Ed25519, path, 5, privateKeyData, NULL);
    cx_ecdsa_init_private_key(CX_CURVE_Ed25519, privateKeyData, 32, privateKey);
    cx_ecdsa_init_public_key(CX_CURVE_Ed25519, NULL, 0, publicKey);
    cx_ecfp_generate_pair(CX_CURVE_Ed25519, publicKey, privateKey, 1);
}

// Get a public key from the 44'/5741564' keypath.
static bool getPublicKeyForPath(const uint32_t* path, cx_ecfp_public_key_t* publicKey) {
    if (!os_global_pin_is_validated()) {
        return false;
    }

    cx_ecfp_private_key_t privateKey;
    getKeypairByPath(path, publicKey, &privateKey);
    os_memset(privateKey.d, 0, 32);

    uint8_t publicKey_be[32];
    // copy public key little endian to big endian
    for (uint8_t i = 0; i < 32; i++) {
        publicKey_be[i] = publicKey->W[64 - i];
    }
    if ((publicKey->W[32] & 1) != 0) {
        publicKey_be[31] |= 0x80;
    }
    os_memmove(publicKey->W, publicKey_be, 32);

    return true;
}

static bool getPrivateKeyForPath(uint32_t* path, cx_ecfp_private_key_t* privateKey) {
    if (!os_global_pin_is_validated()) {
        return false;
    }

    cx_ecfp_public_key_t publicKey;
    getKeypairByPath(path, &publicKey, privateKey);
    os_memset(publicKey.W, 0, 32);

    return true;
}

// // Get a signing key from the 44'/5741564' keypath.
// todo receive link to privateKeyData array and returns boolean
static bool getSigningKeyForIndex(int index, cx_ecfp_private_key_t* privateKey) {
    if (!os_global_pin_is_validated()) {
        return false;
    }

//    // WAVES keypath of 44'/5741564'0'/0'/n' https://github.com/satoshilabs/slips/pull/189/
//    uint32_t path[] = {44 | 0x80000000, 5741564 | 0x80000000, 0x80000000, 0x80000000, index | 0x80000000};
//
//    unsigned char privateKeyData[32];
//    cx_ecfp_public_key_t publicKey;
//
//    os_perso_derive_node_bip32(CX_CURVE_Ed25519, path, 5, privateKeyData, NULL);
//    cx_ecdsa_init_private_key(CX_CURVE_Ed25519, privateKeyData, 32, &privateKey);
//
//    // generate the public key.
//    cx_ecdsa_init_public_key(CX_CURVE_Ed25519, NULL, 0, &publicKey);
//    cx_ecfp_generate_pair(CX_CURVE_Ed25519, &publicKey, &privateKey, 1);
//
////    keygen25519(NULL, privateKey->d, privateKeyData);
//    os_memmove(storage.publicKey, publicKey->d, 32);
//    privateKey->curve = CX_CURVE_Curve25519;
//    privateKey->d_len = 32;

    return true;
}

// Hanlde a signing request -- called both from the main apdu loop as well as from
// the button handler after the user verifies the transaction.

// like https://github.com/lenondupe/ledger-app-stellar/blob/master/src/main.c#L1784
bool handleSigning(volatile unsigned int *tx, volatile unsigned int *flags) {
    // Update the data from this segment.
    os_memmove(buffer + bufferUsed, G_io_apdu_buffer+5, G_io_apdu_buffer[4]);
    bufferUsed = bufferUsed + G_io_apdu_buffer[4];

    // If this is the last segment, calculate the signature
    if (G_io_apdu_buffer[2] == P1_LAST) {
        cx_ecfp_public_key_t publicKey;
        cx_ecfp_private_key_t privateKey;

        int index = 0;

        uint32_t path[] = {44 | 0x80000000, 5741564 | 0x80000000, 0x80000000, 0x80000000, index | 0x80000000};

        unsigned char privateKeyData[32];
        os_perso_derive_node_bip32(CX_CURVE_Ed25519, path, 5, privateKeyData, NULL);
        cx_ecdsa_init_private_key(CX_CURVE_Ed25519, privateKeyData, 32, &privateKey);
        cx_ecdsa_init_public_key(CX_CURVE_Ed25519, NULL, 0, &publicKey);
        cx_ecfp_generate_pair(CX_CURVE_Ed25519, &publicKey, &privateKey, 1);

        uint8_t publicKey_be[32];
        // copy public key little endian to big endian
        for (uint8_t i = 0; i < 32; i++) {
            publicKey_be[i] = publicKey.W[64 - i];
        }
        if ((publicKey.W[32] & 1) != 0) {
            publicKey_be[31] |= 0x80;
        }

        uint8_t signature[64];
        cx_eddsa_sign(&privateKey, CX_LAST, CX_SHA512, buffer, bufferUsed, NULL, 0, signature, NULL);

        os_memmove(G_io_apdu_buffer, signature, sizeof(signature));

        *tx = sizeof(signature);
        bufferUsed = 0;
        return false;
    }

    return true;
}

uint32_t deserialize_uint32_t(unsigned char *buffer)
{
    uint32_t value = 0;

    value |= buffer[0] << 24;
    value |= buffer[1] << 16;
    value |= buffer[2] << 8;
    value |= buffer[3];
    return value;

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

//                if (hashCount == 0) {
//                     todo fix UI to Waves Transactions
//                    if (G_io_apdu_buffer)
//                    ui_verify();
//                    *flags |= IO_ASYNCH_REPLY;
//                } else {
                    bool more = handleSigning(tx, flags);
                    THROW(SW_OK);
//                }

            } break;

            case INS_GET_PUBLIC_KEY: {
                if (G_io_apdu_buffer[4] != rx - 5 || G_io_apdu_buffer[4] != 20) {
                    // the length of the APDU should match what's int he 5-byte header.
                    // If not fail.  Don't want to buffer overrun or anything.
                    THROW(SW_CONDITIONS_NOT_SATISFIED);
                }
                // Get the public key and return it.
                cx_ecfp_public_key_t publicKey;

                uint32_t path[5];
                path[0] = deserialize_uint32_t(&G_io_apdu_buffer[5]);
                path[1] = deserialize_uint32_t(&G_io_apdu_buffer[9]);
                path[2] = deserialize_uint32_t(&G_io_apdu_buffer[13]);
                path[3] = deserialize_uint32_t(&G_io_apdu_buffer[17]);
                path[4] = deserialize_uint32_t(&G_io_apdu_buffer[21]);

                getPublicKeyForPath(path, &publicKey);

                char address[35];
                waves_public_key_to_address(publicKey.W, 'W', address);

                os_memmove(G_io_apdu_buffer, publicKey.W, 32);
                os_memmove(G_io_apdu_buffer + 32, address, 35);

                *tx = 67;
                THROW(SW_OK);
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
    bufferUsed = 0;
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
