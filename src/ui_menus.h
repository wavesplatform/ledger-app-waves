#ifndef __UI_MENUS_H__
#define __UI_MENUS_H__

#include "os.h"
#include "cx.h"

const bagl_element_t ui_address_nanos[] = {
    // type                               userid    x    y   w    h  str rad
    // fill      fg        bg      fid iid  txt   touchparams...       ]
    {{BAGL_RECTANGLE, 0x00, 0, 0, 128, 32, 0, 0, BAGL_FILL, 0x000000, 0xFFFFFF,
      0, 0},
     NULL, 0, 0, 0, NULL, NULL, NULL},

    {{BAGL_ICON, 0x00, 3, 12, 7, 7, 0, 0, 0, 0xFFFFFF, 0x000000, 0,
      BAGL_GLYPH_ICON_CROSS},
     NULL, 0, 0, 0, NULL, NULL, NULL},
    {{BAGL_ICON, 0x00, 117, 13, 8, 6, 0, 0, 0, 0xFFFFFF, 0x000000, 0,
      BAGL_GLYPH_ICON_CHECK},
     NULL, 0, 0, 0, NULL, NULL, NULL},

    //{{BAGL_ICON                           , 0x01,  31,   9,  14,  14, 0, 0, 0
    //, 0xFFFFFF, 0x000000, 0, BAGL_GLYPH_ICON_EYE_BADGE  }, NULL, 0, 0, 0,
    //NULL, NULL, NULL },
    {{BAGL_LABELINE, 0x01, 0, 12, 128, 12, 0, 0, 0, 0xFFFFFF, 0x000000,
      BAGL_FONT_OPEN_SANS_EXTRABOLD_11px | BAGL_FONT_ALIGNMENT_CENTER, 0},
     "Confirm", 0, 0, 0, NULL, NULL, NULL},
    {{BAGL_LABELINE, 0x01, 0, 26, 128, 12, 0, 0, 0, 0xFFFFFF, 0x000000,
      BAGL_FONT_OPEN_SANS_EXTRABOLD_11px | BAGL_FONT_ALIGNMENT_CENTER, 0},
     "address", 0, 0, 0, NULL, NULL, NULL},

    {{BAGL_LABELINE, 0x02, 0, 12, 128, 12, 0, 0, 0, 0xFFFFFF, 0x000000,
      BAGL_FONT_OPEN_SANS_REGULAR_11px | BAGL_FONT_ALIGNMENT_CENTER, 0},
     "Address", 0, 0, 0, NULL, NULL, NULL},
    {{BAGL_LABELINE, 0x02, 23, 26, 82, 12, 0x80 | 10, 0, 0, 0xFFFFFF, 0x000000,
      BAGL_FONT_OPEN_SANS_EXTRABOLD_11px | BAGL_FONT_ALIGNMENT_CENTER, 26},
     (const char *)tmp_ctx.address_context.address, 0, 0, 0, NULL, NULL, NULL},
};

