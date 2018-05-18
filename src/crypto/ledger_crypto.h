#ifndef __LEDGER_CRYPTO_H__
#define __LEDGER_CRYPTO_H__

#include "os.h"
#include <stdbool.h>

void public_key_le_to_be(cx_ecfp_public_key_t* public_key);
void get_keypair_by_path(const uint32_t* path, cx_ecfp_public_key_t* public_key, cx_ecfp_private_key_t* private_key);
bool get_curve25519_public_key_for_path(const uint32_t* path, cx_ecfp_public_key_t* public_key);

#endif