
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

#ifndef __MAIN_H__
#define __MAIN_H__
#include "os.h"
#include "cx.h"
#include "constants.h"

#ifdef HAVE_U2F

#include "u2f/u2f_service.h"
#include "u2f/u2f_transport.h"

extern volatile unsigned char u2fMessageBuffer[U2F_MAX_MESSAGE_SIZE];
extern volatile u2f_service_t u2fService;
extern bool fido_activated;
extern void USB_power_U2F(unsigned char enabled, unsigned char fido);
void u2f_proxy_response(u2f_service_t *service, unsigned int tx);

#endif

// Host innteration communication protocol
#define CLA 0x80                // CLASS? 
#define INS_SIGN 0x02           // Sign Instruction
#define INS_GET_PUBLIC_KEY 0x04 // Get Public Key Instruction
#define P1_LAST 0x80            // Parameter 1 = End of Bytes to Sign (finalize)
#define P1_MORE 0x00            // Parameter 1 = More bytes coming


#define SW_OK 0x9000
#define SW_CONDITIONS_NOT_SATISFIED 0x6985
#define SW_INCORRECT_P1_P2 0x6A86
#define SW_INS_NOT_SUPPORTED 0x6D00
#define SW_CLA_NOT_SUPPORTED  0x6E00
#define SW_SECURITY_STATUS_NOT_SATISFIED 0x6982

typedef struct internal_storage_t {
    uint8_t 			 fido_transport;
    uint8_t 			 initialized;
} internal_storage_t;

extern WIDE internal_storage_t N_storage_real;
#define N_storage (*(WIDE internal_storage_t *)PIC(&N_storage_real))

// A place to store information about the transaction
// for displaying to the user when requesting approval
// 44 for address/id and +1 for \0
typedef struct uiContext_t {
	unsigned char line1[450];
	unsigned char line2[45];
	unsigned char line3[45];
	unsigned char line4[45];
	unsigned char line5[45];
	unsigned char line6[45];
	unsigned char line7[45];
	unsigned char line8[45];
} uiContext_t;

// A place to store data during the signing
typedef struct signingContext_t {
    // bip32 path
	uint32_t bip32[5];
	unsigned char amount_decimals;
	unsigned char fee_decimals;
	// Stuff for the SHA-256 hashing
    // Curve25519 support only full message hash
	unsigned char buffer[MAX_DATA_SIZE];
	uint32_t buffer_used;
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

bool get_curve25519_public_key_for_path(const uint32_t* path, cx_ecfp_public_key_t* public_key);

void init_context();
uint32_t get_sign_data_offset();
uint32_t set_result_get_address();
uint32_t set_result_sign();

#endif
