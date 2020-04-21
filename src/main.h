/*******************************************************************************
 *   Waves Platform Wallet App for Nano Ledger devices
 *   Copyright (c) 2017-2020 Sergey Tolmachev (Tolsi) <tolsi.ru@gmail.com>
 *
 *   Based on Sample code provided (c) 2016 Ledger and
 *                                 (c) 2017-2018 Jake B. (Burstcoin app)
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

#ifndef __MAIN_H__
#define __MAIN_H__
#include "os.h"
#include "cx.h"
#include "stream_eddsa_sign.h"
#include <stdbool.h>

// Host innteration communication protocol
#define CLA 0x80                       // CLASS?
#define INS_SIGN 0x02                  // Sign Instruction
#define INS_GET_PUBLIC_KEY 0x04        // Get Public Key Instruction
#define INS_GET_APP_CONFIGURATION 0x06 // Get App Version
#define P1_CONFIRM 0x01                // Show address confirmation
#define P1_NON_CONFIRM 0x00            // Don't show address confirmation
#define P1_LAST 0x80 // Parameter 1 = End of Bytes to Sign (finalize)
#define P1_MORE 0x00 // Parameter 1 = More bytes coming
#define PB_FIRST_BYTE 0x0A //First byte of protobuf transaction message

#define SW_OK 0x9000
#define SW_USER_CANCELLED 0x9100
#define SW_DEPRECATED_SIGN_PROTOCOL 0x9102
#define SW_DEVICE_IS_LOCKED 0x6986
#define SW_CONDITIONS_NOT_SATISFIED 0x6985
#define SW_BUFFER_OVERFLOW 0x6990
#define SW_INCORRECT_P1_P2 0x6A86
#define SW_INS_NOT_SUPPORTED 0x6D00
#define SW_CLA_NOT_SUPPORTED 0x6E00
#define SW_SECURITY_STATUS_NOT_SATISFIED 0x6982

#define COLOR_BG_1 0xF9F9F9
#define COLOR_APP 0x0055FF
#define COLOR_APP_LIGHT 0x87dee6

typedef struct internal_storage_t {
  uint8_t fido_transport;
  uint8_t initialized;
} internal_storage_t;

extern internal_storage_t const N_storage_real;
#define N_storage (*(volatile internal_storage_t *)PIC(&N_storage_real))

// A place to store information about the transaction
// for displaying to the user when requesting approval
// 44 for address/id and +1 for \0
typedef struct uiContext_t {
  unsigned char line1[45];
  unsigned char line2[45];
  unsigned char line3[45];
  unsigned char line4[45];
  unsigned char line5[45];
  unsigned char line6[45];
  unsigned char line7[45];
  unsigned char line8[45];
  unsigned char id[32];
  unsigned char buffer[150];
  unsigned char tmp[50];
  uint8_t step;
  uint8_t wait_in_buffer;
  uint8_t buffer_used;
  uint32_t chunk_used;
  uint16_t alias_size;
  uint16_t attachment_size;
  bool finished;
} uiContext_t;

// A place to store data during the signing
typedef struct signingContext_t {
  uint32_t bip32[5];
  unsigned char sign_bit;
  unsigned char amount_decimals;
  unsigned char fee_decimals;
  unsigned char data_type;
  unsigned char data_version;
  unsigned char network_byte;
  uint32_t data_size;
  uint32_t data_read;
  uint32_t chunk_used;
  uint32_t chunk;
  uint8_t step;
  uint8_t sign_from;
  streamEddsaContext_t eddsa_context;
} signingContext_t;

// A place to store data during the confirming the address
typedef struct addressesContext_t {
  unsigned char address[36];
  unsigned char public_key[32];
} addressesContext_t;

typedef union {
  signingContext_t signing_context;
  addressesContext_t address_context;
} tmpContext_t;

extern uiContext_t ui_context;

extern tmpContext_t tmp_ctx; // Temporary area to store stuff

bool get_curve25519_public_key_for_path(const uint32_t *path,
                                        cx_ecfp_public_key_t *public_key);

void init_context();
uint32_t set_result_get_address();
uint32_t set_result_sign();

#endif
