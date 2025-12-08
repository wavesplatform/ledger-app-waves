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
from functools import partial
from pathlib import Path
from PyQt6.QtCore import QRect, Qt, QVariantAnimation
from PyQt6.QtWidgets import QApplication, QWidget, QMainWindow, QLabel, QPushButton, QSizePolicy, \
    QGridLayout, QGraphicsOpacityEffect
from PyQt6.QtGui import QAction, QGuiApplication, QIcon, QPixmap, QFont, QKeyEvent
from typing import Callable

from ragger.logger import get_gui_logger

BUTTON_HEIGHT = 50

# Fatstacks has the bigger screen, so everything is scaled around it
SCREENSHOT_MAX_WIDTH = 400
SCREENSHOT_MAX_HEIGHT = 670
BORDER = 50

WIDTH = SCREENSHOT_MAX_WIDTH + BORDER * 2
HEIGHT = SCREENSHOT_MAX_HEIGHT + BUTTON_HEIGHT + BORDER * 2

INDEX = 4


class RaggerMainWindow(QMainWindow):

    def __init__(self, device: str):
        super().__init__()
        self._devicebody: QLabel
        self._touch: QLabel
        self._swipe_left: QLabel
        self._swipe_right: QLabel
        self._lb: QLabel
        self._rb: QLabel
        self.logger = get_gui_logger().getChild("QWindow")
        self._device = device
        self._init_UI()
        self.logger.info("Initiated")

    def _init_UI(self):
        exitAct = QAction(QIcon('exit.png'), '&Exit', self)
        exitAct.setShortcut('Ctrl+Q')
        exitAct.setStatusTip('Exit application')
        exitAct.triggered.connect(QApplication.quit)
        menubar = self.menuBar()
        fileMenu = menubar.addMenu('&Menu')
        fileMenu.addAction(exitAct)
        self.resize(WIDTH, HEIGHT)
        qr = self.frameGeometry()
        cp = QGuiApplication.primaryScreen().availableGeometry().center()
        qr.moveCenter(cp)
        self.move(qr.topLeft())
        self.setWindowTitle('Ragger - Ledger Nano app automation framework')
        self.setWindowIcon(QIcon('/home/lpascal/repos/tools/ragger/doc/images/ragger.png'))
        self._init_gui_widgets()
        self.show()

    def _bigger(self, screenshot: Path) -> QPixmap:
        return QPixmap(str(screenshot.resolve()))\
            .scaled(SCREENSHOT_MAX_WIDTH, SCREENSHOT_MAX_HEIGHT, Qt.KeepAspectRatio)

    def _init_screenshot(self) -> None:
        self._screenshot = QLabel(self._central_widget)
        self._screenshot.setScaledContents(False)
        self._screenshot.setObjectName("screenshot")
        self._screenshot.setSizePolicy(QSizePolicy.Policy.Expanding, QSizePolicy.Policy.Expanding)
        self._screenshot.setAlignment(Qt.AlignmentFlag.AlignVCenter)
        dict_margin = {
            "nanos": 75,
            "nanox": 90,
            "nanosp": 55,
            "stax": 65,
            "flex": 65,
            "apex_p": 65,
            "apex_m": 65
        }
        margin = dict_margin[self._device]
        self._screenshot.setStyleSheet(f"QLabel {{margin-left: {margin}px;}}")

    def _init_action_hint(self) -> None:
        self._actionhint = QLabel(self._central_widget)
        self._actionhint.setGeometry(QRect(0, 0, SCREENSHOT_MAX_WIDTH, SCREENSHOT_MAX_HEIGHT))
        self._actionhint.setScaledContents(False)
        self._actionhint.setObjectName("action_hint")
        self._actionhint.setSizePolicy(QSizePolicy.Policy.Expanding, QSizePolicy.Policy.Expanding)
        self._actionhint.setAlignment(Qt.AlignmentFlag.AlignCenter)
        custom_font = QFont()
        custom_font.setWeight(30)
        self._actionhint.setFont(custom_font)
        self._actionhint.setText("")
        margin_top = self._devicebody.height() + self._actionhint.fontInfo().pixelSize() + 10
        self._actionhint.setStyleSheet(f"QLabel {{margin-top: {margin_top}px;}}")
        self._actionhint.show()

    def _show_button(self, widget: QWidget, show: bool, x: int = 0, y: int = 0):
        if widget.objectName in [
                self._lb.objectName, self._rb.objectName, self._touch.objectName,
                self._swipe_left.objectName, self._swipe_right.objectName
        ]:
            if show:
                if widget.objectName in [
                        self._touch.objectName, self._swipe_left.objectName,
                        self._swipe_right.objectName
                ]:
                    margin_left = 65 - widget.width() // 2
                    margin_top = 25  # Tip of finger
                    widget.move(x + margin_left, y + margin_top)
                widget.show()
                self._actionhint.show()
            else:
                widget.hide()
                self._actionhint.hide()

    def _init_device_body(self) -> None:
        self._devicebody = QLabel(self._central_widget)
        self._devicebody.setObjectName("device_body")

        bodypath = Path(__file__).parent / "assets" / f"{self._device}_body.png"
        bodypix = QPixmap(str(bodypath))

        self._devicebody.setPixmap(bodypix)
        self._devicebody.setMinimumHeight(bodypix.height())
        self._devicebody.setSizePolicy(QSizePolicy.Policy.Expanding, QSizePolicy.Policy.Expanding)
        self._devicebody.setAlignment(Qt.AlignmentFlag.AlignCenter)

        self._lb = QLabel(self._central_widget)
        self._lb.setScaledContents(False)
        self._lb.setObjectName("left_button")
        self._lb.setPixmap(
            QPixmap(str(Path(__file__).parent / "assets" / f"{self._device}_leftbutton.png")))
        self._lb.setAlignment(Qt.AlignmentFlag.AlignCenter)
        self._lb.hide()

        self._rb = QLabel(self._central_widget)
        self._rb.setScaledContents(False)
        self._rb.setObjectName("right_button")
        self._rb.setPixmap(
            QPixmap(str(Path(__file__).parent / "assets" / f"{self._device}_rightbutton.png")))
        self._rb.setAlignment(Qt.AlignmentFlag.AlignCenter)
        self._rb.hide()

        self._touch = QLabel(self._central_widget)
        self._touch.setScaledContents(False)
        self._touch.setObjectName("touch_location")
        touch_pix = QPixmap(str(Path(__file__).parent / "assets/touch_action.png"))
        self._touch.setGeometry(QRect(0, 0, touch_pix.width(), touch_pix.height()))
        self._touch.setPixmap(touch_pix)
        self._touch.hide()

        self._swipe_left = QLabel(self._central_widget)
        self._swipe_left.setScaledContents(False)
        self._swipe_left.setObjectName("swipe_left")
        swipe_left_pix = QPixmap(str(Path(__file__).parent / "assets/swipe_left_action.png"))
        self._swipe_left.setGeometry(QRect(0, 0, swipe_left_pix.width(), swipe_left_pix.height()))
        self._swipe_left.setPixmap(swipe_left_pix)
        self._swipe_left.hide()

        self._swipe_right = QLabel(self._central_widget)
        self._swipe_right.setScaledContents(False)
        self._swipe_right.setObjectName("swipe_right")
        swipe_right_pix = QPixmap(str(Path(__file__).parent / "assets/swipe_right_action.png"))
        self._swipe_right.setGeometry(QRect(0, 0, swipe_right_pix.width(),
                                            swipe_right_pix.height()))
        self._swipe_right.setPixmap(swipe_right_pix)
        self._swipe_right.hide()

    def _init_device_buttons_effect(self) -> None:
        self.effects = []
        effect = QGraphicsOpacityEffect()
        self._lb.setGraphicsEffect(effect)
        self.effects.append(effect)

        effect = QGraphicsOpacityEffect()
        self._rb.setGraphicsEffect(effect)
        self.effects.append(effect)

        effect = QGraphicsOpacityEffect()
        self._touch.setGraphicsEffect(effect)
        self.effects.append(effect)

        effect = QGraphicsOpacityEffect()
        self._swipe_left.setGraphicsEffect(effect)
        self.effects.append(effect)

        effect = QGraphicsOpacityEffect()
        self._swipe_right.setGraphicsEffect(effect)
        self.effects.append(effect)

        effect = QGraphicsOpacityEffect()
        self._actionhint.setGraphicsEffect(effect)
        self.effects.append(effect)

        self.animation = QVariantAnimation(self)
        self.animation.setDuration(1500)
        self.animation.setStartValue(0.)
        self.animation.setKeyValueAt(0.5, 1.0)
        self.animation.setEndValue(0.)
        self.animation.setLoopCount(-1)
        self.animation.valueChanged.connect(self._update_buttons_opacity)
        self.animation.start()

    def _update_buttons_opacity(self, opacity):
        for effect in self.effects:
            effect.setOpacity(opacity)

    def _init_validation_buttons(self) -> None:
        self._yes = QPushButton(self._central_widget)
        self._yes.setGeometry(QRect(0, SCREENSHOT_MAX_HEIGHT, WIDTH // 2, BUTTON_HEIGHT))
        self._yes.setObjectName("valid_button")
        self._no = QPushButton(self._central_widget)
        self._no.setGeometry(QRect(WIDTH // 2, SCREENSHOT_MAX_HEIGHT, WIDTH // 2, BUTTON_HEIGHT))
        self._no.setObjectName("invalid_button")

    def keyPressEvent(self, event: QKeyEvent):
        if event.text().lower() == 'y':
            self._yes.click()
        elif event.text().lower() == 'n':
            self._no.click()

    def _init_gui_widgets(self) -> None:
        self._central_widget = QWidget(self)
        self._central_widget.setObjectName("central_widget")

        self._init_device_body()
        self._init_action_hint()
        self._init_device_buttons_effect()
        self._init_screenshot()
        self._init_validation_buttons()

        if self._device in ["stax", "flex", "apex_p", "apex_m"]:
            self._devicebody.raise_()
            self._touch.raise_()
            self._swipe_left.raise_()
            self._swipe_right.raise_()

        layout = QGridLayout()
        layout.addWidget(self._devicebody, 0, 0)
        layout.addWidget(self._lb, 0, 0)
        layout.addWidget(self._rb, 0, 0)
        layout.addWidget(self._actionhint, 1, 0)
        layout.addWidget(self._screenshot, 0, 0)
        layout.addWidget(self._yes, 2, 0)
        layout.addWidget(self._no, 3, 0)

        self._central_widget.setLayout(layout)
        self.setCentralWidget(self._central_widget)

    def action_done(self) -> None:
        self._show_button(self._lb, False)
        self._show_button(self._rb, False)
        self._show_button(self._touch, False)
        self._show_button(self._swipe_left, False)
        self._show_button(self._swipe_right, False)

    def close(self) -> bool:
        """
        Stop the Qt application
        """
        self.logger.info("Closing")
        QApplication.quit()
        return True

    def set_button_cb(self, callback: Callable[[bool], None]) -> None:
        """
        Set the callback to be called when the user clicks on the "Yes/Confirm/Continue" or
        "No/Cancel/Stop" buttons. This callback shall receive one boolean argument, which will
        be `True` if the clicked button is "Yes", and `False` otherwise.

        :param callback: The callback to set on the button
        :type callback: Callable[[bool], None]
        """
        self.logger.debug("New callback received")
        self._yes.clicked.connect(partial(callback, True))
        self._no.clicked.connect(partial(callback, False))

    def display_screenshot(self, image: Path) -> None:
        """
        Display an image in the center window of the interface.

        :param image: The path to the image to display
        :type image: Path
        """
        self.logger.debug("Displaying new screenshot '%s'", image)

        self._screenshot.setPixmap(QPixmap(str(image.resolve())))
        self._yes.setText("YES, this is the correct screen")
        self._no.setText("NOPE, there is an error here")

    def display_text_search(self, text: str) -> None:
        """
        Display text to be searched by user on device's
        screen.

        :param image: The path to the image to display
        :type image: Path
        """
        self.logger.debug("Displaying new text '%s'", text)
        self._screenshot.setText(f"Does screen contain '{text}' string ?")
        custom_font = QFont()
        custom_font.setWeight(30)
        self._screenshot.setFont(custom_font)
        self._yes.setText("Yes")
        self._no.setText("No")

    def display_action(self, action: str, x: int = 0, y: int = 0) -> None:
        """
        Display a text in the center window of the interface

        :param action: The text to display
        :type action: str
        """
        self.logger.debug("Displaying new action '%s'", action)

        if action == "right button":
            self._show_button(self._rb, True)
            self._actionhint.setText(f"Please click on the {action}")
        elif action == "left button":
            self._show_button(self._lb, True)
            self._actionhint.setText(f"Please click on the {action}")
        elif action == "both buttons":
            self._show_button(self._lb, True)
            self._show_button(self._rb, True)
            self._actionhint.setText(f"Please click on {action}")
        elif action == "touch":
            self._show_button(self._touch, True, x, y)
            self._actionhint.setText(f"Please {action} device screen where indicated")
        elif action == "swipe_left":
            self._show_button(self._swipe_left, True, x, y)
            self._actionhint.setText("Please swipe device screen to the left")
        elif action == "swipe_right":
            self._show_button(self._swipe_right, True, x, y)
            self._actionhint.setText("Please swipe device screen to the right")

        self._yes.setText("Okay, I've performed the action")
        self._no.setText("Cancel the process")
