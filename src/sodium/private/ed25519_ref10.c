#include <stddef.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>

#include "ed25519_ref10.h"

/*
 * Field arithmetic:
 * Use 5*51 bit limbs on 64-bit systems with support for 128 bit arithmetic,
 * and 10*25.5 bit limbs elsewhere.
 *
 * Functions used elsewhere that are candidates for inlining are defined
 * via "private/curve25519_ref10.h".
 */


#include "fe_25_5/constants.h"
#include "fe_25_5/fe.h"

void
fe25519_invert(fe25519 out, const fe25519 z)
{
    fe25519 t0;
    fe25519 t1;
    fe25519 t2;
    fe25519 t3;
    int     i;

    fe25519_sq(t0, z);
    fe25519_sq(t1, t0);
    fe25519_sq(t1, t1);
    fe25519_mul(t1, z, t1);
    fe25519_mul(t0, t0, t1);
    fe25519_sq(t2, t0);
    fe25519_mul(t1, t1, t2);
    fe25519_sq(t2, t1);
    for (i = 1; i < 5; ++i) {
        fe25519_sq(t2, t2);
    }
    fe25519_mul(t1, t2, t1);
    fe25519_sq(t2, t1);
    for (i = 1; i < 10; ++i) {
        fe25519_sq(t2, t2);
    }
    fe25519_mul(t2, t2, t1);
    fe25519_sq(t3, t2);
    for (i = 1; i < 20; ++i) {
        fe25519_sq(t3, t3);
    }
    fe25519_mul(t2, t3, t2);
    fe25519_sq(t2, t2);
    for (i = 1; i < 10; ++i) {
        fe25519_sq(t2, t2);
    }
    fe25519_mul(t1, t2, t1);
    fe25519_sq(t2, t1);
    for (i = 1; i < 50; ++i) {
        fe25519_sq(t2, t2);
    }
    fe25519_mul(t2, t2, t1);
    fe25519_sq(t3, t2);
    for (i = 1; i < 100; ++i) {
        fe25519_sq(t3, t3);
    }
    fe25519_mul(t2, t3, t2);
    fe25519_sq(t2, t2);
    for (i = 1; i < 50; ++i) {
        fe25519_sq(t2, t2);
    }
    fe25519_mul(t1, t2, t1);
    fe25519_sq(t1, t1);
    for (i = 1; i < 5; ++i) {
        fe25519_sq(t1, t1);
    }
    fe25519_mul(out, t1, t0);
}

/*
 r = 2 * p
 */

void
ge25519_p2_dbl(ge25519_p1p1 *r, const ge25519_p2 *p)
{
    fe25519 t0;

    fe25519_sq(r->X, p->X);
    fe25519_sq(r->Z, p->Y);
    fe25519_sq2(r->T, p->Z);
    fe25519_add(r->Y, p->X, p->Y);
    fe25519_sq(t0, r->Y);
    fe25519_add(r->Y, r->Z, r->X);
    fe25519_sub(r->Z, r->Z, r->X);
    fe25519_sub(r->X, t0, r->Y);
    fe25519_sub(r->T, r->T, r->Z);
}

/*
 r = p
 */

void
ge25519_p3_to_p2(ge25519_p2 *r, const ge25519_p3 *p)
{
    fe25519_copy(r->X, p->X);
    fe25519_copy(r->Y, p->Y);
    fe25519_copy(r->Z, p->Z);
}

/*
 r = 2 * p
 */

void
ge25519_p3_dbl(ge25519_p1p1 *r, const ge25519_p3 *p)
{
    ge25519_p2 q;
    ge25519_p3_to_p2(&q, p);
    ge25519_p2_dbl(r, &q);
}

#ifndef CRYPTO_ALIGN
# if defined(__INTEL_COMPILER) || defined(_MSC_VER)
#  define CRYPTO_ALIGN(x) __declspec(align(x))
# else
#  define CRYPTO_ALIGN(x) __attribute__ ((aligned(x)))
# endif
#endif

#define COMPILER_ASSERT(X) (void) sizeof(char[(X) ? 1 : -1])

int
ge25519_has_small_order(const unsigned char s[32])
{
    CRYPTO_ALIGN(16)
    static const unsigned char blacklist[][32] = {
        /* 0 (order 4) */
        { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
          0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
          0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 },
        /* 1 (order 1) */
        { 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
          0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
          0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 },
        /* 2707385501144840649318225287225658788936804267575313519463743609750303402022
           (order 8) */
        { 0x26, 0xe8, 0x95, 0x8f, 0xc2, 0xb2, 0x27, 0xb0, 0x45, 0xc3, 0xf4,
          0x89, 0xf2, 0xef, 0x98, 0xf0, 0xd5, 0xdf, 0xac, 0x05, 0xd3, 0xc6,
          0x33, 0x39, 0xb1, 0x38, 0x02, 0x88, 0x6d, 0x53, 0xfc, 0x05 },
        /* 55188659117513257062467267217118295137698188065244968500265048394206261417927
           (order 8) */
        { 0xc7, 0x17, 0x6a, 0x70, 0x3d, 0x4d, 0xd8, 0x4f, 0xba, 0x3c, 0x0b,
          0x76, 0x0d, 0x10, 0x67, 0x0f, 0x2a, 0x20, 0x53, 0xfa, 0x2c, 0x39,
          0xcc, 0xc6, 0x4e, 0xc7, 0xfd, 0x77, 0x92, 0xac, 0x03, 0x7a },
        /* p-1 (order 2) */
        { 0xec, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
          0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
          0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x7f },
        /* p (=0, order 4) */
        { 0xed, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
          0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
          0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x7f },
        /* p+1 (=1, order 1) */
        { 0xee, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
          0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
          0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x7f }
    };
    unsigned char c[7] = { 0 };
    unsigned int  k;
    size_t        i, j;

    COMPILER_ASSERT(7 == sizeof blacklist / sizeof blacklist[0]);
    for (j = 0; j < 31; j++) {
        for (i = 0; i < sizeof blacklist / sizeof blacklist[0]; i++) {
            c[i] |= s[j] ^ blacklist[i][j];
        }
    }
    for (i = 0; i < sizeof blacklist / sizeof blacklist[0]; i++) {
        c[i] |= (s[j] & 0x7f) ^ blacklist[i][j];
    }
    k = 0;
    for (i = 0; i < sizeof blacklist / sizeof blacklist[0]; i++) {
        k |= (c[i] - 1);
    }
    return (int) ((k >> 8) & 1);
}