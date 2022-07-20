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

#ifndef STREAM_EDDSA_SIGN_H
#define STREAM_EDDSA_SIGN_H

#include "os.h"
#include "cx.h"

#define SW_SIGN_DATA_NOT_MATCH 0x9101

// A place to store data during the signing
typedef struct streamEddsaContext_t {
  unsigned char Y[32];   // pu_key'
  unsigned char a[32];   // a
  unsigned char r[32];   // r
  unsigned char sig[64]; // sig
  union {
    unsigned char Q[32 * 2 + 1];
    cx_ecfp_256_public_key_t internal_pu_key;
  } u;
  cx_sha512_t hash_ctx;
  cx_blake2b_t data_hash_ctx;
} streamEddsaContext_t;

void stream_eddsa_sign_step1(streamEddsaContext_t *eddsa_context,
                             const cx_ecfp_private_key_t *pv_key);

void stream_eddsa_sign_step2(streamEddsaContext_t *eddsa_context,
                             const unsigned char *hash, unsigned int hash_len);

void stream_eddsa_sign_step3(streamEddsaContext_t *eddsa_context);

void stream_eddsa_sign_step4(streamEddsaContext_t *eddsa_context,
                             const unsigned char *hash, unsigned int hash_len);

int stream_eddsa_sign_step5(streamEddsaContext_t *eddsa_context,
                            unsigned char *sig);

#endif // STREAM_EDDSA_SIGN_H