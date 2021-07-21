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

#include "ledger_crypto.h"

#include "keypair.h"
#include "os.h"
#include "cx.h"
#include "os_io_seproxyhal.h"

// converts little endian 65 byte (0x4 32X 32Y) public key to 32 byte Y big
// endian form (for other applications)
void public_key_le_to_be(cx_ecfp_public_key_t *public_key) {
  uint8_t public_key_be[32];
  // copy public key little endian to big endian
  for (uint8_t i = 0; i < 32; i++) {
    public_key_be[i] = public_key->W[64 - i];
  }
  // set sign bit
  if ((public_key->W[32] & 1) != 0) {
    public_key_be[31] |= 0x80;
  }
  memset(public_key->W, 0, 65);
  memmove(public_key->W, public_key_be, 32);
}

void get_keypair_by_path(const uint32_t *path, cx_ecfp_public_key_t *public_key,
                         cx_ecfp_private_key_t *private_key) {
  unsigned char privateKeyData[32];
#ifdef TARGET_BLUE
  os_perso_derive_node_bip32(CX_CURVE_Ed25519, path, 5, privateKeyData, NULL);
#else
  os_perso_derive_node_bip32_seed_key(HDW_ED25519_SLIP10, CX_CURVE_Ed25519,
                                      path, 5, privateKeyData, NULL,
                                      (unsigned char *)"ed25519 seed", 12);
#endif
  cx_ecdsa_init_private_key(CX_CURVE_Ed25519, privateKeyData, 32, private_key);
  cx_ecdsa_init_public_key(CX_CURVE_Ed25519, NULL, 0, public_key);
  cx_ecfp_generate_pair(CX_CURVE_Ed25519, public_key, private_key, 1);
}

// Get a public key from the 44'/5741564' keypath.
bool get_curve25519_public_key_for_path(const uint32_t *path,
                                        cx_ecfp_public_key_t *public_key) {
  cx_ecfp_private_key_t private_key;
  // derive the ed25519 keys by that BIP32 path from the device
  get_keypair_by_path(path, public_key, &private_key);
  // clean private key
  memset(&private_key, 0, sizeof(cx_ecfp_private_key_t));

  public_key_le_to_be(public_key);

  return ed25519_pk_to_curve25519(public_key->W, public_key->W) == 0;
}

void blake2b_256(const unsigned char *msg, size_t msg_len, void *out) {
  cx_blake2b_t ctx;
  // size in bits
  cx_blake2b_init(&ctx, 256);
  // size in bytes
  cx_hash(&ctx.header, CX_LAST, (void *)msg, msg_len, out, 32);
}

void keccak_256(const unsigned char *msg, size_t msg_len, void *out) {
  cx_sha3_t ctx;
  // size in bits
  cx_keccak_init(&ctx, 256);
  // size in bytes
  cx_hash(&ctx.header, CX_LAST, (void *)msg, msg_len, out, 32);
}