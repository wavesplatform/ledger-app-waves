/*******************************************************************************
 *   Waves Platform Wallet App for Nano Ledger devices
 *   Copyright (c) 2017-2020 Vladislav Petushkov <vladislav.petushkov@gmail.com>
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

#ifndef __PROTOBUF_H__
#define __PROTOBUF_H__

#include <stdbool.h>
#include "../../main.h"
#include "../../nanopb/pb.h"
#include "../../nanopb/pb_decode.h"
#include "../../nanopb/pb_custom.h"
#include "../../nanopb_stubs/order.pb.h"
#include "../../nanopb_stubs/transaction.pb.h"

void build_protobuf_root_tx(uiProtobuf_t *ctx, uint8_t *init_buffer,
                       uint8_t init_buffer_size, uint16_t total_buffer_size, uint8_t start_index);
void build_protobuf_child_tx(uiProtobuf_t *ctx, uint8_t *init_buffer,
                       uint8_t init_buffer_size, uint16_t total_buffer_size);                       
void build_protobuf_order(uiProtobuf_t *ctx, uint8_t *init_buffer,
                       uint8_t init_buffer_size, uint16_t total_buffer_size, uint8_t start_index);

#endif