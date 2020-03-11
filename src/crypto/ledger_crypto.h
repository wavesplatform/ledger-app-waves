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

#ifndef __LEDGER_CRYPTO_H__
#define __LEDGER_CRYPTO_H__

#include "os.h"
#include <stdbool.h>

void public_key_le_to_be(cx_ecfp_public_key_t *public_key);
void get_keypair_by_path(const uint32_t *path, cx_ecfp_public_key_t *public_key,
                         cx_ecfp_private_key_t *private_key);
bool get_curve25519_public_key_for_path(const uint32_t *path,
                                        cx_ecfp_public_key_t *public_key);
void blake2b_256(const unsigned char *msg, size_t msg_len, void *out);
void keccak_256(const unsigned char *msg, size_t msg_len, void *out);

#define ed25519_pubkey_SIZE 32
#define ed25519_privkey_SIZE 32
#define ed25519_signature_SIZE 64

typedef struct {
  unsigned char data[ed25519_signature_SIZE];
} signature_t;

typedef struct {
  unsigned char data[ed25519_pubkey_SIZE];
} public_key_t;

typedef struct {
  unsigned char data[ed25519_privkey_SIZE];
} private_key_t;

/* type safe interface methods for ed25519 */
/**
 * @brief Sign msg with keypair {pk, sk}
 * @param sig[out] signature
 * @param msg[in] message
 * @param msglen[in] message size in bytes
 * @param pk[in] public key
 * @param sk[in] secret (private) key
 */
void ed25519_sign(signature_t *sig, const unsigned char *msg,
                  unsigned long long msglen, const public_key_t *pk,
                  const private_key_t *sk);

#endif