const bagl_element_t ui_verify_transfer_nanos[] = {
    // type                               userid    x    y   w    h  str rad
    // fill      fg        bg      fid iid  txt   touchparams...       ]
    {{BAGL_RECTANGLE, 0x00, 0, 0, 128, 32, 0, 0, BAGL_FILL, 0x000000, 0xFFFFFF,
      0, 0},
     NULL, 0, 0, 0, NULL, NULL, NULL},

    {{BAGL_ICON, 0x00, 3, 12, 7, 7, 0, 0, 0, 0xFFFFFF, 0x000000, 0,
      BAGL_GLYPH_ICON_CROSS},
     NULL, 0, 0, 0, NULL, NULL, NULL},
    {{BAGL_ICON, 0x00, 117, 13, 8, 6, 0, 0, 0, 0xFFFFFF, 0x000000, 0,
      BAGL_GLYPH_ICON_CHECK},
     NULL, 0, 0, 0, NULL, NULL, NULL},

    {{BAGL_LABELINE, 0x01, 0, 12, 128, 12, 0, 0, 0, 0xFFFFFF, 0x000000,
      BAGL_FONT_OPEN_SANS_EXTRABOLD_11px | BAGL_FONT_ALIGNMENT_CENTER, 0},
     "Confirm", 0, 0, 0, NULL, NULL, NULL},
    {{BAGL_LABELINE, 0x01, 0, 26, 128, 12, 0, 0, 0, 0xFFFFFF, 0x000000,
      BAGL_FONT_OPEN_SANS_EXTRABOLD_11px | BAGL_FONT_ALIGNMENT_CENTER, 0},
     "transfer", 0, 0, 0, NULL, NULL, NULL},

    {{BAGL_LABELINE, 0x02, 0, 12, 128, 12, 0, 0, 0, 0xFFFFFF, 0x000000,
      BAGL_FONT_OPEN_SANS_REGULAR_11px | BAGL_FONT_ALIGNMENT_CENTER, 0},
     "Amount", 0, 0, 0, NULL, NULL, NULL},
    {{BAGL_LABELINE, 0x02, 23, 26, 82, 12, 0x80 | 10, 0, 0, 0xFFFFFF, 0x000000,
      BAGL_FONT_OPEN_SANS_EXTRABOLD_11px | BAGL_FONT_ALIGNMENT_CENTER, 26},
     (const char *)ui_context.line1, 0, 0, 0, NULL, NULL, NULL},

    {{BAGL_LABELINE, 0x03, 0, 12, 128, 12, 0, 0, 0, 0xFFFFFF, 0x000000,
      BAGL_FONT_OPEN_SANS_REGULAR_11px | BAGL_FONT_ALIGNMENT_CENTER, 0},
     "Asset",0, 0, 0, NULL, NULL, NULL},
    {{BAGL_LABELINE, 0x03, 23, 26, 82, 12, 0x80 | 10, 0, 0, 0xFFFFFF, 0x000000,
      BAGL_FONT_OPEN_SANS_EXTRABOLD_11px | BAGL_FONT_ALIGNMENT_CENTER, 26},
     (const char *)ui_context.line2, 0, 0, 0, NULL, NULL, NULL},

     {{BAGL_LABELINE, 0x04, 0, 12, 128, 12, 0, 0, 0, 0xFFFFFF, 0x000000,
       BAGL_FONT_OPEN_SANS_REGULAR_11px | BAGL_FONT_ALIGNMENT_CENTER, 0},
      "To", 0, 0, 0, NULL, NULL, NULL},
     {{BAGL_LABELINE, 0x04, 23, 26, 82, 12, 0x80 | 10, 0, 0, 0xFFFFFF, 0x000000,
       BAGL_FONT_OPEN_SANS_EXTRABOLD_11px | BAGL_FONT_ALIGNMENT_CENTER, 26},
      (const char *)ui_context.line3, 0, 0, 0, NULL, NULL, NULL},

    {{BAGL_LABELINE, 0x05, 0, 12, 128, 12, 0, 0, 0, 0xFFFFFF, 0x000000,
      BAGL_FONT_OPEN_SANS_REGULAR_11px | BAGL_FONT_ALIGNMENT_CENTER, 0},
     "Fee", 0, 0, 0, NULL, NULL, NULL},
    {{BAGL_LABELINE, 0x05, 23, 26, 82, 12, 0x80 | 10, 0, 0, 0xFFFFFF, 0x000000,
      BAGL_FONT_OPEN_SANS_EXTRABOLD_11px | BAGL_FONT_ALIGNMENT_CENTER, 26},
     (const char *)ui_context.line4, 0, 0, 0, NULL, NULL, NULL},

    {{BAGL_LABELINE, 0x06, 0, 12, 128, 12, 0, 0, 0, 0xFFFFFF, 0x000000,
      BAGL_FONT_OPEN_SANS_REGULAR_11px | BAGL_FONT_ALIGNMENT_CENTER, 0},
     "Fee asset", 0, 0, 0, NULL, NULL, NULL},
    {{BAGL_LABELINE, 0x06, 23, 26, 82, 12, 0x80 | 10, 0, 0, 0xFFFFFF, 0x000000,
      BAGL_FONT_OPEN_SANS_EXTRABOLD_11px | BAGL_FONT_ALIGNMENT_CENTER, 26},
     (const char *)ui_context.line5, 0, 0, 0, NULL, NULL, NULL},

    {{BAGL_LABELINE, 0x08, 0, 12, 128, 12, 0, 0, 0, 0xFFFFFF, 0x000000,
      BAGL_FONT_OPEN_SANS_REGULAR_11px | BAGL_FONT_ALIGNMENT_CENTER, 0},
     "Attachment", 0, 0, 0, NULL, NULL, NULL},
    {{BAGL_LABELINE, 0x08, 23, 26, 82, 12, 0x80 | 10, 0, 0, 0xFFFFFF, 0x000000,
      BAGL_FONT_OPEN_SANS_EXTRABOLD_11px | BAGL_FONT_ALIGNMENT_CENTER, 26},
     (const char *)ui_context.line6, 0, 0, 0, NULL, NULL, NULL},

    {{BAGL_LABELINE, 0x07, 0, 12, 128, 12, 0, 0, 0, 0xFFFFFF, 0x000000,
      BAGL_FONT_OPEN_SANS_REGULAR_11px | BAGL_FONT_ALIGNMENT_CENTER, 0},
     "From", 0, 0, 0, NULL, NULL, NULL},
    {{BAGL_LABELINE, 0x07, 23, 26, 82, 12, 0x80 | 10, 0, 0, 0xFFFFFF, 0x000000,
      BAGL_FONT_OPEN_SANS_EXTRABOLD_11px | BAGL_FONT_ALIGNMENT_CENTER, 26},
     (const char *)ui_context.line7, 0, 0, 0, NULL, NULL, NULL},

    {{BAGL_LABELINE, 0x09, 0, 12, 128, 12, 0, 0, 0, 0xFFFFFF, 0x000000,
      BAGL_FONT_OPEN_SANS_REGULAR_11px | BAGL_FONT_ALIGNMENT_CENTER, 0},
     "Transaction Id", 0, 0, 0, NULL, NULL, NULL},
    {{BAGL_LABELINE, 0x09, 23, 26, 82, 12, 0x80 | 10, 0, 0, 0xFFFFFF, 0x000000,
      BAGL_FONT_OPEN_SANS_EXTRABOLD_11px | BAGL_FONT_ALIGNMENT_CENTER, 26},
     (const char *)ui_context.line8, 0, 0, 0, NULL, NULL, NULL}
};

