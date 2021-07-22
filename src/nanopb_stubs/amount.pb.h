/* Automatically generated nanopb header */
/* Generated by nanopb-0.4.2-dev */

#ifndef PB_WAVES_AMOUNT_PB_H_INCLUDED
#define PB_WAVES_AMOUNT_PB_H_INCLUDED
#include <pb.h>

#if PB_PROTO_HEADER_VERSION != 40
#error Regenerate this file with the current version of nanopb generator.
#endif

#ifdef __cplusplus
extern "C" {
#endif

/* Struct definitions */
typedef struct _waves_Amount {
    pb_callback_t asset_id;
    int64_t amount;
} waves_Amount;


/* Initializer values for message structs */
#define waves_Amount_init_default                {{{NULL}, NULL}, 0}
#define waves_Amount_init_zero                   {{{NULL}, NULL}, 0}

/* Field tags (for use in manual encoding/decoding) */
#define waves_Amount_asset_id_tag                1
#define waves_Amount_amount_tag                  2

/* Struct field encoding specification for nanopb */
#define waves_Amount_FIELDLIST(X, a) \
X(a, CALLBACK, SINGULAR, BYTES,    asset_id,          1) \
X(a, STATIC,   SINGULAR, INT64,    amount,            2)
#define waves_Amount_CALLBACK pb_default_field_callback
#define waves_Amount_DEFAULT NULL

extern const pb_msgdesc_t waves_Amount_msg;

/* Defines for backwards compatibility with code written before nanopb-0.4.0 */
#define waves_Amount_fields &waves_Amount_msg

/* Maximum encoded size of messages (where known) */
/* waves_Amount_size depends on runtime parameters */

#ifdef __cplusplus
} /* extern "C" */
#endif

#endif
