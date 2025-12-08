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
import sys
from multiprocessing import Process, Queue
from pathlib import Path
from PyQt6.QtCore import QObject, QThread, pyqtSignal
from PyQt6.QtWidgets import QApplication
from typing import Tuple, Any

from .interface import RaggerMainWindow
from ragger.logger import get_gui_logger
from ragger.navigator.instruction import NavInsID

NAVIGATION_ACTIONS = {
    NavInsID.RIGHT_CLICK: "right button",
    NavInsID.LEFT_CLICK: "left button",
    NavInsID.BOTH_CLICK: "both buttons"
}


class ProcessCommunicationWorker(QObject):
    finished = pyqtSignal()
    progress = pyqtSignal(int)

    def __init__(self, queues: Tuple[Queue, Queue], main_window: RaggerMainWindow):
        super().__init__()
        self.logger = get_gui_logger().getChild("CommunicationThread")
        self._queues = queues
        self._main_window = main_window
        self.logger.info("Initiated")

    def _send(self, obj: Any):
        self._queues[1].put(obj)

    def _receive(self) -> Any:
        return self._queues[0].get()

    def run(self):
        self.logger.info("Worker: started")
        while True:
            self.logger.debug("Waiting instruction...")
            command, argument = self._receive()
            if command == "screenshot":
                self.logger.debug("Image received")
                self._main_window.display_screenshot(argument)
            elif command == "text_search":
                self.logger.debug(f"Text search received : '{argument}'")
                self._main_window.display_text_search(argument)
            elif command == "click_action":
                self.logger.debug("Click action required")
                self._main_window.display_action(NAVIGATION_ACTIONS[argument])
            elif command == "touch_action":
                self.logger.debug("Touch action required")
                self._main_window.display_action("touch", *argument)
            elif command == "swipe_left_action":
                self.logger.debug("Swipe left action required")
                self._main_window.display_action("swipe_left", *argument)
            elif command == "swipe_right_action":
                self.logger.debug("Swipe right action required")
                self._main_window.display_action("swipe_right", *argument)
            elif command == "action_done":
                self.logger.debug("Action done")
                self._main_window.action_done()
            elif command == "kill":
                self.logger.debug("Kill object")
                self._main_window.close()

            self.logger.debug("Interface updated")

    def __del__(self):
        self.finished.emit()


class RaggerGUI(Process):

    def __init__(self, device: str, args=None):
        super().__init__(name="RaggerGUI")
        self.thread: QThread
        self.worker: ProcessCommunicationWorker
        self.logger = get_gui_logger().getChild("RaggerGUI")
        self._queues: Tuple[Queue, Queue] = (Queue(), Queue())
        self._device = device
        self.logger.info("Initiated")

    def _send(self, obj: Any):
        self.logger.debug("Sending '%s'", obj)
        self._queues[0].put(obj)

    def _receive(self) -> Any:
        result = self._queues[1].get()
        self.logger.debug("Receiving '%s'", result)
        return result

    def kill(self):
        self.logger.info("Killing the interface and myself")
        self._send(("kill", None))
        if self.is_alive():
            super().kill()

    def check_screenshot(self, image: Path):
        self._send(("screenshot", image))
        return self._receive()

    def check_text(self, text: str):
        self._send(("text_search", text))
        return self._receive()

    def ask_for_click_action(self, ins_id: NavInsID):
        self._send(("click_action", ins_id))
        return self._receive()

    def ask_for_touch_action(self, x: int = 0, y: int = 0):
        self._send(("touch_action", (x, y)))
        return self._receive()

    def ask_for_swipe_action(self, x: int = 0, y: int = 0, direction: str = "left"):
        if direction == "left":
            self._send(("swipe_left_action", (x, y)))
        else:
            self._send(("swipe_right_action", (x, y)))
        return self._receive()

    def _configure_worker(self):
        self.thread = QThread()
        self.worker = ProcessCommunicationWorker(self._queues, self._main_window)
        self.worker.moveToThread(self.thread)
        self.thread.started.connect(self.worker.run)
        self.worker.finished.connect(self.thread.quit)
        self.thread.start()
        self.logger.info("Worker started")

    def _button_cb(self, obj: Any):
        self._queues[1].put(obj)
        self._send(("action_done", ""))

    def run(self):
        self._app = QApplication([])
        self._app.setStyle("Fusion")
        self._main_window = RaggerMainWindow(device=self._device)
        self._main_window.set_button_cb(self._button_cb)
        self._configure_worker()
        self.logger.info("Starting the interface...")
        sys.exit(self._app.exec())
        self.logger.info("Interface ended")
