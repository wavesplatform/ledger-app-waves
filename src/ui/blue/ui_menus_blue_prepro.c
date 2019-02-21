#include "ui_menus_blue_prepro.h"

#include "../ui.h"

const bagl_element_t * ui_address_blue_prepro(const bagl_element_t* element) {
//  if(element->component.userid > 0) {
//    unsigned int length = strlen(strings.common.fullAddress);
//    if (length >= (element->component.userid & 0xF) * MAX_CHAR_PER_LINE) {
//      os_memset(addressSummary, 0, MAX_CHAR_PER_LINE+1);
//      os_memmove(addressSummary, strings.common.fullAddress+(element->component.userid & 0xF) * MAX_CHAR_PER_LINE, MIN(length - (element->component.userid & 0xF) * MAX_CHAR_PER_LINE, MAX_CHAR_PER_LINE));
//      return &element;
//    }
    // nothing to draw for this line
//    return 0;
//  }
  return element;
}

const bagl_element_t *ui_idle_blue_prepro(const bagl_element_t *element) {
//    if (element->component.userid == 0x01) {
//        tmp_element.text = chainConfig->header_text;
//    }
    return element;
}

const bagl_element_t* ui_approval_blue_prepro(const bagl_element_t* element) {
    // none elements are skipped
//    if ((element->component.type&(~BAGL_FLAG_TOUCHABLE)) == BAGL_NONE) {
//      return 0;
//    }
//    else {
//      switch(element->component.userid&0xF0) {
//        // icon
//        case 0x40:
//          return element;
//          break;
//        // TITLE
//        case 0x60:
//          return element;
//          break;
//        // SUBLINE
//        case 0x50:
//          return element;
//        // details label
//        case 0x70:
//          return NULL;
//        // detail value
//        case 0x10:
//          return NULL;
//          break;
//      }
//    }
    return element;
}