const bagl_element_t ui_verify_transaction_nanos[] = {
    // type                               userid    x    y   w    h  str rad
    // fill      fg        bg      fid iid  txt   touchparams...       ]
    {{BAGL_RECTANGLE, 0x00, 0, 0, 128, 32, 0, 0, BAGL_FILL, 0x000000, 0xFFFFFF,
      0, 0},
     NULL, 0, 0, 0, NULL, NULL, NULL},

    {{BAGL_ICON, 0x00, 3, 12, 7, 7, 0, 0, 0, 0xFFFFFF, 0x000000, 0,
      BAGL_GLYPH_ICON_CROSS},
     NULL, 0, 0, 0, NULL, NULL, NULL},
    {{BAGL_ICON, 0x00, 117, 13, 8, 6, 0, 0, 0, 0xFFFFFF, 0x000000, 0,
      BAGL_GLYPH_ICON_CHECK},
     NULL, 0, 0, 0, NULL, NULL, NULL},
    {{BAGL_LABELINE, 0x01, 0, 12, 128, 12, 0, 0, 0, 0xFFFFFF, 0x000000,
      BAGL_FONT_OPEN_SANS_EXTRABOLD_11px | BAGL_FONT_ALIGNMENT_CENTER, 0},
     "Confirm", 0, 0, 0, NULL, NULL, NULL},
    {{BAGL_LABELINE, 0x01, 0, 26, 128, 12, 0, 0, 0, 0xFFFFFF, 0x000000,
      BAGL_FONT_OPEN_SANS_EXTRABOLD_11px | BAGL_FONT_ALIGNMENT_CENTER, 0},
     (const char *) ui_context.line1, 0, 0, 0, NULL, NULL, NULL},

    {{BAGL_LABELINE, 0x02, 0, 12, 128, 12, 0, 0, 0, 0xFFFFFF, 0x000000,
      BAGL_FONT_OPEN_SANS_REGULAR_11px | BAGL_FONT_ALIGNMENT_CENTER, 0},
     (const char *)ui_context.line2, 0, 0, 0, NULL, NULL, NULL},
    {{BAGL_LABELINE, 0x02, 23, 26, 82, 12, 0x80 | 10, 0, 0, 0xFFFFFF, 0x000000,
      BAGL_FONT_OPEN_SANS_EXTRABOLD_11px | BAGL_FONT_ALIGNMENT_CENTER, 26},
     (const char *)ui_context.line3, 0, 0, 0, NULL, NULL, NULL},

    {{BAGL_LABELINE, 0x03, 0, 12, 128, 12, 0, 0, 0, 0xFFFFFF, 0x000000,
      BAGL_FONT_OPEN_SANS_REGULAR_11px | BAGL_FONT_ALIGNMENT_CENTER, 0},
     "From", 0, 0, 0, NULL, NULL, NULL},
    {{BAGL_LABELINE, 0x03, 23, 26, 82, 12, 0x80 | 10, 0, 0, 0xFFFFFF, 0x000000,
      BAGL_FONT_OPEN_SANS_EXTRABOLD_11px | BAGL_FONT_ALIGNMENT_CENTER, 26},
     (const char *)ui_context.line4, 0, 0, 0, NULL, NULL, NULL},
};

const ux_menu_entry_t menu_about[];

const ux_menu_entry_t menu_main[] = {
    {NULL, NULL, 0, &C_icon_waves, "Use wallet to", "view accounts", 33, 12},
    {menu_about, NULL, 0, NULL, "About", NULL, 0, 0},
    {NULL, os_sched_exit, 0, &C_icon_dashboard, "Quit app", NULL, 50, 29},
    UX_MENU_END};

const ux_menu_entry_t menu_about[] = {
    {NULL, NULL, 0, NULL, "Version", APPVERSION, 0, 0},
    {menu_main, NULL, 1, &C_icon_back, "Back", NULL, 61, 40},
    UX_MENU_END};

// Blue

