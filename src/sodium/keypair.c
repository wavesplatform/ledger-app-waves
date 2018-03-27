#include <string.h>

#include "keypair.h"

int ed25519_pk_to_curve25519(unsigned char *curve25519_pk, const unsigned char *ed25519_pk)
{
    ge25519_p3 A;
    fe25519    x;
    fe25519    one_minus_y;

    if (ge25519_has_small_order(ed25519_pk) != 0 ||
        ge25519_frombytes_negate_vartime(&A, ed25519_pk) != 0 ||
        ge25519_is_on_main_subgroup(&A) == 0) {
        return -1;
    }
    fe25519_1(one_minus_y);
    fe25519_sub(one_minus_y, one_minus_y, A.Y);
    fe25519_invert(one_minus_y, one_minus_y);
    fe25519_1(x);
    fe25519_add(x, x, A.Y);
    fe25519_mul(x, x, one_minus_y);
    fe25519_tobytes(curve25519_pk, x);

    return 0;
}