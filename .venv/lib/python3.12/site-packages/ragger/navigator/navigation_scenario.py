from pathlib import Path
from typing import Optional, Sequence
from enum import Enum, auto
from ledgered.devices import Device

from ragger.backend import BackendInterface
from .navigator import InstructionType, Navigator, NavInsID
from ragger.backend.interface import GraphicalLibrary


class UseCase(Enum):
    TX_REVIEW = auto()
    ADDRESS_CONFIRMATION = auto()


class NavigationScenarioData:
    navigation: NavInsID
    validation: Sequence[InstructionType]
    dismiss_warning: Sequence[InstructionType]
    pattern: str = ""

    def __init__(self,
                 device: Device,
                 backend: BackendInterface,
                 use_case: UseCase,
                 approve: bool,
                 nb_warnings: int = 1):
        if device.is_nano:
            self.navigation = NavInsID.RIGHT_CLICK
            self.validation = [NavInsID.BOTH_CLICK]

            if backend.sdk_graphics == GraphicalLibrary.BAGL:
                self.dismiss_warning = [NavInsID.RIGHT_CLICK] * nb_warnings
                # Legacy navigation scenario when running an App compiled with bagl sdk library
                self.pattern = r"^(Accept risk|Accept|Approve|Sign|Confirm)$" if approve else r"^(Cancel|Reject)$"
            else:
                self.dismiss_warning = []
                self.dismiss_warning += [NavInsID.RIGHT_CLICK] * (nb_warnings - 1)
                self.dismiss_warning += [NavInsID.BOTH_CLICK]
                # navigation scenario when running an App compiled with nbgl sdk library
                if use_case == UseCase.ADDRESS_CONFIRMATION:
                    self.pattern = r"^(Accept risk|Accept|Approve|Sign|Confirm)$" if approve else r"^(Cancel|Reject)$"
                elif use_case == UseCase.TX_REVIEW:
                    if approve:
                        # Matches:
                        #  - "Accept risk and "
                        #  - "Accept risk and sign [transaction/message/operation]"
                        #  - "Sign [transaction/message/operation]"
                        blind_sign_pattern = r"(Accept risk and (sign (transaction|message|operation))?)"
                        clear_sign_pattern = r"(Sign (transaction|message|operation))"
                        self.pattern = rf"^({blind_sign_pattern}|{clear_sign_pattern})$"
                    else:
                        # Matches:
                        # "Reject"
                        # "Reject transaction"
                        # "Reject message"
                        # "Reject operation"
                        self.pattern = r"^(Reject( (transaction|message|operation))?)$"
                else:
                    raise NotImplementedError("Unknown use case")

        elif device.touchable:
            self.navigation = NavInsID.SWIPE_CENTER_TO_LEFT
            self.dismiss_warning = [NavInsID.USE_CASE_CHOICE_REJECT] * nb_warnings

            if use_case == UseCase.ADDRESS_CONFIRMATION:
                if approve:
                    self.validation = [NavInsID.USE_CASE_ADDRESS_CONFIRMATION_CONFIRM]
                else:
                    self.validation = [NavInsID.USE_CASE_ADDRESS_CONFIRMATION_CANCEL]
                self.pattern = "^Confirm$"

            elif use_case == UseCase.TX_REVIEW:
                if approve:
                    self.validation = [NavInsID.USE_CASE_REVIEW_CONFIRM]
                else:
                    self.validation = [
                        NavInsID.USE_CASE_REVIEW_REJECT, NavInsID.USE_CASE_CHOICE_CONFIRM
                    ]
                self.pattern = "^Hold to sign$"

            else:
                raise NotImplementedError("Unknown use case")

            # Dismiss the result modal in all cases
            self.validation += [NavInsID.USE_CASE_STATUS_DISMISS]

        else:
            raise NotImplementedError("Unknown device")


