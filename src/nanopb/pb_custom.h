#ifndef _PB_CUSTOM_
#define _PB_CUSTOM_

#include "stdint.h"
#include "os.h"
#include "cx.h"
#include "pb.h"
#include "main.h"

/* Custom `pb_istream_s.state` structure that handles decoding from apdu
 * streaming */
#define PB_DECODING_FAILED 0
#define MAX_PB_ELEMENT_SIZE 100

pb_istream_t apdu_pb_istream(uiProtobuf_t *ctx, uint8_t *init_buffer,
                             uint8_t init_buffer_size,
                             uint16_t total_buffer_size);
pb_istream_t pb_istream_from_apdu(uiProtobuf_t *ctx, uint8_t *init_buffer,
                                  uint8_t init_buffer_size,
                                  uint16_t total_buffer_size,
                                  uint8_t start_index);
bool transaction_callback(pb_istream_t *stream, const pb_field_t *field,
                          void **arg);
bool asset_callback(pb_istream_t *stream, const pb_field_t *field, void **arg);

#endif