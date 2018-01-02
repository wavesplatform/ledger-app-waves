
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

#ifndef __MAIN_H__
#define __MAIN_H__
#include "os.h"
#include "cx.h"

#ifdef HAVE_U2F

#include "u2f/u2f_service.h"
#include "u2f/u2f_transport.h"

extern volatile unsigned char u2fMessageBuffer[U2F_MAX_MESSAGE_SIZE];
extern volatile u2f_service_t u2fService;
extern bool fidoActivated;
extern void USB_power_U2F(unsigned char enabled, unsigned char fido);
void u2f_proxy_response(u2f_service_t *service, unsigned int tx);

#endif

// Host innteration communication protocol
#define CLA 0x80                // CLASS? 
#define INS_SIGN 0x02           // Sign Instruction
#define INS_GET_PUBLIC_KEY 0x04 // Get Public Key Instruction
#define INS_PING 0x06           // Respond with PONG
#define P1_LAST 0x80            // Parameter 1 = End of Bytes to Sign (finalize)
#define P1_MORE 0x00            // Parameter 1 = More bytes coming


#define SW_OK 0x9000
#define SW_CONDITIONS_NOT_SATISFIED 0x6985
#define SW_INCORRECT_P1_P2 0x6A86
#define SW_WRONG_P1_P2 0x6B00
#define SW_INS_NOT_SUPPORTED 0x6D00
#define SW_CLA_NOT_SUPPORTED  0x6E00
#define SW_SECURITY_STATUS_NOT_SATISFIED 0x6982

#define KEEP_PRIVATE_KEY 1


extern volatile unsigned int hashCount;     // notification to restart the hash
extern cx_sha256_t hash;

#define NO_KEY_STORED -1

typedef struct internalStorage_t {
    uint8_t 			 fidoTransport;
    uint8_t 			 initialized;
    int	    		     keyIndex;
    unsigned char		 publicKey[32];
} internalStorage_t;

extern WIDE internalStorage_t N_storage_real;
#define N_storage (*(WIDE internalStorage_t *)PIC(&N_storage_real))

bool handleSigning(volatile unsigned int *tx, volatile unsigned int *flags);

// A place to store information about the transaction
// for displaying to the user when requesting approval
typedef struct transactionContext_t {
	char feesAmount[32];
	char fullAddress[32]; 
	char fullAmount[32];
} transactionContext_t;

// A place to store data during hte signing (various)
// hashes and keys.
typedef struct signingContext_t {
	unsigned char m[32];
	unsigned char x[32];
	unsigned char r[32];
} messageSigningContext_t;

typedef union {
    transactionContext_t    transactionContext;
    messageSigningContext_t signingContext;
} tmpContext_t;

extern tmpContext_t tmpCtx; // Temporary area to sore stuff

#endif 
