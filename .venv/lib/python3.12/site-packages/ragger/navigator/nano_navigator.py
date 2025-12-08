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
from .navigator import BaseNavInsID, Navigator, NavInsID


class NanoNavigator(Navigator):

    def __init__(self, backend: BackendInterface, device: Device, golden_run: bool = False):
        if device.touchable:
            raise ValueError(f"'{self.__class__.__name__}' does not work on touchable devices")
        callbacks: Dict[BaseNavInsID, Callable] = {
            NavInsID.WAIT: sleep,
            NavInsID.WAIT_FOR_SCREEN_CHANGE: backend.wait_for_screen_change,
            NavInsID.WAIT_FOR_HOME_SCREEN: backend.wait_for_home_screen,
            NavInsID.WAIT_FOR_TEXT_ON_SCREEN: backend.wait_for_text_on_screen,
            NavInsID.WAIT_FOR_TEXT_NOT_ON_SCREEN: backend.wait_for_text_not_on_screen,
            NavInsID.RIGHT_CLICK: backend.right_click,
            NavInsID.LEFT_CLICK: backend.left_click,
            NavInsID.BOTH_CLICK: backend.both_click
        }
        super().__init__(backend, device, callbacks, golden_run)
