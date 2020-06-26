#include "../ui/transactions/protobuf.h"
#include "pb_custom.h"
#include "os.h"
#include "pb_decode.h"
#include "../main.h"

/*******************************************************
 * Ledger's APDU pb_istream_from_apdu_t implementation *
 *******************************************************/

#define MAX_FETCH_ATTEMPTS 10

#define ERR_PB_READ_IS_TOO_BIG 0x6002
#define ERR_NOT_ENOUGH_BYTES_RECEIVED 0x6003
#define ERR_BUFFER_TOO_SMALL 0x6005
#define ERR_WRONG_MESSAGE_SIZE 0x6006
#define ERR_WRONG_PARAMETER 0x6007

#define PRINTF_PB(...) // PRINTF(__VA_ARGS__)

#if !defined(__GNUC__) || (__GNUC__ < 3) ||                                    \
    (__GNUC__ == 3 && __GNUC_MINOR__ < 4)
#define checkreturn
#else
#define checkreturn __attribute__((warn_unused_result))
#endif

typedef bool (*pb_decoder_t)(pb_istream_t *stream, const pb_field_t *field,
                             void *dest) checkreturn;

void inline fetch_new_apdu(uiProtobuf_t *state)
    __attribute__((no_instrument_function));

void fetch_new_apdu(uiProtobuf_t *state) {

  unsigned int rx;
  G_io_apdu_buffer[0] = 0x90;
  G_io_apdu_buffer[1] = 0x00;
  rx = io_exchange(CHANNEL_APDU, 2);
  if (G_io_apdu_buffer[4] != rx - 5) {
    // the length of the APDU should match what's in the 5-byte header.
    // If not fail.  Don't want to buffer overrun or anything.
    THROW(SW_CONDITIONS_NOT_SATISFIED);
  }

  if (G_io_apdu_buffer[2] != P1_MORE && G_io_apdu_buffer[2] != P1_LAST) {
    THROW(SW_INCORRECT_P1_P2);
  } else if (state->bytes_stored + G_io_apdu_buffer[4] > sizeof(state->data)) {
    PRINTF("ERR_BUFF_TOO_SMALL: %d %d\n", state->bytes_stored,
           G_io_apdu_buffer[4]);
    THROW(ERR_BUFFER_TOO_SMALL);
  }

  if (tmp_ctx.signing_context.step == 7) {
    THROW(SW_INCORRECT_P1_P2);
  }

  state->total_received += G_io_apdu_buffer[4];
}

bool checkreturn apdu_read(pb_istream_t *stream, pb_byte_t *buf, size_t count) {
  uiProtobuf_t *state;
  uint16_t bytes_not_read_yet;
  uint8_t fetch_attempts;
  const pb_byte_t *source;

  if (count > MAX_PB_ELEMENT_SIZE) {
    THROW(ERR_PB_READ_IS_TOO_BIG);
  }

  state = (uiProtobuf_t *)stream->state;

  bytes_not_read_yet = state->bytes_stored - state->read_offset;

  PRINTF_PB("r: %d re: %d s %d\n", count, bytes_not_read_yet,
            state->bytes_stored);

  /* not enough data has been received and deciphered, we fetch a new apdu or
  stop the s tream if the last apdu was already received*/
  if (count > bytes_not_read_yet) {
    // shift data to the beginning of the buffer
    os_memmove(state->data, state->data + state->read_offset,
               state->bytes_stored - state->read_offset);
    state->bytes_stored = bytes_not_read_yet;
    state->read_offset = 0;

    PRINTF_PB("SHIFT LEFT: available: %d\n", bytes_not_read_yet);

    // loop over apdu fetching while there's not enough bytes stored to feed the
    // amount requested
    fetch_attempts = 0;
    while (count > bytes_not_read_yet) {

      if (++fetch_attempts > MAX_FETCH_ATTEMPTS) {
        THROW(ERR_NOT_ENOUGH_BYTES_RECEIVED);
      } else if (state->total_received == state->total_size) {
        // Everything has been received, signal to nanopb that it's time to end
        // decoding
        stream->bytes_left = 0;
        return false;
      }
      // fetch next bytes
      fetch_new_apdu(state);
      // creating hash to check view and sign data are the same
      cx_hash(&tmp_ctx.signing_context.ui.hash_ctx.header, CX_NONE,
              G_io_apdu_buffer + 5, G_io_apdu_buffer[4], NULL, 0);
      os_memmove(state->data + state->bytes_stored, G_io_apdu_buffer + 5,
                 G_io_apdu_buffer[4]);

      state->bytes_stored += G_io_apdu_buffer[4];
      bytes_not_read_yet = state->bytes_stored - state->read_offset;
    }
  }
  if (state->total_size <= state->total_read) {
    // Everything has been received, signal to nanopb that it's time to end
    // decoding
    stream->bytes_left = 0;
    return false;
  }
  // extract data to output buffer
  source = (const pb_byte_t *)state->data + state->read_offset;
  state->read_offset += count;
  state->total_read += count;
  if (buf != NULL) {
    for (uint16_t i = 0; i < count; i++)
      buf[i] = source[i];
  }

  return true;
}

/*
 Returns a nanopb input stream handler that feeds data from APDUs
 ctx: istream state that stores information about io context
 init_buffer: initialized the stream with some data (can be set to NULL)
 init_buffer_size: length of init_buffer
 total_buffer_size: total length of the message to receive
*/
pb_istream_t pb_istream_from_apdu(uiProtobuf_t *ctx, uint8_t *init_buffer,
                                  uint8_t init_buffer_size,
                                  uint16_t total_buffer_size) {
  pb_istream_t stream;
  stream.callback = &apdu_read;
  stream.state = ctx;
  stream.bytes_left = SIZE_MAX;
#ifndef PB_NO_ERRMSG
  stream.errmsg = NULL;
#endif
  os_memset(ctx, 0, sizeof(uiProtobuf_t));
  ctx->total_received = init_buffer_size;
  ctx->total_size = total_buffer_size;
  os_memmove(ctx->data, init_buffer, init_buffer_size);
  cx_hash(&tmp_ctx.signing_context.ui.hash_ctx.header, CX_NONE, init_buffer,
          init_buffer_size, NULL, 0);
  ctx->bytes_stored = init_buffer_size;
  ctx->read_offset = 0;
  ctx->total_read = 0;

#ifdef HAVE_PRINTF
  // Set call stack monitoring level to 0
  // G_depth = 0;
#endif

  return stream;
}