const bagl_element_t ui_idle_blue[] = {
  // type                               userid    x    y   w    h  str rad fill      fg        bg      fid iid  txt   touchparams...       ]
  {{BAGL_RECTANGLE                      , 0x00,   0,  68, 320, 413, 0, 0, BAGL_FILL, COLOR_BG_1, 0x000000, 0                                                                                 , 0   }, NULL, 0, 0, 0, NULL, NULL, NULL },

  // erase screen (only under the status bar)
  {{BAGL_RECTANGLE                      , 0x00,   0,  20, 320,  48, 0, 0, BAGL_FILL, COLOR_APP, COLOR_APP, 0                                                      , 0   }, NULL, 0, 0, 0, NULL, NULL, NULL},

  /// TOP STATUS BAR
  {{BAGL_LABELINE                       , 0x01,   0,  45, 320,  30, 0, 0, BAGL_FILL, 0xFFFFFF, COLOR_APP, BAGL_FONT_OPEN_SANS_SEMIBOLD_10_13PX|BAGL_FONT_ALIGNMENT_CENTER, 0   }, CHAINID_UPCASE, 0, 0, 0, NULL, NULL, NULL},

  {{BAGL_RECTANGLE | BAGL_FLAG_TOUCHABLE, 0x00,   0,  19,  56,  44, 0, 0, BAGL_FILL, COLOR_APP, COLOR_APP_LIGHT, BAGL_FONT_SYMBOLS_0|BAGL_FONT_ALIGNMENT_CENTER|BAGL_FONT_ALIGNMENT_MIDDLE, 0 }, BAGL_FONT_SYMBOLS_0_SETTINGS, 0, COLOR_APP, 0xFFFFFF, io_seproxyhal_touch_settings, NULL, NULL},
  {{BAGL_RECTANGLE | BAGL_FLAG_TOUCHABLE, 0x00, 264,  19,  56,  44, 0, 0, BAGL_FILL, COLOR_APP, COLOR_APP_LIGHT, BAGL_FONT_SYMBOLS_0|BAGL_FONT_ALIGNMENT_CENTER|BAGL_FONT_ALIGNMENT_MIDDLE, 0 }, BAGL_FONT_SYMBOLS_0_DASHBOARD, 0, COLOR_APP, 0xFFFFFF, io_seproxyhal_touch_exit, NULL, NULL},

  {{BAGL_LABELINE                       , 0x00,   0, 270, 320,  30, 0, 0, BAGL_FILL, 0x000000, COLOR_BG_1, BAGL_FONT_OPEN_SANS_LIGHT_16_22PX|BAGL_FONT_ALIGNMENT_CENTER, 0   }, "Open your wallet", 0, 0, 0, NULL, NULL, NULL},
  {{BAGL_LABELINE                       , 0x00,   0, 308, 320,  30, 0, 0, BAGL_FILL, 0x000000, COLOR_BG_1, BAGL_FONT_OPEN_SANS_REGULAR_10_13PX|BAGL_FONT_ALIGNMENT_CENTER, 0   }, "Connect your Ledger Blue and open your", 0, 0, 0, NULL, NULL, NULL},
  {{BAGL_LABELINE                       , 0x00,   0, 331, 320,  30, 0, 0, BAGL_FILL, 0x000000, COLOR_BG_1, BAGL_FONT_OPEN_SANS_REGULAR_10_13PX|BAGL_FONT_ALIGNMENT_CENTER, 0   }, "preferred wallet to view your accounts.", 0, 0, 0, NULL, NULL, NULL},

  {{BAGL_LABELINE                       , 0x00,   0, 450, 320,  14, 0, 0, 0        , 0x999999, COLOR_BG_1, BAGL_FONT_OPEN_SANS_REGULAR_8_11PX|BAGL_FONT_ALIGNMENT_CENTER, 0   }, "Validation requests will show automatically.", 10, 0, COLOR_BG_1, NULL, NULL, NULL },
};

