import os
import pytest
import logging
from dataclasses import fields
from ledgered.devices import Device, Devices
from ledgered.manifest import Manifest
from pathlib import Path
from typing import Generator, List, Optional
from unittest.mock import MagicMock

from ragger.backend import BackendInterface, SpeculosBackend, LedgerCommBackend, LedgerWalletBackend
from ragger.firmware import Firmware
from ragger.logger import init_loggers, standalone_conf_logger
from ragger.navigator import Navigator, NanoNavigator, TouchNavigator, NavigateWithScenario
from ragger.utils import find_project_root_dir, find_library_application, find_application
from ragger.utils.misc import get_current_app_name_and_version, exit_current_app, open_app_from_dashboard

from . import configuration as conf

BACKENDS = ["speculos", "ledgercomm", "ledgerwallet"]

DEVICES = [device.name for device in Devices()] + ["all", "all_nano", "all_eink"]


def pytest_addoption(parser):
    parser.addoption("--device", choices=DEVICES, required=True)
    parser.addoption("--backend", choices=BACKENDS, default="speculos")
    parser.addoption("--no-nav", action="store_true", default=False, help="Disable the navigation")
    parser.addoption("--display",
                     action="store_true",
                     default=False,
                     help="Pops up a Qt interface displaying either the emulated device (Speculos "
                     "backend) or the expected screens and actions (physical backend)")
    parser.addoption("--golden_run",
                     action="store_true",
                     default=False,
                     help="Do not compare the snapshots during testing, but instead save the live "
                     "ones. Will only work with 'speculos' as the backend")
    parser.addoption("--pki_prod",
                     action="store_true",
                     default=False,
                     help="Have Speculos accept prod PKI certificates instead of test")
    parser.addoption("--log_apdu_file",
                     action="store",
                     default=None,
                     nargs="?",
                     const="apdu.log",
                     help="Log the APDU in a file. If no pattern provided, uses 'apdu_xxx.log'.")
    parser.addoption("--seed", action="store", default=None, help="Set a custom seed")
    # Always allow "default" even if application conftest does not define it
    allowed_setups = conf.OPTIONAL.ALLOWED_SETUPS
    if "default" not in allowed_setups:
        allowed_setups.insert(0, "default")
    parser.addoption("--setup",
                     action="store",
                     default="default",
                     help="Specify the setup fixture (e.g., 'prod_build')",
                     choices=allowed_setups)


@pytest.fixture(scope="session")
def navigation(pytestconfig):
    return not pytestconfig.getoption("no_nav")


@pytest.fixture(scope="session")
def backend_name(pytestconfig):
    return pytestconfig.getoption("backend")


@pytest.fixture(scope="session")
def display(pytestconfig):
    return pytestconfig.getoption("display")


@pytest.fixture(scope="session")
def golden_run(pytestconfig):
    return pytestconfig.getoption("golden_run")


@pytest.fixture(scope=conf.OPTIONAL.BACKEND_SCOPE)
def log_apdu_file(request, pytestconfig, full_test_name: str):
    filename = pytestconfig.getoption("log_apdu_file")
    if filename is None:
        return None

    path = Path(filename)
    # Get nb of collected tests to be executed
    collected_items = len(request.session.items)
    if collected_items == 1:
        # Single test - use filename directly
        return path.resolve()
    # Multiple tests - create a file per test
    MAX_TEST_NAME_LENGTH = 100  # Define a safe maximum length for test names
    truncated_test_name = full_test_name[:MAX_TEST_NAME_LENGTH]  # Truncate if necessary
    new_filename = f"{path.stem}_{truncated_test_name}{path.suffix}"
    return Path(new_filename).resolve()


@pytest.fixture(scope="session")
def cli_user_seed(pytestconfig):
    return pytestconfig.getoption("seed")


@pytest.fixture(scope="session")
def pki_prod(pytestconfig):
    return pytestconfig.getoption("pki_prod")


@pytest.fixture(scope="session")
def root_pytest_dir(request) -> Path:
    return Path(request.config.rootpath).resolve()


@pytest.fixture(scope="session")
def supported_devices(root_pytest_dir: Path) -> List[str]:
    project_root_dir = find_project_root_dir(root_pytest_dir)
    manifest = Manifest.from_path(project_root_dir / "ledger_app.toml")
    return ["nanosp" if d == "nanos+" else d for d in manifest.app.devices.json]


