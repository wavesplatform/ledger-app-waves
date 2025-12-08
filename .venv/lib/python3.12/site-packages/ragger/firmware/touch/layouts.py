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
import logging

from .element import Element

# Center
########


class ChoiceList(Element):

    def choose(self, index: int):
        assert 1 <= index <= 6, "Choice index must be in [1, 6]"
        self.client.finger_touch(*self.positions[index])


class Suggestions(Element):

    def choose(self, index: int):
        assert 1 <= index <= 4, "Suggestion index must be in [1, 4]"
        self.client.finger_touch(*self.positions[index])


# Keyboards
class _GenericKeyboard(Element):

    def write(self, word: str):
        for letter in word.lower():
            logging.info("Writing letter '%s', position '%s'", letter, self.positions[letter])
            self.client.finger_touch(*self.positions[letter])

    def back(self):
        self.client.finger_touch(*self.positions["back"])


class LetterOnlyKeyboard(_GenericKeyboard):
    pass


class _FullKeyboard(_GenericKeyboard):

    def change_layout(self):
        self.client.finger_touch(*self.positions["change_layout"])


class FullKeyboardLetters(_FullKeyboard):

    def change_case(self):
        self.client.finger_touch(*self.positions["change_case"])


class _FullKeyboardSpecialCharacters(_FullKeyboard):

    def more_specials(self):
        self.client.finger_touch(*self.positions["more_specials"])


class FullKeyboardSpecialCharacters1(_FullKeyboardSpecialCharacters):
    pass


class FullKeyboardSpecialCharacters2(_FullKeyboardSpecialCharacters):
    pass


class _TappableElement(Element):

    def tap(self):
        self.client.finger_touch(*self.positions)


# Center Info
class TappableCenter(_TappableElement):
    pass


# Headers
#########
class RightHeader(_TappableElement):
    pass


ExitHeader = RightHeader
InfoHeader = RightHeader


class LeftHeader(_TappableElement):
    pass


NavigationHeader = LeftHeader


# Footers
#########
class CenteredFooter(_TappableElement):
    pass


class LeftFooter(_TappableElement):
    pass


class CancelFooter(_TappableElement):
    pass


ExitFooter = CancelFooter
InfoFooter = CancelFooter
SettingsFooter = CancelFooter
