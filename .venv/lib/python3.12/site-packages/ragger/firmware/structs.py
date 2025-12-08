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
from enum import IntEnum
from ledgered.devices import Devices, DeviceType
from warnings import warn


DEPRECATION_MESSAGE = "`ragger.firmware.Firmware` is deprecated, use `ledgered.devices.Devices` " \
    "or `ledgered.devices.DeviceType` instead"


class Firmware(IntEnum):
    NANOS = DeviceType.NANOS
    NANOSP = DeviceType.NANOSP
    NANOX = DeviceType.NANOX
    STAX = DeviceType.STAX
    FLEX = DeviceType.FLEX
    APEX_P = DeviceType.APEX_P
    APEX_M = DeviceType.APEX_M

    @staticmethod
    def deprec_warning() -> None:
        warn(DEPRECATION_MESSAGE)

    @property
    def name(self) -> str:
        """
        Returns the name of the current firmware's device
        """
        self.deprec_warning()
        return Devices.get_by_type(self).name

    @property
    def device(self) -> str:
        """
        A proxy property for :attr:`.Firmware.name`.
        This property is deprecated. It is advise to not use it.
        """
        self.deprec_warning()
        return self.name

    @property
    def is_nano(self):
        """
        States if the firmware's name starts with 'nano' or not.
        """
        self.deprec_warning()
        return Devices.get_by_type(self).is_nano