@pytest.fixture(scope="session")
def skip_tests_for_unsupported_devices(supported_devices: List[str], device: Device):
    if device.name not in supported_devices:
        pytest.skip(f"Device {device.name} is not supported according to the manifest")


@pytest.fixture(autouse="session")
def default_screenshot_path(root_pytest_dir: Path) -> Path:
    # Alias reflecting the use case to avoid exposing internal helper fixtures
    return root_pytest_dir


@pytest.fixture(scope=conf.OPTIONAL.BACKEND_SCOPE)
def full_test_name(request) -> str:
    # Get the name of current pytest test
    test_name = request.node.name

    if '[' in test_name:
        # Split all parameters
        base_name, params = test_name.rsplit('[', 1)
        params = params.rstrip(']')

        # Split parameters by '-' and filter out device names
        param_list = [p for p in params.split('-') if p not in DEVICES]

        # Rebuild test name with remaining parameters
        if param_list:
            test_name = f"{base_name}[{'-'.join(param_list)}]"
        else:
            test_name = base_name

    # Clean up for filename friendliness by replacing special characters with underscores
    translation_table = str.maketrans({
        '[': '_',
        ']': '',
        '-': '_',
        '/': '_',
        "'": '',
    })
    clean_name = test_name.translate(translation_table)
    return clean_name


@pytest.fixture
def test_name(request) -> str:
    # Get the name of current pytest test
    test_name = request.node.name

    # Remove device suffix:
    # -  test_xxx_transaction_ok[nanox]
    # => test_xxx_transaction_ok
    return test_name.split("[")[0]


# This fixture allows to inject arbitrary arguments into the Speculos backend.
# These arguments are added to the pre-configured ones (such as the display,
# libraries, seed, ... Argument duplication could result in unexpected behavior.
# To inject custom argument, one just needs to override this fixture in its own
# `conftest.py` file, like this:
#
# >  @pytest.fixture
# >  def additional_speculos_arguments() -> List[str]:
# >      return ["--api-port", "5000"]
#
# Be aware that the fixture scope must respect the `backend` fixture scope.
@pytest.fixture(scope=conf.OPTIONAL.BACKEND_SCOPE)
def additional_speculos_arguments() -> List[str]:
    return []


# Glue to call every test that depends on the device once for each required firmware
def pytest_generate_tests(metafunc):
    if "device" in metafunc.fixturenames:
        device_list = []
        ids = []

        device = metafunc.config.getoption("device")
        backend_name = metafunc.config.getoption("backend")

        # Enable firmware for requested devices
        for fw in Devices():
            if device == fw.name or device == "all" or (device == "all_nano"
                                                        and fw.is_nano) or (device == "all_eink"
                                                                            and not fw.is_nano):
                device_list.append(fw)
                ids.append(fw.name)

        if len(device_list) > 1 and backend_name != "speculos":
            raise ValueError("Invalid device parameter on this backend")

        metafunc.parametrize("device", device_list, ids=ids, scope="session")

    if "firmware" in metafunc.fixturenames:
        firmware_list = []
        ids = []

        device = metafunc.config.getoption("device")
        backend_name = metafunc.config.getoption("backend")

        # Enable firmware for requested devices
        for fw in Firmware:
            if device == fw.name or device == "all" or (device == "all_nano"
                                                        and fw.is_nano) or (device == "all_eink"
                                                                            and not fw.is_nano):
                firmware_list.append(fw)
                ids.append(fw.name)

        if len(firmware_list) > 1 and backend_name != "speculos":
            raise ValueError("Invalid device parameter on this backend")

        metafunc.parametrize("firmware", firmware_list, ids=ids, scope="session")