const bagl_element_t ui_details_blue[] = {
  // erase screen (only under the status bar)
  {{BAGL_RECTANGLE                      , 0x00,   0,  68, 320, 413, 0, 0, BAGL_FILL, COLOR_BG_1, 0x000000, 0                                                                                 , 0   }, NULL, 0, 0, 0, NULL, NULL, NULL },

  {{BAGL_RECTANGLE                      , 0x00,   0,  20, 320,  48, 0, 0, BAGL_FILL, COLOR_APP, COLOR_APP, 0                                                      , 0   }, NULL, 0, 0, 0, NULL, NULL, NULL},

  /// TOP STATUS BAR
  {{BAGL_LABELINE                       , 0x01,   0,  45, 320,  30, 0, 0, BAGL_FILL, 0xFFFFFF, COLOR_APP, BAGL_FONT_OPEN_SANS_SEMIBOLD_10_13PX|BAGL_FONT_ALIGNMENT_CENTER, 0   }, addressSummary, 0, 0, 0, NULL, NULL, NULL},

  {{BAGL_RECTANGLE | BAGL_FLAG_TOUCHABLE, 0x00,   0,  19,  50,  44, 0, 0, BAGL_FILL, COLOR_APP, COLOR_APP_LIGHT, BAGL_FONT_SYMBOLS_0|BAGL_FONT_ALIGNMENT_CENTER|BAGL_FONT_ALIGNMENT_MIDDLE, 0 }, BAGL_FONT_SYMBOLS_0_LEFT, 0, COLOR_APP, 0xFFFFFF, ui_details_blue_back_callback, NULL, NULL},
  //{{BAGL_RECTANGLE | BAGL_FLAG_TOUCHABLE, 0x00, 264,  19,  56,  44, 0, 0, BAGL_FILL, COLOR_APP, COLOR_APP_LIGHT, BAGL_FONT_SYMBOLS_0|BAGL_FONT_ALIGNMENT_CENTER|BAGL_FONT_ALIGNMENT_MIDDLE, 0 }, " " /*BAGL_FONT_SYMBOLS_0_DASHBOARD*/, 0, COLOR_APP, 0xFFFFFF, io_seproxyhal_touch_exit, NULL, NULL},

  {{BAGL_LABELINE                       , 0x00,  30, 106, 320,  30, 0, 0, BAGL_FILL, 0x999999, COLOR_BG_1, BAGL_FONT_OPEN_SANS_SEMIBOLD_8_11PX, 0   }, "VALUE", 0, 0, 0, NULL, NULL, NULL},

  {{BAGL_LABELINE                       , 0x10,  30, 136, 260,  30, 0, 0, BAGL_FILL, 0x000000, COLOR_BG_1, BAGL_FONT_OPEN_SANS_REGULAR_10_13PX, 0   }, addressSummary, 0, 0, 0, NULL, NULL, NULL},
  {{BAGL_LABELINE                       , 0x11,  30, 159, 260,  30, 0, 0, BAGL_FILL, 0x000000, COLOR_BG_1, BAGL_FONT_OPEN_SANS_REGULAR_10_13PX, 0   }, addressSummary, 0, 0, 0, NULL, NULL, NULL},
  {{BAGL_LABELINE                       , 0x12,  30, 182, 260,  30, 0, 0, BAGL_FILL, 0x000000, COLOR_BG_1, BAGL_FONT_OPEN_SANS_REGULAR_10_13PX, 0   }, addressSummary, 0, 0, 0, NULL, NULL, NULL},
  {{BAGL_LABELINE                       , 0x13,  30, 205, 260,  30, 0, 0, BAGL_FILL, 0x000000, COLOR_BG_1, BAGL_FONT_OPEN_SANS_REGULAR_10_13PX, 0   }, addressSummary, 0, 0, 0, NULL, NULL, NULL},
  {{BAGL_LABELINE                       , 0x14,  30, 228, 260,  30, 0, 0, BAGL_FILL, 0x000000, COLOR_BG_1, BAGL_FONT_OPEN_SANS_REGULAR_10_13PX, 0   }, addressSummary, 0, 0, 0, NULL, NULL, NULL},
  {{BAGL_LABELINE                       , 0x15,  30, 251, 260,  30, 0, 0, BAGL_FILL, 0x000000, COLOR_BG_1, BAGL_FONT_OPEN_SANS_REGULAR_10_13PX, 0   }, addressSummary, 0, 0, 0, NULL, NULL, NULL},
  {{BAGL_LABELINE                       , 0x16,  30, 274, 260,  30, 0, 0, BAGL_FILL, 0x000000, COLOR_BG_1, BAGL_FONT_OPEN_SANS_REGULAR_10_13PX, 0   }, addressSummary, 0, 0, 0, NULL, NULL, NULL},
  {{BAGL_LABELINE                       , 0x17,  30, 297, 260,  30, 0, 0, BAGL_FILL, 0x000000, COLOR_BG_1, BAGL_FONT_OPEN_SANS_REGULAR_10_13PX, 0   }, addressSummary, 0, 0, 0, NULL, NULL, NULL},
  {{BAGL_LABELINE                       , 0x18,  30, 320, 260,  30, 0, 0, BAGL_FILL, 0x000000, COLOR_BG_1, BAGL_FONT_OPEN_SANS_REGULAR_10_13PX, 0   }, addressSummary, 0, 0, 0, NULL, NULL, NULL},
  //"..." at the end if too much
  {{BAGL_LABELINE                       , 0x19,  30, 343, 260,  30, 0, 0, BAGL_FILL, 0x000000, COLOR_BG_1, BAGL_FONT_OPEN_SANS_REGULAR_10_13PX, 0   }, addressSummary, 0, 0, 0, NULL, NULL, NULL},

  {{BAGL_LABELINE                       , 0x00,   0, 450, 320,  14, 0, 0, 0        , 0x999999, COLOR_BG_1, BAGL_FONT_OPEN_SANS_REGULAR_8_11PX|BAGL_FONT_ALIGNMENT_CENTER, 0   }, "Review the whole value before continuing.", 10, 0, COLOR_BG_1, NULL, NULL, NULL },
};

