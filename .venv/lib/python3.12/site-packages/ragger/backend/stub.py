"""
   Copyright 2023 Ledger SAS

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
from pathlib import Path
from types import TracebackType
from typing import Any, Generator, Optional, Type

from ragger.utils.structs import Crop, RAPDU
from .interface import BackendInterface


class StubBackend(BackendInterface):
    """
    A stub implementation of the BackendInterface.

    Could be used everywhere a stub is needed, for instance when injecting a backend of various
    type in a broader service, which could use the backend, or not, without cluttering the code
    flow with conditional branches.
    """

    def __enter__(self):
        pass

    def __exit__(self, exc_type: Optional[Type[BaseException]], exc_val: Optional[BaseException],
                 exc_tb: Optional[TracebackType]):
        pass

    def handle_usb_reset(self) -> None:
        pass

    def send_raw(self, data: bytes = b""):
        pass

    def receive(self) -> RAPDU:
        return RAPDU(0x9000, b"")

    def exchange_raw(self, data: bytes = b"", tick_timeout: int = 5 * 60 * 10) -> RAPDU:
        return RAPDU(0x9000, b"")

    @contextmanager
    def exchange_async_raw(self, data: bytes = b"") -> Generator[None, None, None]:
        yield

    def right_click(self) -> None:
        pass

    def left_click(self) -> None:
        pass

    def both_click(self) -> None:
        pass

    def finger_touch(self, x: int = 0, y: int = 0, delay: float = 0.5) -> None:
        pass

    def finger_swipe(self,
                     x: int = 0,
                     y: int = 0,
                     direction: str = "left",
                     delay: float = 0.5) -> None:
        pass

    def compare_screen_with_snapshot(self,
                                     golden_snap_path: Path,
                                     crop: Optional[Crop] = None,
                                     tmp_snap_path: Optional[Path] = None,
                                     golden_run: bool = False) -> bool:
        return True

    def wait_for_home_screen(self, timeout: float = 10.0) -> None:
        return

    def wait_for_screen_change(self, timeout: float = 10.0) -> None:
        pass

    def wait_for_text_on_screen(self, text: str, timeout: float = 10.0) -> None:
        return

    def wait_for_text_not_on_screen(self, text: str, timeout: float = 10.0) -> None:
        return

    def compare_screen_with_text(self, text: str) -> bool:
        return True

    def get_current_screen_content(self) -> Any:
        pass

    def pause_ticker(self) -> None:
        pass

    def resume_ticker(self) -> None:
        pass

    def send_tick(self) -> None:
        pass
