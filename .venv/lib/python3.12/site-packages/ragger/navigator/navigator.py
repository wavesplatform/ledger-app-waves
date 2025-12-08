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
from abc import ABC
from pathlib import Path
from tempfile import NamedTemporaryFile
from time import time
from typing import Callable, Dict, Optional, Sequence, Union
from ledgered.devices import Device

from ragger.backend import BackendInterface, SpeculosBackend
from ragger.utils import Crop

from .instruction import BaseNavInsID, NavIns, NavInsID

LAST_SCREEN_UPDATE_TIMEOUT = 2
InstructionType = Union[NavIns, BaseNavInsID]


class Navigator(ABC):

    GOLDEN_INSTRUCTION_SLEEP_MULTIPLIER_FIRST = 2
    GOLDEN_INSTRUCTION_SLEEP_MULTIPLIER_MIDDLE = 5
    GOLDEN_INSTRUCTION_SLEEP_MULTIPLIER_LAST = 2

    def __init__(self,
                 backend: BackendInterface,
                 device: Device,
                 callbacks: Dict[BaseNavInsID, Callable],
                 golden_run: bool = False):
        """Initializes the Backend

        :param backend: Which Backend will be managed
        :type backend: BackendInterface
        :param device: Which Device will be managed
        :type device: Device
        :param callbacks: Callbacks to use to navigate
        :type callbacks: Device
        :param golden_run: Allows to generate golden snapshots
        :type golden_run: bool
        """
        self._backend = backend
        self._device = device
        self._callbacks = callbacks
        self._golden_run = golden_run

    def _get_snaps_dir_path(self, path: Path, test_case_name: Union[Path, str],
                            is_golden: bool) -> Path:
        if is_golden:
            subdir = "snapshots"
        else:
            subdir = "snapshots-tmp"
        return path / subdir / self._device.name / test_case_name

    def _check_snaps_dir_path(self, path: Path, test_case_name: Union[Path, str],
                              is_golden: bool) -> Path:
        dir_path = self._get_snaps_dir_path(path, test_case_name, is_golden)
        if not dir_path.is_dir():
            if self._golden_run:
                dir_path.mkdir(parents=True)
            else:
                raise ValueError(f"Golden snapshots directory ({dir_path}) does not exist.")
        return dir_path

    def _init_snaps_temp_dir(self,
                             path: Path,
                             test_case_name: Union[Path, str],
                             start_idx: int = 0) -> Path:
        snaps_tmp_path = self._get_snaps_dir_path(path, test_case_name, False)
        if snaps_tmp_path.exists():
            for file in snaps_tmp_path.iterdir():
                # Remove all files in format "index.png" with index >= start_idx
                if not file.name.endswith(".png"):
                    continue
                file_idx_str = file.name.replace(".png", "")
                if not file_idx_str.isnumeric():
                    continue
                file_idx = int(file_idx_str)
                if file_idx >= start_idx:
                    file.unlink()
        else:
            snaps_tmp_path.mkdir(parents=True)
        return snaps_tmp_path

    def _get_snap_path(self, path: Path, index: int) -> Path:
        return path / f"{str(index).zfill(5)}.png"

    def _compare_snap_with_timeout(self,
                                   path: Path,
                                   timeout_s: float = 5.0,
                                   crop: Optional[Crop] = None,
                                   tmp_snap_path: Optional[Path] = None) -> bool:
        start = time()
        now = start
        while not (now - start > timeout_s):
            if self._backend.compare_screen_with_snapshot(path, crop, tmp_snap_path=tmp_snap_path):
                return True
            now = time()
        return False

    def _compare_snap(self, snaps_tmp_path: Path, snaps_golden_path: Path, index: int):
        golden = self._get_snap_path(snaps_golden_path, index)
        tmp = self._get_snap_path(snaps_tmp_path, index)

        assert self._backend.compare_screen_with_snapshot(
            golden, tmp_snap_path=tmp,
            golden_run=self._golden_run), f"Screen does not match golden '{tmp}'"

    def add_callback(self, ins_id: BaseNavInsID, callback: Callable, override: bool = True) -> None:
        """
        Register a new callback.

        :param ins_id: The navigation instruction ID which will trigger the callback
        :type ins_id: BaseNavInsID
        :param callback: The callback to call
        :type callback: Callable
        :param override: Replace an existing callback if the navigation instruction ID already
                         exists. Defaults to `True`
        :type override: bool

        :raises KeyError: If the navigation instruction ID already exists and `override` is set to
                          False

        :return: None
        :rtype: NoneType
        """
        if not override and ins_id in self._callbacks:
            raise KeyError(f"Navigation instruction ID '{ins_id}' already exists in the "
                           "registered callbacks")
        self._callbacks[ins_id] = callback

    def _run_instruction(self,
                         instruction: InstructionType,
                         timeout: float = 10.0,
                         wait_for_screen_change: bool = True,
                         path: Optional[Path] = None,
                         test_case_name: Optional[Union[Path, str]] = None,
                         snap_idx: int = 0) -> None:
        if isinstance(instruction, BaseNavInsID):
            instruction = NavIns(instruction)
        if instruction.id not in self._callbacks:
            raise NotImplementedError(f"No callback registered for instruction ID {instruction.id}")

        if instruction.id == NavInsID.USE_CASE_REVIEW_CONFIRM:
            # Specific handling due to the fact that the screen is updated multiple
            # time with a progress bar during this instruction callback execution.
            # Indeed, this progress bar implies a screen change with previous screen
            # content known by the backend.
            # Therefore simply calling wait_for_screen_change() here will result in
            # race issues.
            # That's why we are first backuping the screen content in a temp file.
            # This screen content is then used to check if the screen changed enough,
            # e.g. with cropping the progress bar from the screen.
            with NamedTemporaryFile(suffix='.png') as tmp:
                tmp_file = Path(tmp.name)
                # Backup screen content before instruction in tmp file
                self._backend.compare_screen_with_snapshot(tmp_file,
                                                           tmp_snap_path=tmp_file,
                                                           golden_run=True)

                # Call instruction callback
                self._callbacks[instruction.id](*instruction.args, **instruction.kwargs)

                # Wait for screen change unless explicitly specify otherwise
                if wait_for_screen_change:
                    # Compare to previous backup file without considering the bottom
                    # which holds the progress bar.
                    cropping = Crop(lower=220)
                    endtime = time() + timeout
                    while True:
                        self._backend.wait_for_screen_change(endtime - time())
                        if not self._backend.compare_screen_with_snapshot(tmp_file, cropping):
                            break

        else:
            # Call instruction callback
            self._callbacks[instruction.id](*instruction.args, **instruction.kwargs)

            # Wait for screen change unless explicitly specify otherwise
            if wait_for_screen_change:
                if instruction.id in [
                        NavInsID.WAIT_FOR_SCREEN_CHANGE, NavInsID.WAIT_FOR_HOME_SCREEN,
                        NavInsID.WAIT_FOR_TEXT_ON_SCREEN, NavInsID.WAIT_FOR_TEXT_NOT_ON_SCREEN
                ]:
                    # Function wait_for_screen_change() is already called during
                    # instruction callback execution above.
                    pass
                else:
                    self._backend.wait_for_screen_change(timeout)

        # Compare snap with golden reference
        if path and test_case_name:
            if snap_idx == 0:
                snaps_tmp_path = self._init_snaps_temp_dir(path, test_case_name)
                snaps_golden_path = self._check_snaps_dir_path(path, test_case_name, True)
            else:
                snaps_tmp_path = self._get_snaps_dir_path(path, test_case_name, False)
                snaps_golden_path = self._get_snaps_dir_path(path, test_case_name, True)

            self._compare_snap(snaps_tmp_path, snaps_golden_path, snap_idx)

    def navigate_and_compare(self,
                             path: Optional[Path],
                             test_case_name: Optional[Union[Path, str]],
                             instructions: Sequence[InstructionType],
                             timeout: float = 10.0,
                             screen_change_before_first_instruction: bool = True,
                             screen_change_after_last_instruction: bool = True,
                             snap_start_idx: int = 0) -> None:
        """
        Navigate on the device according to a set of navigation instructions
        provided then compare each step snapshot with "golden images".

        :param path: Absolute path to the snapshots directory.
        :type path: Optional[Path]
        :param test_case_name: Relative path to the test case snapshots directory (from path).
        :type test_case_name: Optional[Union[Path, str]]
        :param instructions: Set of navigation instructions. Navigation instruction IDs are also
                             accepted.
        :type instructions: Sequence[Union[NavIns, BaseNavInsID]]
        :param timeout: Timeout for each navigation step.
        :type timeout: int
        :param screen_change_before_first_instruction: Wait for a screen change before first
                                                       instruction, like a confirmation screen
                                                       triggered through APDUs.
        :type screen_change_before_first_instruction: bool
        :param screen_change_after_last_instruction: Wait for a screen change after last instruction.
        :type screen_change_after_last_instruction: bool
        :param snap_start_idx: Index of the first snap for this navigation.
        :type snap_start_idx: int

        :raises ValueError: If one of the snapshots does not match.

        :return: None
        :rtype: NoneType
        """

        self._backend.pause_ticker()

        # Navigation initialization: no-op instruction to:
        # - wait for screen change depending on screen_change_before_first_instruction.
        #   this is necessary:
        #   - when an APDU was just sent and we want to make sure the screen already
        #     displays the first review page.
        #   - when called to finish the execution of a navigate_until_text() call.
        # - compare the initial screen content with the golden reference if path and
        #   test_case_name are valid.
        self._run_instruction(NavIns(NavInsID.WAIT, (0, )),
                              timeout,
                              wait_for_screen_change=screen_change_before_first_instruction,
                              path=path,
                              test_case_name=test_case_name,
                              snap_idx=snap_start_idx)

        for idx, instruction in enumerate(instructions, start=1):
            if idx != len(instructions) or screen_change_after_last_instruction:
                # Nominal case, either:
                # - middle instruction
                # - last instruction but with screen_change_after_last_instruction=True
                # => wait_for_screen_change()
                # => screenshot comparison if path and test_case_name are valid
                self._run_instruction(instruction,
                                      timeout,
                                      wait_for_screen_change=True,
                                      path=path,
                                      test_case_name=test_case_name,
                                      snap_idx=snap_start_idx + idx)
            else:
                # Last instruction case with screen_change_after_last_instruction=False
                # => no wait_for_screen_change()
                # => no screenshot comparison
                self._run_instruction(instruction,
                                      timeout,
                                      wait_for_screen_change=False,
                                      snap_idx=snap_start_idx + idx)

        self._backend.resume_ticker()

    def navigate(self,
                 instructions: Sequence[InstructionType],
                 timeout: float = 10.0,
                 screen_change_before_first_instruction: bool = True,
                 screen_change_after_last_instruction: bool = True) -> None:
        """
        Navigate on the device according to a set of navigation instructions provided.

        :param instructions: Set of navigation instructions. Navigation instruction IDs are also
                             accepted, and will be converted into navigation instruction (without
                             any argument)
        :type instructions: Sequence[Union[NavIns, BaseNavInsID]]
        :param timeout: Timeout for each navigation step.
        :type timeout: int
        :param screen_change_before_first_instruction: Wait for a screen change before first
                                                       instruction, like a confirmation screen
                                                       triggered through APDUs.
        :type screen_change_before_first_instruction: bool
        :param screen_change_after_last_instruction: Wait for a screen change after last instruction.
        :type screen_change_after_last_instruction: bool
        :param snap_start_idx: Index of the first snap for this navigation.
        :type snap_start_idx: int

        :raises NotImplementedError: If the navigation instruction is not implemented.

        :return: None
        :rtype: NoneType
        """
        self.navigate_and_compare(
            path=None,
            test_case_name=None,
            instructions=instructions,
            timeout=timeout,
            screen_change_before_first_instruction=screen_change_before_first_instruction,
            screen_change_after_last_instruction=screen_change_after_last_instruction)

    def navigate_until_snap(self,
                            navigate_instruction: InstructionType,
                            validation_instruction: InstructionType,
                            path: Path,
                            test_case_name: Union[Path, str],
                            start_img_name: str,
                            last_img_name: str,
                            take_snaps: bool = True,
                            timeout: int = 30,
                            crop_first: Optional[Crop] = None,
                            crop_last: Optional[Crop] = None) -> int:
        """
        Navigate until snapshot is found.

        This method may be left void on backends connecting to physical devices,
        where a physical interaction must be performed instead.
        This will prevent the instrumentation to fail (the void method won't
        raise `NotImplementedError`), but the instrumentation flow will probably
        get stuck (on further call to `receive` for instance) until the expected
        action is performed on the device.

        :param navigate_instruction: Navigation instruction to be performed until last snapshot is found.
                                     Navigation instruction ID is also accepted.
        :type navigate_instruction: Union[NavIns, BaseNavInsID]
        :param validation_instruction: Navigation instruction to be performed once last snapshot is found.
                                       Navigation instruction ID is also accepted.
        :type validation_instruction: Union[NavIns, BaseNavInsID]
        :param path: Absolute path to the snapshots directory.
        :type path: Path
        :param test_case_name: Relative path to the test case snapshots directory (from path).
        :type test_case_name: Union[Path, str]
        :param start_img_name: Name of the first snapshot of the navigation flow.
        :type start_img_name: str
        :param last_img_name: Name of the snapshot to look for when navigating.
        :type last_img_name: str
        :param take_snaps: Take temporary snapshots of the screen displayed when navigating.
        :type take_snaps: bool
        :param timeout: Timeout of the navigation loop if last snapshot is not found.
        :type timeout: int
        :param crop_first: Crop (left, upper, right or lower pixels) first snapshot image for comparison
                           (useful if using a generic snapshot).
        :type crop_first: Crop
        :param crop_last: Crop (left, upper, right or lower pixels) last snapshot image for comparison
                          (useful if using a generic snapshot).
        :type crop_last: Crop

        :return: img_idx
        :rtype: int
        """

        if not isinstance(self._backend, SpeculosBackend):
            # When not using Speculos backend, taking snapshots is not possible
            # therefore comparison is not possible too.
            # TODO request user to interact with the device.
            return 0

        snaps_golden_path = self._check_snaps_dir_path(path, test_case_name, True)
        snaps_tmp_path = self._init_snaps_temp_dir(path, test_case_name)

        img_idx = 0
        first_golden_snap = snaps_golden_path / start_img_name
        last_golden_snap = snaps_golden_path / last_img_name

        # Take snapshots if required.
        if take_snaps:
            tmp_snap_path = self._get_snap_path(snaps_tmp_path, img_idx)
        else:
            tmp_snap_path = None

        # Check if the first snapshot is found before going in the navigation loop.
        # It saves time in non-nominal cases where the navigation flow does not start.
        if self._compare_snap_with_timeout(first_golden_snap,
                                           timeout_s=2,
                                           crop=crop_first,
                                           tmp_snap_path=tmp_snap_path):
            start = time()
            # Navigate until the last snapshot specified in argument is found.
            while True:
                if take_snaps:
                    # Take snapshots if required.
                    tmp_snap_path = self._get_snap_path(snaps_tmp_path, img_idx)

                if self._compare_snap_with_timeout(last_golden_snap,
                                                   timeout_s=0.5,
                                                   crop=crop_last,
                                                   tmp_snap_path=tmp_snap_path):
                    break

                now = time()
                # Global navigation loop timeout in case the snapshot is never found.
                if (now - start > timeout):
                    raise TimeoutError(f"Timeout waiting for snap {last_golden_snap}")

                # Go to the next screen.
                self._run_instruction(navigate_instruction, wait_for_screen_change=False)
                img_idx += 1

            # Validation action when last snapshot is found.
            self._run_instruction(validation_instruction, wait_for_screen_change=False)

            # Make sure there is a screen update after the final action.
            start = time()
            while self._compare_snap_with_timeout(last_golden_snap, timeout_s=0.5, crop=crop_last):
                now = time()
                if (now - start > LAST_SCREEN_UPDATE_TIMEOUT):
                    raise TimeoutError(
                        f"Timeout waiting for screen change after last snapshot : {last_golden_snap}"
                    )
        else:
            raise ValueError(f"Could not find first snapshot {first_golden_snap}")
        return img_idx

    def navigate_until_text_and_compare(self,
                                        navigate_instruction: InstructionType,
                                        validation_instructions: Sequence[InstructionType],
                                        text: str,
                                        path: Optional[Path] = None,
                                        test_case_name: Optional[Union[Path, str]] = None,
                                        timeout: int = 300,
                                        screen_change_before_first_instruction: bool = True,
                                        screen_change_after_last_instruction: bool = True,
                                        snap_start_idx: int = 0) -> None:
        """
        Navigate until some text is found on the screen content displayed then
        compare each step snapshot with "golden images".

        This method may be left void on backends connecting to physical devices,
        where a physical interaction must be performed instead.
        This will prevent the instrumentation to fail (the void method won't
        raise `NotImplementedError`), but the instrumentation flow will probably
        get stuck (on further call to `receive` for instance) until the expected
        action is performed on the device.

        :param path: Absolute path to the snapshots directory.
        :type path: Optional[Path]
        :param test_case_name: Relative path to the test case snapshots directory (from path).
        :type test_case_name: Optional[Union[Path, str]]
        :param navigate_instruction: Navigation instruction to be performed until the text is found.
                                     Navigation instruction ID is also accepted.
        :type navigate_instruction: Union[NavIns, BaseNavInsID]
        :param validation_instructions: Navigation instructions to be performed once the text is found.
                                        Navigation instruction IDs are also accepted.
        :type validation_instructions: Sequence[Union[NavIns, BaseNavInsID]]
        :param text: Text string to look for.
        :type text: str
        :param timeout: Timeout for the whole navigation loop.
        :type timeout: int
        :param screen_change_before_first_instruction: Wait for a screen change before first instruction.
        :type screen_change_before_first_instruction: bool
        :param screen_change_after_last_instruction: Wait for a screen change after last instruction.
        :type screen_change_after_last_instruction: bool
        :param snap_start_idx: Index of the first snap for this navigation.
        :type snap_start_idx: int

        :raises TimeoutError: If the text is not found.

        :return: None
        :rtype: NoneType
        """
        idx = snap_start_idx
        start = time()
        if not isinstance(self._backend, SpeculosBackend):
            # Update timeout default value for other backends. User needs time to
            # to perform actions.
            if timeout == 30:
                timeout = 200

        self._backend.pause_ticker()

        # Navigation initialization: no-op instruction to:
        # - wait for screen change depending on screen_change_before_first_instruction.
        #   this is necessary when an APDU was just sent and we want to make sure the
        #   screen already displays the first review page.
        # - compare the initial screen content with the golden reference if path and
        #   test_case_name are valid.
        self._run_instruction(NavIns(NavInsID.WAIT, (0, )),
                              timeout,
                              wait_for_screen_change=screen_change_before_first_instruction,
                              path=path,
                              test_case_name=test_case_name,
                              snap_idx=idx)

        # Navigate until the text specified in argument is found.
        while True:
            if self._backend.compare_screen_with_text(text):
                # Validation screen text found, exit the loop
                break
            else:
                # Global navigation loop timeout in case the text is never found.
                remaining = timeout - (time() - start)
                if (remaining < 0):
                    raise TimeoutError(f"Timeout waiting for text {text}")

                # Go to the next screen.
                idx += 1
                self._run_instruction(navigate_instruction,
                                      remaining,
                                      wait_for_screen_change=True,
                                      path=path,
                                      test_case_name=test_case_name,
                                      snap_idx=idx)

        # Perform navigation validation instructions in an "navigate_and_compare" way.
        if validation_instructions:
            remaining = timeout - (time() - start)
            self.navigate_and_compare(
                path,
                test_case_name,
                validation_instructions,
                timeout=remaining,
                screen_change_before_first_instruction=False,
                screen_change_after_last_instruction=screen_change_after_last_instruction,
                snap_start_idx=idx)

        self._backend.resume_ticker()

    def navigate_until_text(self,
                            navigate_instruction: InstructionType,
                            validation_instructions: Sequence[InstructionType],
                            text: str,
                            timeout: int = 300,
                            screen_change_before_first_instruction: bool = True,
                            screen_change_after_last_instruction: bool = True,
                            snap_start_idx: int = 0) -> None:
        """
        Navigate until some text is found on the screen content displayed.

        This method may be left void on backends connecting to physical devices,
        where a physical interaction must be performed instead.
        This will prevent the instrumentation to fail (the void method won't
        raise `NotImplementedError`), but the instrumentation flow will probably
        get stuck (on further call to `receive` for instance) until the expected
        action is performed on the device.

        :param navigate_instruction: Navigation instruction to be performed until the text is found.
                                     Navigation instruction ID is also accepted.
        :type navigate_instruction: Union[NavIns, BaseNavInsID]
        :param validation_instructions: Navigation instructions to be performed once the text is found.
                                        Navigation instruction IDs are also accepted.
        :type validation_instructions: Sequence[Union[NavIns, BaseNavInsID]]
        :param text: Text string to look for.
        :type text: str
        :param timeout: Timeout for the whole navigation loop.
        :type timeout: int
        :param screen_change_before_first_instruction: Wait for a screen change before first instruction.
        :type screen_change_before_first_instruction: bool
        :param screen_change_after_last_instruction: Wait for a screen change after last instruction.
        :type screen_change_after_last_instruction: bool
        :param snap_start_idx: Index of the first snap for this navigation.
        :type snap_start_idx: int

        :raises TimeoutError: If the text is not found.

        :return: None
        :rtype: NoneType
        """
        self.navigate_until_text_and_compare(navigate_instruction,
                                             validation_instructions,
                                             text,
                                             None,
                                             None,
                                             timeout,
                                             screen_change_before_first_instruction,
                                             screen_change_after_last_instruction,
                                             snap_start_idx=snap_start_idx)
