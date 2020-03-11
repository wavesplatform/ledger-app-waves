#ifndef STREAM_EDDSA_SIGN_H
#define STREAM_EDDSA_SIGN_H

#include "os.h"
#include "cx.h"

#define SW_SIGN_DATA_NOT_MATCH 0x9101

// A place to store data during the signing
typedef struct streamEddsaContext_t {
        unsigned char Y[32]; //pu_key'
        unsigned char a[32]; // a
        unsigned char r[32]; //r
        unsigned char sig[64]; //sig
        union {
          unsigned char Q[32*2+1];
          cx_ecfp_256_public_key_t internal_pu_key;
        }u;
        cx_sha512_t hash_ctx;
        cx_blake2b_t data_hash_ctx;
        unsigned char first_data_hash[32];
} streamEddsaContext_t;

void stream_eddsa_sign_step1(streamEddsaContext_t *eddsa_context, const cx_ecfp_private_key_t *pv_key);

void stream_eddsa_sign_step2(streamEddsaContext_t *eddsa_context, const unsigned char  *hash ,unsigned int hash_len);

void stream_eddsa_sign_step3(streamEddsaContext_t *eddsa_context);

void stream_eddsa_sign_step4(streamEddsaContext_t *eddsa_context, const unsigned char  *hash ,unsigned int hash_len);

int stream_eddsa_sign_step5(streamEddsaContext_t *eddsa_context, unsigned char *sig);

#endif // STREAM_EDDSA_SIGN_H