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
import toml
from typing import Optional, Tuple, List
from pathlib import Path
from ragger.error import ExceptionRAPDU
import subprocess
import json

ERROR_BOLOS_DEVICE_LOCKED = 0x5515
ERROR_DENIED_BY_USER = 0x5501
ERROR_APP_NOT_FOUND = 0x6807

ERROR_MSG_DEVICE_LOCKED = "Your device is locked"


def find_library_application(base_dir: Path, name: str, device: str) -> Path:
    """
    Builds an application ELF path according to a directory, an application name
    and a device name.
    The resulting path will be formatted like:
    ``<directory>/<application name>_<device name>.elf``
    Example: ``tests/elfs/exchange_nanox.elf``
    The directory and resulting path existence are checked.
    :param base_dir: The directory where the application ELF is
    :type base_dir: Path
    :param name: The name of the application
    :type name: str
    :param device: The device type name (ex: 'nanos', 'nanosp', ...)
    :type device: str
    :return: The path of the library application binary
    :rtype: Path
    """
    if not base_dir.is_dir():
        raise AssertionError(f"{base_dir} is not a directory")
    lib = Path(base_dir / (name + "_" + device + ".elf")).resolve()
    if not lib.is_file():
        raise AssertionError(f"File '{lib}' missing. Did you compile for this target?")
    return lib


def find_application(base_dir: Path, device: str, sdk: str) -> Path:
    """
    Search for an application binary, expecting it to be located in a typical build
    directory tree, depending on the SDK:
    - "<base_dir>/build/<device>/app.elf" for C SDK
    - "<base_dir>/target/<device>/release/<bin_name>" for Rust SDK
    :param base_dir: The root directory where to search the app binary.
    :type base_dir: Path
    :param device: The device type name (ex: 'nanos', 'nanosp', ...)
    :type device: str
    :param sdk: The SDK name (either "c" or "rust")
    :type sdk: str
    :return: The path of the application binary
    :rtype: Path
    """
    if not base_dir.is_dir():
        raise AssertionError(f"{base_dir} is not a directory")
    app = base_dir.resolve()
    if sdk.lower() == "rust":
        """
        When building a Rust app, the resulting binary is located in a target
        directory target/<device>/release/<app_name>. app is the Path to the
        build directory, where is stored the app's Cargo.toml file.
        If the app repository is organized as a workspace crate (several packages,
        each package in its own directory with its own Cargo.toml), the binaries are
        all stored in the same target directory. 'cargo metadata' is used to get the
        target directory full path.
        """
        if device == "nanos2":
            device = "nanosplus"
        app_name = toml.load(base_dir / "Cargo.toml")["package"]["name"]
        cmd = ["cargo", "metadata", "--no-deps"]
        output = subprocess.check_output(cmd, cwd=base_dir)
        metadata = json.loads(output)
        target = Path(metadata["target_directory"])
        app = target / device / "release" / app_name
    else:
        app = app / "build" / device / "bin" / "app.elf"
    if not app.is_file():
        raise AssertionError(f"File '{app}' missing. Did you compile for this target?")
    return app


def _is_root(path_to_check: Path) -> bool:
    return (path_to_check).resolve() == Path("/").resolve()


def find_project_root_dir(origin: Path) -> Path:
    project_root_dir = origin
    while not _is_root(project_root_dir) and not (project_root_dir / ".git").resolve().is_dir():
        project_root_dir = project_root_dir.parent
    if _is_root(project_root_dir):
        raise ValueError("Could not find project top directory")
    return project_root_dir


def prefix_with_len(to_prefix: bytes) -> bytes:
    return len(to_prefix).to_bytes(1, byteorder="big") + to_prefix


def create_currency_config(main_ticker: str,
                           application_name: str,
                           sub_coin_config: Optional[Tuple[str, int]] = None) -> bytes:
    sub_config: bytes = b""
    if sub_coin_config is not None:
        sub_config = prefix_with_len(sub_coin_config[0].encode())
        sub_config += sub_coin_config[1].to_bytes(1, byteorder="big")
    coin_config: bytes = b""
    for element in [main_ticker.encode(), application_name.encode(), sub_config]:
        coin_config += prefix_with_len(element)
    return coin_config


def split_message(message: bytes, max_size: int) -> List[bytes]:
    return [message[x:x + max_size] for x in range(0, len(message), max_size)]


def get_current_app_name_and_version(backend):
    try:
        response = backend.exchange(
            cla=0xB0,  # specific CLA for BOLOS
            ins=0x01,  # specific INS for get_app_and_version
            p1=0,
            p2=0).data
        offset = 0

        format_id = response[offset]
        offset += 1
        assert format_id == 1

        app_name_len = response[offset]
        offset += 1
        app_name = response[offset:offset + app_name_len].decode("ascii")
        offset += app_name_len

        version_len = response[offset]
        offset += 1
        version = response[offset:offset + version_len].decode("ascii")
        offset += version_len

        if app_name != "BOLOS":
            flags_len = response[offset]
            offset += 1
            _ = response[offset:offset + flags_len]
            offset += flags_len

        assert offset == len(response)

        return app_name, version
    except ExceptionRAPDU as e:
        if e.status == ERROR_BOLOS_DEVICE_LOCKED:
            raise ValueError(ERROR_MSG_DEVICE_LOCKED)
        raise e


def exit_current_app(backend):
    backend.exchange(
        cla=0xB0,  # specific CLA for BOLOS
        ins=0xA7,  # specific INS for INS_APP_EXIT
        p1=0,
        p2=0)


def open_app_from_dashboard(backend, app_name: str):
    try:
        backend.exchange(
            cla=0xE0,  # specific CLA for Dashboard
            ins=0xD8,  # specific INS for INS_OPEN_APP
            p1=0,
            p2=0,
            data=app_name.encode())
    except ExceptionRAPDU as e:
        if e.status == ERROR_DENIED_BY_USER:
            raise ValueError("Open app consent denied by the user")
        elif e.status == ERROR_APP_NOT_FOUND:
            raise ValueError(f"App '{app_name} is not present")
        raise e
