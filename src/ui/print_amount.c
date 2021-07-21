/*******************************************************************************
 *   Waves Platform Wallet App for Nano Ledger devices
 *   Copyright (c) 2017-2020 Sergey Tolmachev (Tolsi) <tolsi.ru@gmail.com>
 *
 *   Based on Sample code provided (c) 2016 Ledger and
 *                                 (c) 2017-2018 Jake B. (Burstcoin app)
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 ********************************************************************************/

#include "string.h"
#include "print_amount.h"

bool print_amount(uint64_t amount, int decimals, unsigned char *out,
                  uint8_t len) {
  uint64_t dVal = amount;
  int i, j;

  if (decimals == 0)
    decimals--;

  memset(tmp_ctx.signing_context.ui.tmp, 0, len);
  for (i = 0; dVal > 0 || i < decimals + 2; i++) {
    if (dVal > 0) {
      tmp_ctx.signing_context.ui.tmp[i] = (char)((dVal % 10) + '0');
      dVal /= 10;
    } else {
      tmp_ctx.signing_context.ui.tmp[i] = '0';
    }
    if (i == decimals - 1) {
      i += 1;
      tmp_ctx.signing_context.ui.tmp[i] = '.';
    }
    if (i >= len) {
      return false;
    }
  }
  // reverse order
  for (i -= 1, j = 0; i >= 0 && j < len - 1; i--, j++) {
    out[j] = tmp_ctx.signing_context.ui.tmp[i];
  }
  if (decimals > 0) {
    // strip trailing 0s
    for (j -= 1; j > 0; j--) {
      if (out[j] != '0')
        break;
    }
    j += 1;
    if (out[j - 1] == '.')
      j -= 1;
  }

  out[j] = '\0';
  return true;
}