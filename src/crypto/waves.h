#ifndef __WAVES_H__
#define __WAVES_H__

#include <stdint.h>
#include <stdbool.h>

void waves_public_key_to_address(const uint8_t public_key[32], const char network_byte, char *output);

#endif
