#ifndef __BLAKE2B_H__
#define __BLAKE2B_H__

#include <stdint.h>
#include <stddef.h>
#include "os.h"
#include "cx.h"

#define BLAKE2B_CTX blake2b_state
#define BLAKE2B_BLOCK_LENGTH   BLAKE2B_BLOCKBYTES
#define BLAKE2B_DIGEST_LENGTH  BLAKE2B_OUTBYTES
#define BLAKE2B_KEY_LENGTH     BLAKE2B_KEYBYTES

int blake2b_Init(blake2b_state *S, size_t outlen);
int blake2b_InitKey(blake2b_state *S, size_t outlen, const void *key, size_t keylen);
int blake2b_Update(blake2b_state *S, const void *pin, size_t inlen);
int blake2b_Final(blake2b_state *S, void *out, size_t outlen);

int blake2b(const uint8_t *msg, uint32_t msg_len, void *out, size_t outlen);
int blake2b_Key(const uint8_t *msg, uint32_t msg_len, const void *key, size_t keylen, void *out, size_t outlen);

#endif
