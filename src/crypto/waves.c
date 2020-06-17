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
#include "main.h"
#include "waves.h"
#include "ledger_crypto.h"
#include "stream_eddsa_sign.h"

void waves_secure_hash(const uint8_t *message, size_t message_len,
                       uint8_t hash[32]) {
  blake2b_256(message, message_len, hash);
  keccak_256(hash, 32, hash);
}

// Build waves address from the curve25519 public key, check
// https://docs.wavesprotocol.org/ru/blockchain/binary-format/address-binary-format
void waves_public_key_to_address(const ed25519_public_key public_key,
                                 const unsigned char network_byte,
                                 unsigned char *output) {
  uint8_t public_key_hash[32];
  uint8_t address[26];
  uint8_t checksum[32];
  waves_secure_hash(public_key, 32, public_key_hash);

  address[0] = 0x01;
  address[1] = network_byte;
  os_memmove(&address[2], public_key_hash, 20);

  waves_secure_hash(address, 22, checksum);

  os_memmove(&address[22], checksum, 4);

  size_t length = 36;
  b58enc((char *)output, &length, address, 26);
}

void waves_public_key_hash_to_address(
    const ed25519_public_key_hash public_key_hash,
    const unsigned char network_byte, unsigned char *output) {
  uint8_t address[26];
  uint8_t checksum[32];
  address[0] = 0x01;
  address[1] = network_byte;
  os_memmove(&address[2], public_key_hash, 20);
  waves_secure_hash(address, 22, checksum);
  os_memmove(&address[22], checksum, 4);
  size_t length = 36;
  b58enc((char *)output, &length, address, 26);
}

void copy_in_reverse_order(unsigned char *to, const unsigned char *from,
                           const unsigned int len) {
  for (uint16_t i = 0; i < len; i++) {
    to[i] = from[(len - 1) - i];
  }
}