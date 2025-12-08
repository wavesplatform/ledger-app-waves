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
from contextlib import contextmanager
from time import sleep
from typing import Generator, Optional

from ledgered.devices import Device
from ledgerwallet.client import LedgerClient, CommException
from ledgerwallet.transport import HidDevice

from ragger.utils import RAPDU
from ragger.error import ExceptionRAPDU
from .physical_backend import PhysicalBackend


def raise_policy_enforcer(function):

    def decoration(self: 'LedgerWalletBackend', *args, **kwargs) -> RAPDU:
        # Catch backend raise
        try:
            rapdu: RAPDU = function(self, *args, **kwargs)
        except CommException as error:
            rapdu = RAPDU(error.sw, error.data)

        self.apdu_logger.info("<= %s%4x", rapdu.data.hex(), rapdu.status)

        if self.is_raise_required(rapdu):
            raise ExceptionRAPDU(rapdu.status, rapdu.data)
        else:
            return rapdu

    return decoration


class LedgerWalletBackend(PhysicalBackend):

    def __init__(self, device: Device, *args, with_gui: bool = False, **kwargs):
        super().__init__(device, *args, with_gui=with_gui, **kwargs)
        self._client: Optional[LedgerClient] = None

    def __enter__(self) -> "LedgerWalletBackend":
        self.logger.info(f"Starting {self.__class__.__name__} stream")
        try:
            self._client = LedgerClient()
        except Exception:
            # Give some time for the USB stack to power up and to be enumerated
            # Might be needed in successive tests where app is exited at the end of the test
            sleep(1)
            self._client = LedgerClient()
        return self

    def __exit__(self, *args):
        super().__exit__(*args)
        assert self._client is not None
        self._client.close()

    def handle_usb_reset(self) -> None:
        self.logger.info(f"Re-starting {self.__class__.__name__} stream")
        self.__exit__()
        self.__enter__()

    def send_raw(self, data: bytes = b"") -> None:
        self.apdu_logger.info("=> %s", data.hex())
        assert self._client is not None
        self._client.device.write(data)

    @raise_policy_enforcer
    def receive(self) -> RAPDU:
        assert self._client is not None
        # TODO: remove this checked with LedgerWallet > 0.1.3
        if isinstance(self._client.device, HidDevice):
            raw_result = self._client.device.read(1000)
        else:
            raw_result = self._client.device.read()
        status, payload = int.from_bytes(raw_result[-2:], "big"), raw_result[:-2] or b""
        result = RAPDU(status, payload)
        return result

    @raise_policy_enforcer
    def exchange_raw(self, data: bytes = b"", tick_timeout: int = 0) -> RAPDU:
        self.apdu_logger.info("=> %s", data.hex())
        assert self._client is not None
        raw_result = self._client.raw_exchange(data)
        result = RAPDU(int.from_bytes(raw_result[-2:], "big"), raw_result[:-2] or b"")
        return result

    @contextmanager
    def exchange_async_raw(self, data: bytes = b"") -> Generator[bool, None, None]:
        self.send_raw(data)
        yield True
        self._last_async_response = self.receive()
