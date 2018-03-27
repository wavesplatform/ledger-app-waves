#include "base58.h"
#include "blake2b.h"
#include "sha3.h"


void waves_secure_hash(const uint8_t *message, size_t message_len, uint8_t hash[32])
{
	blake2b(message, message_len, hash, 32);
    keccak_256(hash, 32, hash);
}

void waves_message_sign(const HDNode *node, const unsigned char *message, ed25519_signature signature)
{
    // ed25519 signature with the sha512 hashing
    ed25519_sign(message, sizeof(message), node->private_key, node->public_key + 1, signature);
    // set the sign bit from ed25519 public key (using 31 byte) for curve25519 validation used in waves (this makes the ed25519 signature invalid)
    unsigned char sign_bit = node->public_key[32] & 0x80;
    signature[63] |= sign_bit;
}

// todo move all that stuff to crypto module
// Build waves address from the curve25519 public key, check https://github.com/wavesplatform/Waves/wiki/Data-Structures#address
void waves_public_key_to_address(const uint8_t public_key[32], const char network_byte, char *output) {
    uint8_t public_key_hash[32];
    uint8_t address[22];
    uint8_t checksum[32];
    waves_secure_hash(public_key, 32, public_key_hash);

    address[0] = 0x01;
    address[1] = network_byte;
    memcpy(&address[2], public_key_hash, 20);

    waves_secure_hash(address, 22, checksum);

    memcpy(&address[22], checksum, 4);

    size_t length = 36;
    b58enc(output, &length, address, 26);
    output[length] = 0;
}