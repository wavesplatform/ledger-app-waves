/* Automatically generated nanopb header */
/* Generated by nanopb-0.3.9.3 at Wed Apr 15 13:47:10 2020. */

#ifndef PB_WAVES_RECIPIENT_PB_H_INCLUDED
#define PB_WAVES_RECIPIENT_PB_H_INCLUDED
#include <pb.h>

/* @@protoc_insertion_point(includes) */
#if PB_PROTO_HEADER_VERSION != 30
#error Regenerate this file with the current version of nanopb generator.
#endif

#ifdef __cplusplus
extern "C" {
#endif

/* Struct definitions */
typedef PB_BYTES_ARRAY_T(26) waves_Recipient_public_key_hash_t;
typedef struct _waves_Recipient {
    pb_size_t which_recipient;
    union {
        waves_Recipient_public_key_hash_t public_key_hash;
        char alias[34];
    } recipient;
/* @@protoc_insertion_point(struct:waves_Recipient) */
} waves_Recipient;

/* Default values for struct fields */

/* Initializer values for message structs */
#define waves_Recipient_init_default             {0, {{0, {0}}}}
#define waves_Recipient_init_zero                {0, {{0, {0}}}}

/* Field tags (for use in manual encoding/decoding) */
#define waves_Recipient_public_key_hash_tag      1
#define waves_Recipient_alias_tag                2

/* Struct field encoding specification for nanopb */
extern const pb_field_t waves_Recipient_fields[3];

/* Maximum encoded size of messages (where known) */
#define waves_Recipient_size                     36

/* Message IDs (where set with "msgid" option) */
#ifdef PB_MSGID

#define RECIPIENT_MESSAGES \


#endif

#ifdef __cplusplus
} /* extern "C" */
#endif
/* @@protoc_insertion_point(eof) */

#endif