class NavigateWithScenario:

    def __init__(self, backend: BackendInterface, navigator: Navigator, device: Device,
                 test_name: str, screenshot_path: Path):
        self.navigator = navigator
        self.device = device
        self.backend = backend
        self.test_name = test_name
        self.screenshot_path = screenshot_path

    def _navigate_with_scenario(self,
                                scenario: NavigationScenarioData,
                                path: Optional[Path] = None,
                                test_name: Optional[str] = None,
                                custom_screen_text: Optional[str] = None,
                                do_comparison: bool = True):
        if custom_screen_text is not None:
            scenario.pattern = custom_screen_text

        if do_comparison:
            self.navigator.navigate_until_text_and_compare(
                navigate_instruction=scenario.navigation,
                validation_instructions=scenario.validation,
                text=scenario.pattern,
                path=path if path else self.screenshot_path,
                test_case_name=test_name if test_name else self.test_name)
        else:
            self.navigator.navigate_until_text(navigate_instruction=scenario.navigation,
                                               validation_instructions=scenario.validation,
                                               text=scenario.pattern)

    def _navigate_warning(self,
                          scenario: NavigationScenarioData,
                          test_name: Optional[str] = None,
                          do_comparison: bool = True,
                          warning_path: str = "warning"):
        if do_comparison:
            self.navigator.navigate_and_compare(
                self.screenshot_path,
                f"{test_name if test_name else self.test_name}/{warning_path}",
                scenario.dismiss_warning,
                screen_change_after_last_instruction=False)
        else:
            self.navigator.navigate(scenario.dismiss_warning,
                                    screen_change_after_last_instruction=False)

    def review_approve(self,
                       path: Optional[Path] = None,
                       test_name: Optional[str] = None,
                       custom_screen_text: Optional[str] = None,
                       do_comparison: bool = True):
        scenario = NavigationScenarioData(self.device, self.backend, UseCase.TX_REVIEW, True)
        self._navigate_with_scenario(scenario, path, test_name, custom_screen_text, do_comparison)

    def review_approve_with_warning(self,
                                    path: Optional[Path] = None,
                                    test_name: Optional[str] = None,
                                    custom_screen_text: Optional[str] = None,
                                    do_comparison: bool = True,
                                    warning_path: str = "warning",
                                    nb_warnings: int = 1):
        scenario = NavigationScenarioData(self.device, self.backend, UseCase.TX_REVIEW, True,
                                          nb_warnings)
        self._navigate_warning(scenario, test_name, do_comparison, warning_path)
        self._navigate_with_scenario(scenario, path, test_name, custom_screen_text, do_comparison)

    def review_reject(self,
                      path: Optional[Path] = None,
                      test_name: Optional[str] = None,
                      custom_screen_text: Optional[str] = None,
                      do_comparison: bool = True):
        scenario = NavigationScenarioData(self.device, self.backend, UseCase.TX_REVIEW, False)
        self._navigate_with_scenario(scenario, path, test_name, custom_screen_text, do_comparison)

    def review_reject_with_warning(self,
                                   path: Optional[Path] = None,
                                   test_name: Optional[str] = None,
                                   custom_screen_text: Optional[str] = None,
                                   do_comparison: bool = True,
                                   warning_path: str = "warning",
                                   nb_warnings: int = 1):
        scenario = NavigationScenarioData(self.device, self.backend, UseCase.TX_REVIEW, False,
                                          nb_warnings)
        self._navigate_warning(scenario, test_name, do_comparison, warning_path)
        self._navigate_with_scenario(scenario, path, test_name, custom_screen_text, do_comparison)

    def address_review_approve(self,
                               path: Optional[Path] = None,
                               test_name: Optional[str] = None,
                               custom_screen_text: Optional[str] = None,
                               do_comparison: bool = True):
        scenario = NavigationScenarioData(self.device, self.backend, UseCase.ADDRESS_CONFIRMATION,
                                          True)
        self._navigate_with_scenario(scenario, path, test_name, custom_screen_text, do_comparison)

    def address_review_reject(self,
                              path: Optional[Path] = None,
                              test_name: Optional[str] = None,
                              custom_screen_text: Optional[str] = None,
                              do_comparison: bool = True):
        scenario = NavigationScenarioData(self.device, self.backend, UseCase.ADDRESS_CONFIRMATION,
                                          False)
        self._navigate_with_scenario(scenario, path, test_name, custom_screen_text, do_comparison)
