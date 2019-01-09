#ifndef __LEDGER_CRYPTO_H__
#define __LEDGER_CRYPTO_H__

#include "os.h"
#include <stdbool.h>
#include <stdint.h>

void public_key_le_to_be(cx_ecfp_public_key_t* public_key);
void get_keypair_by_path(const uint32_t* path, cx_ecfp_public_key_t* public_key, cx_ecfp_private_key_t* private_key);
bool get_curve25519_public_key_for_path(const uint32_t* path, cx_ecfp_public_key_t* public_key);
void blake2b_256(const uint8_t *msg, uint32_t msg_len, void *out);
void keccak_256(const unsigned char* data, size_t len, unsigned char* digest);

#endif