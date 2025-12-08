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
try:
    from .process import RaggerGUI
except ImportError as e:
    # Can be 'QtCore' or 'QtWidgets'
    if e.name is None or not e.name.startswith("Qt"):
        raise e

    def RaggerGUI(*args, **kwatgs):  # type: ignore
        raise ImportError(
            "This feature needs PyQt6. Please install this package (run `pip install pyqt6`)")


__all__ = ["RaggerGUI"]
