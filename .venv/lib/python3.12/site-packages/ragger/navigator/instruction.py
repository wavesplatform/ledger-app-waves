from enum import auto, Enum
from typing import Any, Dict


class BaseNavInsID(Enum):
    """
    Base NavInsID class, allowing to define NavInsID specific to one's application
    while being compatible with all Navigator methods.
    """
    pass


class NavInsID(BaseNavInsID):
    """
    Pre-defined instruction ID to navigate into a device UI.
    """
    WAIT = auto()

    # Navigation instructions that embedded a call to
    # wait_for_screen_change()
    WAIT_FOR_SCREEN_CHANGE = auto()
    WAIT_FOR_HOME_SCREEN = auto()
    WAIT_FOR_TEXT_ON_SCREEN = auto()
    WAIT_FOR_TEXT_NOT_ON_SCREEN = auto()

    # Navigation instructions for Nano devices
    RIGHT_CLICK = auto()
    LEFT_CLICK = auto()
    BOTH_CLICK = auto()

    # Navigation instructions for Stax devices
    TOUCH = auto()
    SWIPE = auto()
    SWIPE_CENTER_TO_LEFT = auto()
    SWIPE_CENTER_TO_RIGHT = auto()

    # possible headers
    RIGHT_HEADER_TAP = auto()
    EXIT_HEADER_TAP = auto()
    INFO_HEADER_TAP = auto()
    LEFT_HEADER_TAP = auto()
    NAVIGATION_HEADER_TAP = auto()
    # possible centers
    CHOICE_CHOOSE = auto()
    SUGGESTION_CHOOSE = auto()
    TAPPABLE_CENTER_TAP = auto()
    KB_LETTER_ONLY_WRITE = auto()
    KB_LETTERS_WRITE = auto()
    KB_SPECIAL_CHAR_1_WRITE = auto()
    KB_SPECIAL_CHAR_2_WRITE = auto()
    # possible footers
    CENTERED_FOOTER_TAP = auto()
    CANCEL_FOOTER_TAP = auto()
    EXIT_FOOTER_TAP = auto()
    INFO_FOOTER_TAP = auto()
    # use cases
    USE_CASE_HOME_INFO = auto()
    USE_CASE_HOME_SETTINGS = auto()
    USE_CASE_HOME_QUIT = auto()
    USE_CASE_SETTINGS_SINGLE_PAGE_EXIT = auto()
    USE_CASE_SETTINGS_MULTI_PAGE_EXIT = auto()
    USE_CASE_SETTINGS_PREVIOUS = auto()
    USE_CASE_SETTINGS_NEXT = auto()
    USE_CASE_SUB_SETTINGS_EXIT = auto()
    USE_CASE_SUB_SETTINGS_PREVIOUS = auto()
    USE_CASE_SUB_SETTINGS_NEXT = auto()
    USE_CASE_CHOICE_CONFIRM = auto()
    USE_CASE_CHOICE_REJECT = auto()
    USE_CASE_STATUS_DISMISS = auto()
    USE_CASE_REVIEW_TAP = auto()
    USE_CASE_REVIEW_NEXT = auto()
    USE_CASE_REVIEW_PREVIOUS = auto()
    USE_CASE_REVIEW_REJECT = auto()
    USE_CASE_REVIEW_CONFIRM = auto()
    USE_CASE_VIEW_DETAILS_EXIT = auto()
    USE_CASE_VIEW_DETAILS_PREVIOUS = auto()
    USE_CASE_VIEW_DETAILS_NEXT = auto()
    USE_CASE_ADDRESS_CONFIRMATION_TAP = auto()
    USE_CASE_ADDRESS_CONFIRMATION_EXIT_QR = auto()
    USE_CASE_ADDRESS_CONFIRMATION_CONFIRM = auto()
    USE_CASE_ADDRESS_CONFIRMATION_CANCEL = auto()


class NavIns:

    def __init__(self, id: BaseNavInsID, args=(), kwargs: Dict[str, Any] = {}):
        self.id = id
        self.args = args
        self.kwargs = kwargs
