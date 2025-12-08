import logging

__logger__ = None
DEFAULT_FORMAT = "[%(asctime)s][%(levelname)s] %(name)s - %(message)s"


def getLogger() -> logging.Logger:
    global __logger__
    if __logger__ is None:
        logger = logging.getLogger(__package__)
        logger.handlers.clear()
        logger.setLevel(level=logging.WARNING)
        handler = logging.StreamHandler()
        handler.setFormatter(logging.Formatter(DEFAULT_FORMAT))
        logger.addHandler(handler)
        __logger__ = logger
    return __logger__
