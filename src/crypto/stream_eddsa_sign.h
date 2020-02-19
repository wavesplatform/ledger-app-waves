#ifndef STREAM_EDDSA_SIGN_H
#define STREAM_EDDSA_SIGN_H

#include "os.h"
#include "cx.h"

int stream_eddsa_sign(const cx_ecfp_private_key_t *pv_key,
                  int mode,  cx_md_t hashID,
                  const unsigned char  *hash ,unsigned int hash_len,
                  const unsigned char  *ctx , unsigned int ctx_len,
                  unsigned char *sig, unsigned int sig_len,
                  unsigned int *info);

#endif // STREAM_EDDSA_SIGN_H