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
from typing import Dict, Tuple
from ledgered.devices import Device

from ragger.backend import BackendInterface

from .element import Center

from .layouts import CancelFooter, CenteredFooter, ChoiceList, ExitFooter, ExitHeader, \
    FullKeyboardLetters, FullKeyboardSpecialCharacters1, FullKeyboardSpecialCharacters2, \
    InfoFooter, InfoHeader, LeftHeader, LetterOnlyKeyboard, NavigationHeader, RightHeader, \
    SettingsFooter, Suggestions, TappableCenter

from .use_cases import UseCaseHome, UseCaseSettings, UseCaseSubSettings, UseCaseChoice, \
    UseCaseStatus, UseCaseReview, UseCaseViewDetails, UseCaseAddressConfirmation

ELEMENT_PREFIX = "element_"
LAYOUT_PREFIX = "layout_"
USE_CASE_PREFIX = "use_case_"


class MetaScreen(type):
    """
    Creates a class with a constructor automatically instantiating layouts
    and use cases from declared class attributes.

    The goal is to build a representation of a screen in a declarative way.
    Layouts and Use Cases must be declared as attributes of the class, their
    name starting with the prefix `layout_` and `use_case_`. These attributes
    will then be instantiated and stored in the class instance, without their
    prefix.

    For instance, let's imagine an application with an information button
    header, a cancel/quit footer and a keyboard in the center of the screen.
    The declaration of such screen would be:

    .. code-block:: python

        class Screen(metaclass=MetaScreen):
          layout_header = InfoHeader
          layout_keyboard = LetterOnlyKeyboard
          layout_footer = CancelFooter


    When instantiated, the class `Screen` will also instantiate `InfoHeader`,
    `LetterOnlyKeyboard` and `CancelFooter`, and store them as instance
    attributes (after removing the `layout_` prefix).
    They could then be used immediately:


    .. code-block:: python

        screen = Screen(client, device)

        screen.header.tap()             # entering the 'info' view
        screen.footer.tap()             # going out the 'info' view
        screen.keyboard.write("hello")  # writing 'hello' on the keyboard
        screen.footer.tap()             # going out the 'app' view
        try:
            screen.footer.tap()         # quitting the application
        except:
            pass                        # depending on the backend, the application
                                        # stop could raisean error

    (Of course the navigation depends on the current application, so this
    example will not work in most cases).
    """

    def __new__(cls, name: str, parents: Tuple, namespace: Dict):
        elements = {
            key.split(ELEMENT_PREFIX)[1]: namespace.pop(key)
            for key in list(namespace.keys()) if key.startswith(ELEMENT_PREFIX)
        }
        layouts = {
            key.split(LAYOUT_PREFIX)[1]: namespace.pop(key)
            for key in list(namespace.keys()) if key.startswith(LAYOUT_PREFIX)
        }
        use_cases = {
            key.split(USE_CASE_PREFIX)[1]: namespace.pop(key)
            for key in list(namespace.keys()) if key.startswith(USE_CASE_PREFIX)
        }
        original_init = namespace.pop("__init__", lambda *args, **kwargs: None)

        def init(self, client: BackendInterface, device: Device, *args, **kwargs):
            for attribute, cls in elements.items():
                setattr(self, attribute, cls(client, device))
            for attribute, cls in layouts.items():
                setattr(self, attribute, cls(client, device))
            for attribute, cls in use_cases.items():
                setattr(self, attribute, cls(client, device))
            original_init(self, client, device, *args, **kwargs)

        namespace["__init__"] = init
        return super().__new__(cls, name, parents, namespace)


class FullScreen(metaclass=MetaScreen):
    """
    This screen embeds every possible clickable layout and use case.
    It could be used to manipulate any Stax application, at the cost of
    using an imprecise, unpersonalized and in way wrong representation of the
    application's screen. Still, it could prove handy for fast testing.
    """

    def __init__(self, backend: BackendInterface, device: Device):
        pass

    # Type declaration to please mypy checks
    center: Center
    right_header: RightHeader
    exit_header: ExitHeader
    info_header: InfoHeader
    left_header: LeftHeader
    navigation_header: NavigationHeader
    choice_list: ChoiceList
    suggestions: Suggestions
    tappable_center: TappableCenter
    letter_only_keyboard: LetterOnlyKeyboard
    full_keyboard_letters: FullKeyboardLetters
    full_keyboard_special_characters_1: FullKeyboardSpecialCharacters1
    full_keyboard_special_characters_2: FullKeyboardSpecialCharacters2
    centered_footer: CenteredFooter
    cancel_footer: CancelFooter
    exit_footer: ExitFooter
    info_footer: InfoFooter
    settings_footer: SettingsFooter
    home: UseCaseHome
    settings: UseCaseSettings
    sub_settings: UseCaseSubSettings
    choice: UseCaseChoice
    status: UseCaseStatus
    review: UseCaseReview
    view_details: UseCaseViewDetails
    address_confirmation: UseCaseAddressConfirmation

    element_center = Center
    # possible headers
    layout_right_header = RightHeader
    layout_exit_header = ExitHeader
    layout_info_header = InfoHeader
    layout_left_header = LeftHeader
    layout_navigation_header = NavigationHeader
    # possible centers
    layout_choice_list = ChoiceList
    layout_suggestions = Suggestions
    layout_tappable_center = TappableCenter
    layout_letter_only_keyboard = LetterOnlyKeyboard
    layout_full_keyboard_letters = FullKeyboardLetters
    layout_full_keyboard_special_characters_1 = FullKeyboardSpecialCharacters1
    layout_full_keyboard_special_characters_2 = FullKeyboardSpecialCharacters2
    # possible footers
    layout_centered_footer = CenteredFooter
    layout_cancel_footer = CancelFooter
    layout_exit_footer = ExitFooter
    layout_info_footer = InfoFooter
    layout_settings_footer = SettingsFooter
    # possible use cases
    use_case_home = UseCaseHome
    use_case_settings = UseCaseSettings
    use_case_sub_settings = UseCaseSubSettings
    use_case_choice = UseCaseChoice
    use_case_status = UseCaseStatus
    use_case_review = UseCaseReview
    use_case_view_details = UseCaseViewDetails
    use_case_address_confirmation = UseCaseAddressConfirmation