const bagl_element_t ui_approval_blue[] = {
  {{BAGL_RECTANGLE                      , 0x00,   0,  68, 320, 413, 0, 0, BAGL_FILL, COLOR_BG_1, 0x000000, 0                                                                                 , 0   }, NULL, 0, 0, 0, NULL, NULL, NULL },

  // erase screen (only under the status bar)
  {{BAGL_RECTANGLE                      , 0x00,   0,  20, 320,  48, 0, 0, BAGL_FILL, COLOR_APP, COLOR_APP, 0                                                      , 0   }, NULL, 0, 0, 0, NULL, NULL, NULL},

  /// TOP STATUS BAR
  {{BAGL_LABELINE                       , 0x60,   0,  45, 320,  30, 0, 0, BAGL_FILL, 0xFFFFFF, COLOR_APP, BAGL_FONT_OPEN_SANS_SEMIBOLD_10_13PX|BAGL_FONT_ALIGNMENT_CENTER, 0   }, NULL, 0, 0, 0, NULL, NULL, NULL},

  // BADGE_TRANSACTION.GIF
  {{BAGL_ICON                           , 0x40,  30,  98,  50,  50, 0, 0, BAGL_FILL, 0       , COLOR_BG_1, 0                                                                                 , 0  } , &C_badge_transaction, 0, 0, 0, NULL, NULL, NULL },

  {{BAGL_LABELINE                       , 0x50, 100, 117, 320,  30, 0, 0, BAGL_FILL, 0x000000, COLOR_BG_1, BAGL_FONT_OPEN_SANS_REGULAR_10_13PX, 0   }, NULL, 0, 0, 0, NULL, NULL, NULL},

  {{BAGL_LABELINE                       , 0x00, 100, 138, 320,  30, 0, 0, BAGL_FILL, 0x999999, COLOR_BG_1, BAGL_FONT_OPEN_SANS_REGULAR_8_11PX, 0   }, "Check and confirm values", 0, 0, 0, NULL, NULL, NULL},


  {{BAGL_LABELINE                       , 0x70,  30, 196, 100,  30, 0, 0, BAGL_FILL, 0x000000, COLOR_BG_1, BAGL_FONT_OPEN_SANS_SEMIBOLD_8_11PX, 0   }, NULL, 0, 0, 0, NULL, NULL, NULL}, // AMOUNT
  // x-18 when ...
  {{BAGL_LABELINE                       , 0x10, 130, 200, 160,  30, 0, 0, BAGL_FILL, 0x000000, COLOR_BG_1, BAGL_FONT_OPEN_SANS_LIGHT_16_22PX|BAGL_FONT_ALIGNMENT_RIGHT, 0   }, NULL, 0, 0, 0, NULL, NULL, NULL}, // fullAmount
  {{BAGL_LABELINE                       , 0x20, 284, 196,   6,  16, 0, 0, BAGL_FILL, 0x999999, COLOR_BG_1, BAGL_FONT_SYMBOLS_0|BAGL_FONT_ALIGNMENT_RIGHT, 0   }, BAGL_FONT_SYMBOLS_0_MINIRIGHT, 0, 0, 0, NULL, NULL, NULL},
  {{BAGL_NONE   | BAGL_FLAG_TOUCHABLE   , 0x00,   0, 168, 320,  48, 0, 9, BAGL_FILL, 0xFFFFFF, 0x000000, 0                                                                                        , 0   }, NULL, 0, 0xEEEEEE, 0x000000, ui_approval_blue_1_details, ui_menu_item_out_over, ui_menu_item_out_over },
  {{BAGL_RECTANGLE                      , 0x20,   0, 168,   5,  48, 0, 0, BAGL_FILL, COLOR_BG_1, COLOR_BG_1, 0                                                                                    , 0   }, NULL, 0, 0x41CCB4, 0, NULL, NULL, NULL },

  {{BAGL_RECTANGLE                      , 0x31,  30, 216, 260,   1, 1, 0, 0        , 0xEEEEEE, COLOR_BG_1, 0                                                                                    , 0   }, NULL, 0, 0, 0, NULL, NULL, NULL },


  {{BAGL_LABELINE                       , 0x71,  30, 245, 100,  30, 0, 0, BAGL_FILL, 0x000000, COLOR_BG_1, BAGL_FONT_OPEN_SANS_SEMIBOLD_8_11PX, 0   }, NULL, 0, 0, 0, NULL, NULL, NULL}, // ADDRESS
  // x-18 when ...
  {{BAGL_LABELINE                       , 0x11, 130, 245, 160,  30, 0, 0, BAGL_FILL, 0x000000, COLOR_BG_1, BAGL_FONT_OPEN_SANS_REGULAR_10_13PX|BAGL_FONT_ALIGNMENT_RIGHT, 0   }, NULL, 0, 0, 0, NULL, NULL, NULL}, // fullAddress
  {{BAGL_LABELINE                       , 0x21, 284, 245,   6,  16, 0, 0, BAGL_FILL, 0x999999, COLOR_BG_1, BAGL_FONT_SYMBOLS_0|BAGL_FONT_ALIGNMENT_RIGHT, 0   }, BAGL_FONT_SYMBOLS_0_MINIRIGHT, 0, 0, 0, NULL, NULL, NULL},
  {{BAGL_NONE   | BAGL_FLAG_TOUCHABLE   , 0x00,   0, 217, 320,  48, 0, 9, BAGL_FILL, 0xFFFFFF, 0x000000, 0                                                                                        , 0   }, NULL, 0, 0xEEEEEE, 0x000000, ui_approval_blue_2_details, ui_menu_item_out_over, ui_menu_item_out_over },
  {{BAGL_RECTANGLE                      , 0x21,   0, 217,   5,  48, 0, 0, BAGL_FILL, COLOR_BG_1, COLOR_BG_1, 0                                                                                    , 0   }, NULL, 0, 0x41CCB4, 0, NULL, NULL, NULL },

  {{BAGL_RECTANGLE                      , 0x32,  30, 265, 260,   1, 1, 0, 0        , 0xEEEEEE, COLOR_BG_1, 0                                                                                    , 0   }, NULL, 0, 0, 0, NULL, NULL, NULL },


  {{BAGL_LABELINE                       , 0x72,  30, 294, 100,  30, 0, 0, BAGL_FILL, 0x000000, COLOR_BG_1, BAGL_FONT_OPEN_SANS_SEMIBOLD_8_11PX, 0   }, NULL, 0, 0, 0, NULL, NULL, NULL}, // MAX FEES
  // x-18 when ...
  {{BAGL_LABELINE                       , 0x12, 130, 294, 160,  30, 0, 0, BAGL_FILL, 0x000000, COLOR_BG_1, BAGL_FONT_OPEN_SANS_REGULAR_10_13PX|BAGL_FONT_ALIGNMENT_RIGHT, 0   }, NULL, 0, 0, 0, NULL, NULL, NULL}, //maxFee
  {{BAGL_LABELINE                       , 0x22, 284, 294,   6,  16, 0, 0, BAGL_FILL, 0x999999, COLOR_BG_1, BAGL_FONT_SYMBOLS_0|BAGL_FONT_ALIGNMENT_RIGHT, 0   }, BAGL_FONT_SYMBOLS_0_MINIRIGHT, 0, 0, 0, NULL, NULL, NULL},
  {{BAGL_NONE   | BAGL_FLAG_TOUCHABLE   , 0x00,   0, 266, 320,  48, 0, 9, BAGL_FILL, 0xFFFFFF, 0x000000, 0                                                                                        , 0   }, NULL, 0, 0xEEEEEE, 0x000000, ui_approval_blue_3_details, ui_menu_item_out_over, ui_menu_item_out_over },
  {{BAGL_RECTANGLE                      , 0x22,   0, 266,   5,  48, 0, 0, BAGL_FILL, COLOR_BG_1, COLOR_BG_1, 0                                                                                    , 0   }, NULL, 0, 0x41CCB4, 0, NULL, NULL, NULL },

  {{BAGL_RECTANGLE, 0x90, 30, 314, 260, 1, 1, 0, 0, 0xEEEEEE, COLOR_BG_1, 0, 0}, NULL, 0, 0, 0, NULL, NULL, NULL},
  {{BAGL_LABELINE, 0x90, 30, 343, 120, 30, 0, 0, BAGL_FILL, 0x000000, COLOR_BG_1, BAGL_FONT_OPEN_SANS_SEMIBOLD_8_11PX, 0}, "CONTRACT DATA", 0, 0, 0, NULL, NULL, NULL},
  {{BAGL_LABELINE, 0x90, 133, 343, 140, 30, 0, 0, BAGL_FILL, 0x666666, COLOR_BG_1, BAGL_FONT_OPEN_SANS_REGULAR_10_13PX | BAGL_FONT_ALIGNMENT_RIGHT, 0}, "Present", 0, 0, 0, NULL, NULL, NULL},
  {{BAGL_ICON, 0x90, 278, 333, 12, 12, 0, 0, BAGL_FILL, 0, COLOR_BG_1, 0, 0}, &C_icon_warning, 0, 0, 0, NULL, NULL, NULL},

  {{BAGL_RECTANGLE | BAGL_FLAG_TOUCHABLE, 0x00,  40, 414, 115,  36, 0,18, BAGL_FILL, 0xCCCCCC, COLOR_BG_1, BAGL_FONT_OPEN_SANS_REGULAR_11_14PX|BAGL_FONT_ALIGNMENT_CENTER|BAGL_FONT_ALIGNMENT_MIDDLE, 0 }, "REJECT", 0, 0xB7B7B7, COLOR_BG_1, ui_approval_blue_cancel_callback, NULL, NULL},
  {{BAGL_RECTANGLE | BAGL_FLAG_TOUCHABLE, 0x00, 165, 414, 115,  36, 0,18, BAGL_FILL, 0x41ccb4, COLOR_BG_1, BAGL_FONT_OPEN_SANS_REGULAR_11_14PX|BAGL_FONT_ALIGNMENT_CENTER|BAGL_FONT_ALIGNMENT_MIDDLE, 0 }, "CONFIRM", 0, 0x3ab7a2, COLOR_BG_1, ui_approval_blue_ok_callback, NULL, NULL},

};

