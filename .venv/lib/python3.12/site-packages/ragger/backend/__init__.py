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
from .interface import BackendInterface, RaisePolicy
from .stub import StubBackend

ERROR_MSG = ("This backend needs {}. Please install this package (run `pip install ragger[{}]` or "
             "check this address: '{}')")

try:
    from .speculos import SpeculosBackend
except ImportError as e:
    if "speculos" not in str(e):
        raise e

    def SpeculosBackend(*args, **kwargs):  # type: ignore
        raise ImportError(
            ERROR_MSG.format("Speculos", "speculos", "https://github.com/LedgerHQ/speculos/"))


try:
    from .ledgercomm import LedgerCommBackend
except ImportError as e:
    if "ledgercomm" not in str(e):
        raise e

    def LedgerCommBackend(*args, **kwargs):  # type: ignore
        raise ImportError(
            ERROR_MSG.format("LedgerComm", "ledgercomm", "https://github.com/LedgerHQ/ledgercomm/"))


try:
    from .ledgerwallet import LedgerWalletBackend
except ImportError as e:
    if "ledgerwallet" not in str(e):
        raise e

    def LedgerWalletBackend(*args, **kwargs):  # type: ignore
        raise ImportError(
            ERROR_MSG.format("LedgerWallet", "ledgerwallet",
                             "https://github.com/LedgerHQ/ledgerctl/"))


__all__ = [
    "SpeculosBackend", "LedgerCommBackend", "LedgerWalletBackend", "BackendInterface",
    "RaisePolicy", "StubBackend"
]
