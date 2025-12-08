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
from dataclasses import dataclass


@dataclass(frozen=True)
class Crop:
    left: int = 0
    upper: int = 0
    right: int = 0
    lower: int = 0


@dataclass(frozen=True)
class RAPDU:
    """
    The dataclass containing the application's response of an APDU from the
    client to the application.

    It is composed of two attributes:

    - ``status`` (``int``): from the two last bytes of the payload. Common
      values are 0x9000 for success, other being errors.
    - ``data`` (``bytes``): the rest of the response (the entire payload without
      the two last bytes)
    """
    status: int
    data: bytes

    def __str__(self):
        return f'[0x{self.status:02x}] {self.data.hex() if self.data else "<Nothing>"}'

    @property
    def raw(self):
        return self.data + self.status.to_bytes(2, 'big')