#if defined(TARGET_BLUE)
const bagl_element_t ui_address_blue[] = {
  {{BAGL_RECTANGLE                      , 0x00,   0,  68, 320, 413, 0, 0, BAGL_FILL, COLOR_BG_1, 0x000000, 0                                                                                 , 0   }, NULL, 0, 0, 0, NULL, NULL, NULL },


  // erase screen (only under the status bar)
  {{BAGL_RECTANGLE                      , 0x00,   0,  20, 320,  48, 0, 0, BAGL_FILL, COLOR_APP, COLOR_APP, 0                                                      , 0   }, NULL, 0, 0, 0, NULL, NULL, NULL},

  /// TOP STATUS BAR
  {{BAGL_LABELINE                       , 0x00,   0,  45, 320,  30, 0, 0, BAGL_FILL, 0xFFFFFF, COLOR_APP, BAGL_FONT_OPEN_SANS_SEMIBOLD_10_13PX|BAGL_FONT_ALIGNMENT_CENTER, 0   }, "CONFIRM ACCOUNT", 0, 0, 0, NULL, NULL, NULL},

  //{{BAGL_RECTANGLE | BAGL_FLAG_TOUCHABLE, 0x00, 264,  19,  56,  44, 0, 0, BAGL_FILL, COLOR_APP, COLOR_APP_LIGHT, BAGL_FONT_SYMBOLS_0|BAGL_FONT_ALIGNMENT_CENTER|BAGL_FONT_ALIGNMENT_MIDDLE, 0 }, " " /*BAGL_FONT_SYMBOLS_0_DASHBOARD*/, 0, COLOR_APP, 0xFFFFFF, io_seproxyhal_touch_exit, NULL, NULL},

  {{BAGL_LABELINE                       , 0x00,  30, 106, 320,  30, 0, 0, BAGL_FILL, 0x999999, COLOR_BG_1, BAGL_FONT_OPEN_SANS_SEMIBOLD_8_11PX, 0   }, "ACCOUNT", 0, 0, 0, NULL, NULL, NULL},

  {{BAGL_LABELINE                       , 0x10,  30, 136, 260,  30, 0, 0, BAGL_FILL, 0x000000, COLOR_BG_1, BAGL_FONT_OPEN_SANS_REGULAR_10_13PX, 0   }, addressSummary, 0, 0, 0, NULL, NULL, NULL},
  {{BAGL_LABELINE                       , 0x11,  30, 159, 260,  30, 0, 0, BAGL_FILL, 0x000000, COLOR_BG_1, BAGL_FONT_OPEN_SANS_REGULAR_10_13PX, 0   }, addressSummary, 0, 0, 0, NULL, NULL, NULL},

  {{BAGL_RECTANGLE | BAGL_FLAG_TOUCHABLE, 0x00,  40, 414, 115,  36, 0,18, BAGL_FILL, 0xCCCCCC, COLOR_BG_1, BAGL_FONT_OPEN_SANS_REGULAR_11_14PX|BAGL_FONT_ALIGNMENT_CENTER|BAGL_FONT_ALIGNMENT_MIDDLE, 0 }, "REJECT", 0, 0xB7B7B7, COLOR_BG_1, io_seproxyhal_touch_address_cancel, NULL, NULL},
  {{BAGL_RECTANGLE | BAGL_FLAG_TOUCHABLE, 0x00, 165, 414, 115,  36, 0,18, BAGL_FILL, 0x41ccb4, COLOR_BG_1, BAGL_FONT_OPEN_SANS_REGULAR_11_14PX|BAGL_FONT_ALIGNMENT_CENTER|BAGL_FONT_ALIGNMENT_MIDDLE, 0 }, "CONFIRM", 0, 0x3ab7a2, COLOR_BG_1, io_seproxyhal_touch_address_ok, NULL, NULL},
};

unsigned int ui_address_blue_prepro(const bagl_element_t* element) {
  copy_element_and_map_coin_colors(element);
  if(element->component.userid > 0) {
    unsigned int length = strlen(strings.common.fullAddress);
    if (length >= (element->component.userid & 0xF) * MAX_CHAR_PER_LINE) {
      os_memset(addressSummary, 0, MAX_CHAR_PER_LINE+1);
      os_memmove(addressSummary, strings.common.fullAddress+(element->component.userid & 0xF) * MAX_CHAR_PER_LINE, MIN(length - (element->component.userid & 0xF) * MAX_CHAR_PER_LINE, MAX_CHAR_PER_LINE));
      return &tmp_element;
    }
    // nothing to draw for this line
    return 0;
  }
  return &tmp_element;
}

unsigned int ui_address_blue_button(unsigned int button_mask, unsigned int button_mask_counter) {
  return 0;
}
#endif // #if defined(TARGET_BLUE)

#endif