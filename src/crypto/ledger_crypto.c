#include "ledger_crypto.h"


#include "keypair.h"
#include "os.h"
#include "cx.h"

// converts little endian 65 byte (0x4 32X 32Y) public key to 32 byte Y big endian form (for other applications)
void public_key_le_to_be(cx_ecfp_public_key_t* public_key) {
    uint8_t public_key_be[32];
    // copy public key little endian to big endian
    for (uint8_t i = 0; i < 32; i++) {
        public_key_be[i] = public_key->W[64 - i];
    }
    // set sign bit
    if ((public_key->W[32] & 1) != 0) {
        public_key_be[31] |= 0x80;
    }
    os_memset(public_key->W, 0, 65);
    os_memmove(public_key->W, public_key_be, 32);
}

void get_keypair_by_path(const uint32_t* path, cx_ecfp_public_key_t* public_key, cx_ecfp_private_key_t* private_key) {
    unsigned char privateKeyData[32];
    #ifdef TARGET_BLUE
    os_perso_derive_node_bip32(CX_CURVE_Ed25519, path, 5, privateKeyData, NULL);
    #else
    os_perso_derive_node_bip32_seed_key(HDW_ED25519_SLIP10, CX_CURVE_Ed25519, path, 5, privateKeyData, NULL, (unsigned char*) "ed25519 seed", 12);
    #endif
    cx_ecdsa_init_private_key(CX_CURVE_Ed25519, privateKeyData, 32, private_key);
    cx_ecdsa_init_public_key(CX_CURVE_Ed25519, NULL, 0, public_key);
    cx_ecfp_generate_pair(CX_CURVE_Ed25519, public_key, private_key, 1);
}

// Get a public key from the 44'/5741564' keypath.
bool get_curve25519_public_key_for_path(const uint32_t* path, cx_ecfp_public_key_t* public_key) {
    cx_ecfp_private_key_t private_key;
    // derive the ed25519 keys by that BIP32 path from the device
    get_keypair_by_path(path, public_key, &private_key);
    // clean private key
    os_memset(private_key.d, 0, 32);

    public_key_le_to_be(public_key);

    return ed25519_pk_to_curve25519(public_key->W, public_key->W) == 0;
}

void blake2b_256(const unsigned char* msg, size_t msg_len, void* out)
{
    cx_blake2b_t ctx;
    // size in bits
    cx_blake2b_init(&ctx, 256);
    // size in bytes
    cx_hash(&ctx.header, CX_LAST, (void *)msg, msg_len, out, 32);
}

void keccak_256(const unsigned char* msg, size_t msg_len, void* out)
{
    cx_sha3_t ctx;
    // size in bits
    cx_keccak_init(&ctx, 256);
    // size in bytes
    cx_hash(&ctx.header, CX_LAST, (void *)msg, msg_len, out, 32);
}

void ed25519_sign(signature_t *sig, const unsigned char *msg,
                  unsigned long long msglen, const public_key_t *pk,
                  const private_key_t *sk) {
  cx_sha512_t ctx;
  unsigned char az[64];
  unsigned char nonce[64];  // r
  unsigned char hram[64];
  ge25519_p3 R;

  // todo precalculate from private key
  cx_sha512_init(&ctx);
  cx_hash(&ctx.header, NULL, sk->data, ed25519_privkey_SIZE, NULL, 0);
  cx_hash(&ctx.header, CX_LAST, NULL, 0, az, 64);

  az[0] &= 248;
  az[31] &= 63;
  az[31] |= 64;
  /* az: 64-byte H(sk) */
  /* az: 32-byte scalar a, 32-byte randomizer z */

  cx_sha512_init(&ctx);
  cx_hash(&ctx.header, NULL,  /* z */ az + 32, 32, NULL, 0);
  // todo msg here
  cx_hash(&ctx.header, NULL,  msg, msglen, NULL, 0);
  cx_hash(&ctx.header, CX_LAST, NULL, 0, nonce, 64);
  /* nonce: 64-byte H(z,msg) */

  sc25519_reduce(nonce);
  ge25519_scalarmult_base(&R, nonce);
  ge25519_p3_tobytes(sig->data, &R);
  /* sig: [32 bytes R | 32 bytes uninit] */

  cx_sha512_init(&ctx);
  // first 32 bytes of signature
  cx_hash(&ctx.header, NULL, /* R */ sig->data, 32, NULL, 0);
  cx_hash(&ctx.header, NULL, /* A */ pk->data, ed25519_pubkey_SIZE, NULL, 0);
  // todo msg here
  cx_hash(&ctx.header, NULL, msg, msglen, NULL, 0);
  cx_hash(&ctx.header, CX_LAST, NULL, 0, hram, 64);
  /* hram: 64-byte H(R,A,m) */

  sc25519_reduce(hram);
  sc25519_muladd(sig->data + 32, hram, az, nonce);
  /* sig: [32 bytes R | 32 bytes S] */
}