def prepare_speculos_args(root_pytest_dir: Path,
                          device: Device,
                          display: bool,
                          pki_prod: bool,
                          cli_user_seed: str,
                          additional_args: List[str],
                          verbose_speculos: bool = False):
    speculos_args = additional_args.copy()

    if display:
        speculos_args += ["--display", "qt"]
    if pki_prod:
        speculos_args += ["-p"]

    if verbose_speculos:
        speculos_args += ["--verbose"]

    device_name = device.name
    if device_name == "nanosp":
        device_name = "nanos2"

    # Find the project root repository
    project_root_dir = find_project_root_dir(root_pytest_dir)

    manifest = Manifest.from_path(project_root_dir / "ledger_app.toml")

    # Find the main application for the requested device
    # If the app is to be loaded as a library, the main app should be located in a subfolder of
    # project_root_dir / conf.OPTIONAL.MAIN_APP_DIR. There should be only one subfolder in the path.
    main_app_path = None
    if conf.OPTIONAL.MAIN_APP_DIR is not None:
        app_dir_content = list((project_root_dir / conf.OPTIONAL.MAIN_APP_DIR).iterdir())
        app_dir_subdirectories = [child for child in app_dir_content if child.is_dir()]
        if len(app_dir_subdirectories) != 1:
            raise ValueError(
                f"Expected a single folder in {manifest.app.build_directory}, found {len(app_dir_subdirectories)}"
            )
        main_app_path = find_application(app_dir_subdirectories[0], device_name, "c")
    # If the app is standalone, the main app should be located in project_root_dir / manifest.app.build_directory
    else:
        main_app_path = find_application(project_root_dir / manifest.app.build_directory,
                                         device_name, manifest.app.sdk)

    # If this repository does not hold the main app, then we need to load this repository's application as a library
    if conf.OPTIONAL.MAIN_APP_DIR is not None:
        # This repo holds the library, not the standalone app: search in root_dir/build
        lib_path = find_application(project_root_dir, device_name, manifest.app.sdk)
        speculos_args.append(f"-l{lib_path}")

    # Legacy lib method, remove once exchange is ported
    if len(conf.OPTIONAL.SIDELOADED_APPS) != 0:
        # We are testing a a standalone app that needs libraries: search in SIDELOADED_APPS_DIR
        if conf.OPTIONAL.SIDELOADED_APPS_DIR is None:
            raise ValueError("Configuration \"SIDELOADED_APPS_DIR\" is mandatory if "
                             "\"SIDELOADED_APPS\" is used")
        libs_dir = Path(project_root_dir / conf.OPTIONAL.SIDELOADED_APPS_DIR)
        # Add "-l Appname:filepath" to Speculos command line for every required lib app
        for coin_name, lib_name in conf.OPTIONAL.SIDELOADED_APPS.items():
            lib_path = find_library_application(libs_dir, coin_name, device_name)
            speculos_args.append(f"-l{lib_name}:{lib_path}")
    else:
        # Keep this method instead
        # Find all external libraries that have to be sideloaded
        if conf.OPTIONAL.SIDELOADED_APPS_DIR is not None:
            sideloaded_dir = project_root_dir / conf.OPTIONAL.SIDELOADED_APPS_DIR
            subdirs = sorted(
                filter(lambda d: (sideloaded_dir / d).is_dir(), os.listdir(sideloaded_dir)))
            for subdir in subdirs:
                lib_path = find_application(sideloaded_dir / subdir, device_name, manifest.app.sdk)
                speculos_args.append(f"-l{lib_path}")

    # Check if custom user seed has been provided through CLI or optional configuration.
    # CLI user seed has priority over the optional configuration seed.
    if cli_user_seed:
        speculos_args += ["--seed", cli_user_seed]
    elif not len(conf.OPTIONAL.CUSTOM_SEED) == 0:
        speculos_args += ["--seed", conf.OPTIONAL.CUSTOM_SEED]

    return (main_app_path, {"args": speculos_args})


# Depending on the "--backend" option value, a different backend is
# instantiated, and the tests will either run on Speculos or on a physical
# device depending on the backend
def create_backend(root_pytest_dir: Path,
                   backend_name: str,
                   device: Device,
                   display: bool,
                   pki_prod: bool,
                   log_apdu_file: Optional[Path],
                   cli_user_seed: str,
                   additional_speculos_arguments: List[str],
                   verbose_speculos: bool = False) -> BackendInterface:
    if backend_name.lower() == "ledgercomm":
        return LedgerCommBackend(device=device,
                                 interface="hid",
                                 log_apdu_file=log_apdu_file,
                                 with_gui=display)
    elif backend_name.lower() == "ledgerwallet":
        return LedgerWalletBackend(device=device, log_apdu_file=log_apdu_file, with_gui=display)
    elif backend_name.lower() == "speculos":
        main_app_path, speculos_args = prepare_speculos_args(root_pytest_dir, device, display,
                                                             pki_prod, cli_user_seed,
                                                             additional_speculos_arguments,
                                                             verbose_speculos)
        return SpeculosBackend(main_app_path,
                               device=device,
                               log_apdu_file=log_apdu_file,
                               **speculos_args)
    else:
        raise ValueError(f"Backend '{backend_name}' is unknown. Valid backends are: {BACKENDS}")


