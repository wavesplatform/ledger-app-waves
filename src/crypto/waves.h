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

#ifndef __WAVES_H__
#define __WAVES_H__

#include <stdint.h>
#include <stdbool.h>

#include "base58.h"
#include "os.h"
#include "cx.h"
#include "stream_eddsa_sign.h"

typedef unsigned char ed25519_signature[64];
typedef unsigned char ed25519_public_key[32];
typedef unsigned char ed25519_secret_key[32];

void waves_public_key_to_address(const ed25519_public_key public_key,
                                 const unsigned char network_byte,
                                 unsigned char *output);
void copy_in_reverse_order(unsigned char *to, const unsigned char *from,
                           const unsigned int len);

#endif
