#ifndef _PB_CUSTOM_
#define _PB_CUSTOM_

#include "stdint.h"
#include "os.h"
#include "cx.h"
#include "pb.h"


/* Custom `pb_istream_s.state` structure that handles decoding from apdu streaming */
#define PB_DECODING_FAILED 0
// Maximum size of a single serialized pb element
#define MAX_PB_ELEMENT_SIZE 100
// Maximum size of an APDU payload. Can be reduced to save some bytes, but then the host has to ensure that it doesn't send APDU payloads bigger than this value.
#define MAX_APDU_PAYLOAD_SIZE 255 


typedef struct{
    uint8_t data[MAX_PB_ELEMENT_SIZE + MAX_APDU_PAYLOAD_SIZE]; // size of the biggest nanopb element serialized + size of an APDU (worst case scenario)
    uint32_t read_offset; // nanopb read offset, everything before it has been succesfully decoded
    uint32_t bytes_stored; // number of bytes currently stored in "data"
    uint32_t total_size; // total size of the nanopb structure being received
    uint32_t total_received; // number of bytes received since decoding began

} pb_istream_from_apdu_ctx_t;


pb_istream_t apdu_pb_istream(pb_istream_from_apdu_ctx_t* ctx, uint8_t* init_buffer, uint8_t init_buffer_size, uint32_t total_buffer_size);
pb_istream_t pb_istream_from_apdu(pb_istream_from_apdu_ctx_t* ctx, uint8_t* init_buffer, uint8_t init_buffer_size, uint32_t total_buffer_size);

#endif