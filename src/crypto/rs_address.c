/*******************************************************************************
*   Burstcoin Wallet App for Nano Ledger S.
*   Copyright (c) 2017-2018 Jake B.
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

#import "rs_address.h"
#include <stdbool.h>
#include <stdint.h>
#include "os.h"
#include "cx.h"

#define PREFIX "BURST-"

static const uint8_t gexp[] = {1, 2, 4, 8, 16, 5, 10, 20, 13, 26, 17, 7, 14, 28, 29, 31, 27, 19, 3, 6, 12, 24, 21, 15, 30, 25, 23, 11, 22, 9, 18, 1};
static const uint8_t glog[] = {0, 0, 1, 18, 2, 5, 19, 11, 3, 29, 6, 27, 20, 8, 12, 23, 4, 10, 30, 17, 7, 22, 28, 26, 21, 25, 9, 16, 13, 14, 24, 15};
static const uint8_t cwmap[] = {3, 2, 1, 0, 7, 6, 5, 4, 13, 14, 15, 16, 12, 8, 9, 10, 11};
static const char* alphabet = "23456789ABCDEFGHJKLMNPQRSTUVWXYZ";

uint8_t gmult(uint8_t a, uint8_t b) {
    if (a == 0 || b == 0)
        return 0;
    
    int idx = (glog[a] + glog[b]) % 31;
    return gexp[idx];
}

bool addressFromAccountNumber(char* address, uint64_t account, bool prefix) {

    uint8_t codeword[17];
	os_memset(codeword, 0, 17);

    // The first 12 characters of the codeword are direct from the address
    for(int i = 0; i < 13; i++) {
        codeword[i] = (account >> (5 * i)) & 31;
    }
    
    // The final 5 characters are calculated from the first 13.  Start at position
    uint8_t* p = codeword + 13;
    
    for (int i = 12; i>=0; i--) {
        uint8_t fb = codeword[i] ^ p[3];
        
        p[3] = p[2] ^ gmult(30, fb);
        p[2] = p[1] ^ gmult( 6, fb);
        p[1] = p[0] ^ gmult( 9, fb);
        p[0] =        gmult(17, fb);
    }

    char* out = address;
    if (prefix) {
    	int prefixLen = sizeof(PREFIX);
    	os_memmove(address, PREFIX, prefixLen);
    	out += prefixLen-1;
    } 
    
    for (int i=0; i<17; i++) {
        *(out++) = alphabet[codeword[cwmap[i]]];
        if ((i & 3) == 3 && i < 13) {
            *(out++) = '-'; ;
        }
    }
    *(out) = '\0'; // null terminator
    
    return true;
}