# Backend scope can be configured by the user
# fixture skip_tests_for_unsupported_devices is a dependency because we want to skip the test
# before trying to find the binary
@pytest.fixture(scope=conf.OPTIONAL.BACKEND_SCOPE)
def backend(skip_tests_for_unsupported_devices, root_pytest_dir: Path, backend_name: str,
            device: Device, display: bool, pki_prod: bool, log_apdu_file: Optional[Path],
            cli_user_seed: str, additional_speculos_arguments: List[str],
            verbose_speculos: bool) -> Generator[BackendInterface, None, None]:
    # to separate the test name and its following logs
    print("")
    with create_backend(root_pytest_dir, backend_name, device, display, pki_prod, log_apdu_file,
                        cli_user_seed, additional_speculos_arguments, verbose_speculos) as b:
        if backend_name.lower() != "speculos" and conf.OPTIONAL.APP_NAME:
            # Make sure the app is restarted as this is what is requested by the fixture scope
            app_name, version = get_current_app_name_and_version(b)
            requested_app = conf.OPTIONAL.APP_NAME
            if app_name == requested_app:
                exit_current_app(b)
                b.handle_usb_reset()
            elif app_name != "BOLOS":
                raise ValueError(f"Unexpected app opened: {app_name}")
            open_app_from_dashboard(b, requested_app)
            b.handle_usb_reset()
        yield b


@pytest.fixture(scope=conf.OPTIONAL.BACKEND_SCOPE)
def navigator(backend: BackendInterface, device: Device, golden_run: bool, display: bool,
              navigation: bool):
    if not navigation:
        return MagicMock()

    if device.is_nano:
        return NanoNavigator(backend, device, golden_run)
    else:
        return TouchNavigator(backend, device, golden_run)


@pytest.fixture(scope="function")
def scenario_navigator(backend: BackendInterface, navigator: Navigator, device: Device,
                       test_name: str, default_screenshot_path: Path):
    return NavigateWithScenario(backend, navigator, device, test_name, default_screenshot_path)


@pytest.fixture(autouse=True)
def use_only_on_backend(request, backend_name):
    marker = request.node.get_closest_marker('use_on_backend')
    if marker:
        current_backend = marker.args[0]
        if current_backend != backend_name:
            pytest.skip(f'skipped on this backend: "{current_backend}"')


# This function will look for the 'needs_setup' marker. Example:
# @pytest.mark.needs_setup('prod_build')
# If the needed setup is not the one requested, a skip marker will be added
def pytest_collection_modifyitems(config, items):
    current = config.getoption("--setup")
    for item in items:
        marker = item.get_closest_marker('needs_setup')
        needed = marker.args[0] if marker else "default"
        if needed != current:
            item.add_marker(
                pytest.mark.skip(reason=f"Test requires setup '{needed}' but setup is '{current}'"))


# Fixture like function that will configure the ragger log level
# Called by pytest_configure and not a fixture to ensure it always runs first
def _setup_log_level(config):
    level_name = (config.getoption("--log-level") or "INFO").upper()
    level = getattr(logging, level_name, logging.INFO)
    # Force new init of logger module with the requested level
    init_loggers(level)
    config._log_level = level


def pytest_configure(config):
    config.addinivalue_line(
        "markers",
        "use_on_backend(backend): skip test if not on the specified backend",
    )

    # fixture with parameter, use with the following syntax
    # # @pytest.mark.needs_setup('prod_build')
    # if not decorated, defaults to
    # # @pytest.mark.needs_setup('default')
    # will apply a skip filter against the "--setup <setup_name>" command line argument
    # Update configuration.OPTIONAL.ALLOWED_SETUPS when adding new setups to allow the command line to accept them
    config.addinivalue_line(
        "markers",
        "needs_setup(setup_name): skip test if not on the specified setup",
    )

    _setup_log_level(config)


# TODO: forward robust log level instead of boolean to Speculos
@pytest.fixture(scope="session")
def verbose_speculos(request):
    return request.config._log_level == logging.DEBUG


def log_full_conf():
    logger = standalone_conf_logger()
    logger.info("Running Ragger with the following conf:")
    for field in fields(conf.OPTIONAL):
        logger.info(f"\t{field.name} = '{getattr(conf.OPTIONAL, field.name)}'")


# RUN ON IMPORT
log_full_conf()
