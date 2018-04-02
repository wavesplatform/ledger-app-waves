#ifndef __KEYPAIR_H__
#define __KEYPAIR_H__

#include <string.h>

#include "private/ed25519_ref10.h"

int ed25519_pk_to_curve25519(unsigned char *curve25519_pk, const unsigned char *ed25519_pk);

#endif