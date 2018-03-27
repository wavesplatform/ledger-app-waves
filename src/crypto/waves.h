#ifndef __WAVES_H__
#define __WAVES_H__

#include <stdint.h>
#include <stdbool.h>

typedef unsigned char ed25519_signature[64];
typedef unsigned char ed25519_public_key[32];
typedef unsigned char ed25519_secret_key[32];

void waves_public_key_to_address(const ed25519_public_key public_key, const char network_byte, char *output);
void waves_message_sign(const ed25519_secret_key private_key, const ed25519_public_key public_key, const unsigned char *message, ed25519_signature signature);

#endif
