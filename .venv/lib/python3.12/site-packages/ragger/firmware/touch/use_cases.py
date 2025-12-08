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
from .element import Element


class UseCaseHome(Element):

    def info(self):
        self.client.finger_touch(*self.positions["info"])

    def settings(self):
        self.client.finger_touch(*self.positions["settings"])

    def quit(self):
        self.client.finger_touch(*self.positions["quit"])


class UseCaseHomeExt(UseCaseHome):

    def action(self):
        self.client.finger_touch(*self.positions["action"])


class UseCaseSettings(Element):

    def single_page_exit(self):
        self.client.finger_touch(*self.positions["single_page_exit"])

    def multi_page_exit(self):
        self.client.finger_touch(*self.positions["multi_page_exit"])

    def previous(self):
        self.client.finger_touch(*self.positions["previous"])

    def next(self):
        self.client.finger_touch(*self.positions["next"])


class UseCaseSubSettings(Element):

    def exit(self):
        self.client.finger_touch(*self.positions["exit"])

    def previous(self):
        self.client.finger_touch(*self.positions["previous"])

    def next(self):
        self.client.finger_touch(*self.positions["next"])


class UseCaseChoice(Element):

    def confirm(self):
        self.client.finger_touch(*self.positions["confirm"])

    def reject(self):
        self.client.finger_touch(*self.positions["reject"])


class UseCaseStatus(Element):

    def dismiss(self):
        self.client.finger_touch(*self.positions["dismiss"])


class UseCaseReview(Element):

    def tap(self):
        self.client.finger_touch(*self.positions["tap"])

    def previous(self):
        self.client.finger_touch(*self.positions["previous"])

    def reject(self):
        self.client.finger_touch(*self.positions["reject"])

    def confirm(self):
        # SDK needs at least 2.4s for long press.
        self.client.finger_touch(*self.positions["confirm"], 3.0)


class UseCaseViewDetails(Element):

    def exit(self):
        self.client.finger_touch(*self.positions["exit"])

    def previous(self):
        self.client.finger_touch(*self.positions["previous"])

    def next(self):
        self.client.finger_touch(*self.positions["next"])


class UseCaseAddressConfirmation(Element):

    def tap(self):
        self.client.finger_touch(*self.positions["tap"])

    def exit_qr(self):
        self.client.finger_touch(*self.positions["exit_qr"])

    def confirm(self):
        self.client.finger_touch(*self.positions["confirm"])

    def cancel(self):
        self.client.finger_touch(*self.positions["cancel"])
