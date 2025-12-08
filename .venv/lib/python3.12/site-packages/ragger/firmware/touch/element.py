"""
   Copyright 2024 Ledger SAS

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
from ledgered.devices import Device

from ragger.backend import BackendInterface
from .positions import POSITIONS


class Element:

    def __init__(self, client: BackendInterface, device: Device):
        self._client = client
        self._device = device

    @property
    def client(self) -> BackendInterface:
        return self._client

    @property
    def device(self) -> Device:
        return self._device

    @property
    def positions(self):
        return POSITIONS[str(self.__class__.__name__)][self.device.type]


class Center(Element):

    def swipe_left(self):
        self.client.finger_swipe(*self.positions, direction="left")

    def swipe_right(self):
        self.client.finger_swipe(*self.positions, direction="right")
