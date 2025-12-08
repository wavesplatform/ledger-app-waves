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
from ledgered.devices import Device
from pathlib import Path
from types import TracebackType
from typing import List, Optional, Type
from re import match, search

from ragger.gui import RaggerGUI
from ragger.navigator.instruction import NavInsID
from ragger.utils import Crop
from .interface import BackendInterface


class PhysicalBackend(BackendInterface):

    def __init__(self, device: Device, *args, with_gui: bool = False, **kwargs):
        super().__init__(device, *args, **kwargs)
        self._ui: Optional[RaggerGUI] = RaggerGUI(device=device.name) if with_gui else None
        self._last_valid_snap_path: Optional[Path] = None

    def __exit__(self,
                 exc_type: Optional[Type[BaseException]] = None,
                 exc_val: Optional[BaseException] = None,
                 exc_tb: Optional[TracebackType] = None):
        if self._ui is not None:
            self._ui.kill()

    def init_gui(self) -> None:
        """
        Initialize the GUI if needed.
        """
        assert self._ui is not None, \
            "This method should only be called if the backend manages an GUI"
        if not self._ui.is_alive():
            self._ui.start()

    def right_click(self) -> None:
        if self._ui is None:
            return
        self.init_gui()
        self._ui.ask_for_click_action(NavInsID.RIGHT_CLICK)

    def left_click(self) -> None:
        if self._ui is None:
            return
        self.init_gui()
        self._ui.ask_for_click_action(NavInsID.LEFT_CLICK)

    def both_click(self) -> None:
        if self._ui is None:
            return
        self.init_gui()
        self._ui.ask_for_click_action(NavInsID.BOTH_CLICK)

    def finger_touch(self, x: int = 0, y: int = 0, delay: float = 0.5) -> None:
        if self._ui is None:
            return
        self.init_gui()
        self._ui.ask_for_touch_action(x, y)

    def finger_swipe(self,
                     x: int = 0,
                     y: int = 0,
                     direction: str = "left",
                     delay: float = 0.5) -> None:
        if self._ui is None:
            return
        self.init_gui()
        self._ui.ask_for_swipe_action(x, y, direction)

    def compare_screen_with_snapshot(self,
                                     golden_snap_path: Path,
                                     crop: Optional[Crop] = None,
                                     tmp_snap_path: Optional[Path] = None,
                                     golden_run: bool = False) -> bool:

        # If the file has no size, it's because we are within a NamedTemporaryFile
        # We do nothing and return False to exit the while loop of
        # NavInsID.USE_CASE_REVIEW_CONFIRM
        if isinstance(golden_snap_path, Path) and golden_snap_path.stat().st_size == 0:
            return False

        if self._ui is None:
            return True
        self.init_gui()

        # If for some reason we ask to compare the same snapshot twice, just return True.
        if self._last_valid_snap_path == golden_snap_path:
            return True

        if self._ui.check_screenshot(golden_snap_path):
            self._last_valid_snap_path = golden_snap_path
            return True
        else:
            self._last_valid_snap_path = None
            return False

    def compare_screen_with_text(self, text: str) -> bool:
        # Only this method needs these dependencies, which needs at least one physical backend to
        # be installed. By postponing the imports, we avoid an import error when using only Speculos
        try:
            from PIL import Image, ImageOps, ImageFilter
            from pytesseract import image_to_data, Output
        except ImportError as error:
            raise ImportError(
                "This feature needs at least one physical backend. "
                "Please install ragger[ledgercomm] or ragger[ledgerwallet]") from error

        if self._ui is None:
            return True
        self.init_gui()
        if self._last_valid_snap_path:
            image = Image.open(self._last_valid_snap_path)
            # Nano (s,sp,x) snapshots are white/blue text on black background,
            # tesseract cannot do OCR on these. Invert image so it has
            # dark text on white background.
            if self.device.is_nano:
                image = ImageOps.invert(image)
            image = image.filter(ImageFilter.SHARPEN)
            data = image_to_data(image, output_type=Output.DICT)
            if search(text.strip("^").strip("$"), " ".join(data["text"])):
                return True
            if any(text in item or match(text, item) for item in data["text"]):
                return True
            return False
        else:
            return self._ui.check_text(text)

    def wait_for_home_screen(self, timeout: float = 10.0) -> None:
        return

    def wait_for_screen_change(self, timeout: float = 10.0) -> None:
        return

    def wait_for_text_on_screen(self, text: str, timeout: float = 10.0) -> None:
        return

    def wait_for_text_not_on_screen(self, text: str, timeout: float = 10.0) -> None:
        return

    def get_current_screen_content(self) -> List:
        return list()

    def pause_ticker(self) -> None:
        pass

    def resume_ticker(self) -> None:
        pass

    def send_tick(self) -> None:
        pass
