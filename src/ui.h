
/*******************************************************************************
*   Burstcoin Wallet App for Nano Ledger S. Updated By Waves community.
*   Copyright (c) 2017-2018 Jake B.
* 
*   Based on Sample code provided and (c) 2016 Ledger
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

#ifndef __UI_H__
#define __UI_H__

#include "os.h"
#include "cx.h"
#include <stdbool.h>
#include "os_io_seproxyhal.h"
#include "main.h"

extern ux_state_t ux;

enum UI_STATE { UI_IDLE, UI_VERIFY };
#define UI_RECIPIENT 0
#define UI_AMOUNT    1
#define UI_FEE       2
#define UI_TRANSACTION_PART_MAX 3;

extern enum UI_STATE ui_state;

// extern unsigned int current_text_pos; // parsing cursor in the text to display
// extern unsigned int text_y;           // current location of the displayed text
// extern char lineBuffer[50];

void ui_verify(void);
void ui_idle(void);

extern int ux_step;
extern int ux_step_count;

extern const ux_menu_entry_t menu_main[];
extern const ux_menu_entry_t menu_settings[];
extern const ux_menu_entry_t menu_settings_browser[];


#define MAX_CHARS_PER_LINE 49
#define DEFAULT_FONT BAGL_FONT_OPEN_SANS_LIGHT_16px | BAGL_FONT_ALIGNMENT_LEFT
#define TEXT_HEIGHT 15
#define TEXT_SPACE 4


#define QUANTS_PER_BURST 100000000
#endif