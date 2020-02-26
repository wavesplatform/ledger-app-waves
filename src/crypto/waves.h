#ifndef __WAVES_H__
#define __WAVES_H__

#include <stdint.h>
#include <stdbool.h>

#include "base58.h"
#include "os.h"
#include "cx.h"
#include "stream_eddsa_sign.h"

typedef unsigned char ed25519_signature[64];
typedef unsigned char ed25519_public_key[32];
typedef unsigned char ed25519_secret_key[32];

void waves_public_key_to_address(const ed25519_public_key public_key, const unsigned char network_byte, unsigned char *output);
void copy_in_reverse_order(unsigned char *to, const unsigned char *from, const unsigned int len);

#endif
