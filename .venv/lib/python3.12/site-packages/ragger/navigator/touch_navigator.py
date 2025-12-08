"""
   Copyright 2022 Ledger SAS

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
"""
from time import sleep
from typing import Callable, Dict
from ledgered.devices import Device

from ragger.backend import BackendInterface
from ragger.firmware.touch import FullScreen
from .navigator import Navigator
from .instruction import BaseNavInsID, NavInsID


class TouchNavigator(Navigator):

    def __init__(self, backend: BackendInterface, device: Device, golden_run: bool = False):
        if not device.touchable:
            raise ValueError(f"'{self.__class__.__name__}' only works with touchable devices")
        screen = FullScreen(backend, device)
        callbacks: Dict[BaseNavInsID, Callable] = {
            NavInsID.WAIT: sleep,
            NavInsID.WAIT_FOR_SCREEN_CHANGE: backend.wait_for_screen_change,
            NavInsID.WAIT_FOR_HOME_SCREEN: backend.wait_for_home_screen,
            NavInsID.WAIT_FOR_TEXT_ON_SCREEN: backend.wait_for_text_on_screen,
            NavInsID.WAIT_FOR_TEXT_NOT_ON_SCREEN: backend.wait_for_text_not_on_screen,
            NavInsID.TOUCH: backend.finger_touch,
            NavInsID.SWIPE: backend.finger_swipe,
            NavInsID.SWIPE_CENTER_TO_LEFT: screen.center.swipe_left,
            NavInsID.SWIPE_CENTER_TO_RIGHT: screen.center.swipe_right,
            # possible headers
            NavInsID.RIGHT_HEADER_TAP: screen.right_header.tap,
            NavInsID.EXIT_HEADER_TAP: screen.exit_header.tap,
            NavInsID.INFO_HEADER_TAP: screen.info_header.tap,
            NavInsID.LEFT_HEADER_TAP: screen.left_header.tap,
            NavInsID.NAVIGATION_HEADER_TAP: screen.navigation_header.tap,
            # possible centers
            NavInsID.CHOICE_CHOOSE: screen.choice_list.choose,
            NavInsID.SUGGESTION_CHOOSE: screen.suggestions.choose,
            NavInsID.TAPPABLE_CENTER_TAP: screen.tappable_center.tap,
            NavInsID.KB_LETTER_ONLY_WRITE: screen.letter_only_keyboard.write,
            NavInsID.KB_LETTERS_WRITE: screen.full_keyboard_letters.write,
            NavInsID.KB_SPECIAL_CHAR_1_WRITE: screen.full_keyboard_special_characters_1.write,
            NavInsID.KB_SPECIAL_CHAR_2_WRITE: screen.full_keyboard_special_characters_2.write,
            # possible footers
            NavInsID.CENTERED_FOOTER_TAP: screen.centered_footer.tap,
            NavInsID.CANCEL_FOOTER_TAP: screen.cancel_footer.tap,
            NavInsID.EXIT_FOOTER_TAP: screen.exit_footer.tap,
            NavInsID.INFO_FOOTER_TAP: screen.info_footer.tap,
            # possible use cases
            NavInsID.USE_CASE_HOME_INFO: screen.home.info,
            NavInsID.USE_CASE_HOME_SETTINGS: screen.home.settings,
            NavInsID.USE_CASE_HOME_QUIT: screen.home.quit,
            NavInsID.USE_CASE_SETTINGS_SINGLE_PAGE_EXIT: screen.settings.single_page_exit,
            NavInsID.USE_CASE_SETTINGS_MULTI_PAGE_EXIT: screen.settings.multi_page_exit,
            NavInsID.USE_CASE_SETTINGS_PREVIOUS: screen.settings.previous,
            NavInsID.USE_CASE_SETTINGS_NEXT: screen.settings.next,
            NavInsID.USE_CASE_SUB_SETTINGS_EXIT: screen.sub_settings.exit,
            NavInsID.USE_CASE_SUB_SETTINGS_PREVIOUS: screen.sub_settings.previous,
            NavInsID.USE_CASE_SUB_SETTINGS_NEXT: screen.sub_settings.next,
            NavInsID.USE_CASE_CHOICE_CONFIRM: screen.choice.confirm,
            NavInsID.USE_CASE_CHOICE_REJECT: screen.choice.reject,
            NavInsID.USE_CASE_STATUS_DISMISS: screen.status.dismiss,
            NavInsID.USE_CASE_REVIEW_TAP: screen.review.tap,
            NavInsID.USE_CASE_REVIEW_NEXT: screen.center.swipe_left,
            NavInsID.USE_CASE_REVIEW_PREVIOUS: screen.review.previous,
            NavInsID.USE_CASE_REVIEW_REJECT: screen.review.reject,
            NavInsID.USE_CASE_REVIEW_CONFIRM: screen.review.confirm,
            NavInsID.USE_CASE_VIEW_DETAILS_EXIT: screen.view_details.exit,
            NavInsID.USE_CASE_VIEW_DETAILS_PREVIOUS: screen.view_details.previous,
            NavInsID.USE_CASE_VIEW_DETAILS_NEXT: screen.view_details.next,
            NavInsID.USE_CASE_ADDRESS_CONFIRMATION_TAP: screen.address_confirmation.tap,
            NavInsID.USE_CASE_ADDRESS_CONFIRMATION_EXIT_QR: screen.address_confirmation.exit_qr,
            NavInsID.USE_CASE_ADDRESS_CONFIRMATION_CONFIRM: screen.address_confirmation.confirm,
            NavInsID.USE_CASE_ADDRESS_CONFIRMATION_CANCEL: screen.address_confirmation.cancel,
        }
        super().__init__(backend, device, callbacks, golden_run)
