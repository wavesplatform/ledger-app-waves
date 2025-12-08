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


@dataclass
class ExceptionRAPDU(Exception):
    """
    Depending on the :class:`RaisePolicy <ragger.backend.interface.RaisePolicy>`,
    communication with an application can raise this exception.

    Just like :class:`RAPDU <ragger.utils.structs.RAPDU>`, it is composed of two
    attributes:

    - ``status`` (``int``), which is extracted from the two last bytes of the
      response,
    - ``data`` (``bytes``), which is the entire response payload, except the two
      last bytes.
    """

    status: int
    data: bytes = bytes()

    def __str__(self):
        return f"Error [0x{self.status:x}] {str(self.data)}"
