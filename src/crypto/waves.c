#include "waves.h"
#include "ledger_crypto.h"
#include "stream_eddsa_sign.h"

void waves_secure_hash(const uint8_t *message, size_t message_len, uint8_t hash[32])
{
    blake2b_256(message, message_len, hash);
    keccak_256(hash, 32, hash);
}

void waves_message_sign(const cx_ecfp_private_key_t *private_key, const ed25519_public_key public_key, const unsigned char *message, const size_t message_size, streamEddsaContext_t *eddsa_context, ed25519_signature signature) {
    // ed25519 signature with the sha512 hashing
    stream_eddsa_sign_step1(eddsa_context, private_key);
    stream_eddsa_sign_step2(eddsa_context, message, message_size);
    stream_eddsa_sign_step3(eddsa_context);
    stream_eddsa_sign_step4(eddsa_context, message, message_size);
    stream_eddsa_sign_step5(eddsa_context, signature);
    // set the sign bit from ed25519 public key (using 31 byte) for curve25519 validation used in waves (this makes the ed25519 signature invalid)
    unsigned char sign_bit = public_key[31] & 0x80;
    signature[63] |= sign_bit;
}

// Build waves address from the curve25519 public key, check https://github.com/wavesplatform/Waves/wiki/Data-Structures#address
void waves_public_key_to_address(const ed25519_public_key public_key, const unsigned char network_byte, unsigned char *output) {
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
    b58enc((char *) output, &length, address, 26);
}

void copy_in_reverse_order(unsigned char *to, const unsigned char *from, const unsigned int len) {
    for (uint16_t i = 0; i < len; i++) {
        to[i] = from[(len - 1) - i];
    }
}