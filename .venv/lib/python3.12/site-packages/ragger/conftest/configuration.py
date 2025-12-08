from dataclasses import dataclass
from typing import Optional, List


@dataclass
class OptionalOptions:
    APP_NAME: str
    MAIN_APP_DIR: Optional[str]
    SIDELOADED_APPS: dict
    SIDELOADED_APPS_DIR: Optional[str]
    BACKEND_SCOPE: str
    CUSTOM_SEED: str
    ALLOWED_SETUPS: List[str]


OPTIONAL = OptionalOptions(
    # Use this parameter if you want physical Ragger backends (LedgerWallet and LedgerComm) to start
    # your application from the Dashboard at test start.
    APP_NAME=str(),

    # If not None, the application being tested with Ragger should be loaded as a library and not as
    # a standalone application. This parameter points to the repository holding the "main app", i.e
    # the application started from the Dashboard, which will then use the "local app" as a library.
    # Example use case: your application is an Ethereum plugin, which will be used as a library by
    # the Ethereum application.
    # MAIN_APP_DIR is the directory where the Ethereum application is cloned.
    #
    # example: configuration.OPTIONAL.MAIN_APP_DIR = "tests/.test_dependencies/"
    # Speculos will then start "tests/.test_dependencies/ethereum/build/<device>/bin/app.elf"
    # There must be exactly one application cloned inside this directory.
    MAIN_APP_DIR=None,

    # Deprecated
    SIDELOADED_APPS=dict(),

    # Relative path to the directory that will store library applications needed for the test.
    # They will be sideloaded by Speculos and can then be called by the main application. This
    # emulates the applications being installed on the device alongside the main application.
    #
    # example: configuration.OPTIONAL.SIDELOADED_APPS_DIR = "tests/.test_dependencies/libraries"
    # Speculos will then sideload "tests/.test_dependencies/libraries/*/build/<device>/bin/app.elf"
    SIDELOADED_APPS_DIR=None,

    # As the backend instantiation may take some time, Ragger supports multiple backend scopes.
    # You can choose to share the backend instance between {session / module / class / function}
    # When using "session" all your tests will share a single backend instance (faster)
    # When using "function" each test will have its independent backend instance (no collusion)
    BACKEND_SCOPE="class",

    # Use this parameter if you want speculos to use a custom seed instead of the default one.
    # This would result in speculos being launched with --seed <CUSTOM_SEED>
    # If a seed is provided through the "--seed" pytest command line option, it will override this one.
    # /!\ DO NOT USE SEEDS WITH REAL FUNDS /!\
    CUSTOM_SEED=str(),

    # /!\ DEPRECATED /!\
    # Use this parameter if you want ragger to handle running different test suites depending on setup
    # Useful when some tests need certain build options and other tests need other build options, or a
    # different Speculos command line
    # Adding a setup <name> will allow you to decorate your tests with it using the following syntax
    # @pytest.mark.needs_setup('<name>')
    # And run marked tests and only them using the --setup <name>
    #
    # "default" setup is always allowed, all tests without explicit decoration depend on default
    # and the --setup option defaults to "default"
    # /!\ DEPRECATED /!\
    ALLOWED_SETUPS=["default"],
)
