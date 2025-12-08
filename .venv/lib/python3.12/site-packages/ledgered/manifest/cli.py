import json
import logging
import sys
from argparse import ArgumentParser
from collections import defaultdict
from pathlib import Path
from typing import Dict, cast

from .constants import MANIFEST_FILE_NAME
from ..github import GitHubLedgerHQ
from .manifest import Manifest
from .tests import TestsConfig, PyTestsConfig
from .utils import getLogger


def text_output(content: Dict, indent: int = 0) -> None:
    if indent == 0 and len(content) == 1:
        k, v = content.popitem()
        if isinstance(v, (dict, list, set, tuple)):
            content = {k: v}
        else:
            print(v)
            return
    for key, value in content.items():
        if isinstance(value, dict):
            print(f"{' ' * 2 * indent}{key}:")
            text_output(value, indent=indent + 1)
        elif isinstance(value, (list, set, tuple)):
            print(f"{' ' * 2 * indent}{key}:")
            for i, element in enumerate(value):
                if isinstance(element, dict):
                    print(f"{' ' * (2 * indent + 1)}{i}.")
                    text_output(element, indent=indent + 1)
                else:
                    print(f"{' ' * 2 * indent}{i}. {element}")
        else:
            print(f"{' ' * 2 * indent}{key}: {value}")


def set_parser() -> ArgumentParser:
    parser = ArgumentParser(
        prog="ledger-manifest",
        description="Utilitary to parse and check an application 'ledger_app.toml' manifest",
    )

    # generic options
    parser.add_argument("-v", "--verbose", action="count", default=0)
    parser.add_argument(
        "-c",
        "--check",
        required=False,
        type=Path,
        default=None,
        help="Check the manifest content against the provided directory.",
    )

    # display options
    parser.add_argument(
        "source",
        type=Path,
        help=f"The manifest file (generally '{MANIFEST_FILE_NAME}' at the root of "
        "the application's repository), or the name of the app if the `--url` "
        "option is activated",
    )
    parser.add_argument(
        "--token",
        required=False,
        default=None,
        help="Provide a GitHub token so that functional test won't trigger API "
        "restrictions too fast",
    )
    parser.add_argument(
        "-u",
        "--url",
        action="store_true",
        default=False,
        help="Tells if the `manifest` should be fetched from `github.com` rather than a file",
    )
    parser.add_argument(
        "-os",
        "--output-sdk",
        required=False,
        action="store_true",
        default=False,
        help="outputs the SDK type",
    )
    parser.add_argument(
        "-ob",
        "--output-build-directory",
        required=False,
        action="store_true",
        default=False,
        help="outputs the build directory (where the Makefile in C app, or the "
        "Cargo.toml in Rust app is expected to be)",
    )
    parser.add_argument(
        "-od",
        "--output-devices",
        required=False,
        action="store_true",
        default=False,
        help="outputs the list of devices supported by the application",
    )
    parser.add_argument(
        "-otu",
        "--output-tests-unit-directory",
        required=False,
        action="store_true",
        default=False,
        help="outputs the directory of the unit tests. Fails if none",
    )
    parser.add_argument(
        "-otp",
        "--output-tests-pytest-directory",
        required=False,
        action="store_true",
        default=False,
        help="outputs the directory of the pytest (functional) tests. Fails if none",
    )
    parser.add_argument(
        "-otd",
        "--output-tests-dependencies",
        required=False,
        action="store",
        default=None,
        nargs="*",
        help="outputs the given use cases. Fails if none",
    )
    parser.add_argument(
        "-ouc",
        "--output-use-cases",
        required=False,
        default=None,
        action="store",
        nargs="*",
        help="outputs the use cases. Fails if none",
    )
    parser.add_argument(
        "-j", "--json", required=False, action="store_true", help="outputs as JSON rather than text"
    )
    ##############################################################
    # New commands for Manifest v2
    ##############################################################
    parser.add_argument(
        "--output-pytest-directories",
        required=False,
        action="store",
        default=None,
        nargs="*",
        help="outputs the directories of the pytest (functional) tests. Fails if none",
    )
    parser.add_argument(
        "--output-pytest-usecases",
        required=False,
        action="store",
        default=None,
        nargs="*",
        help="outputs the usecases of the pytest (functional) tests. Fails if none",
    )
    parser.add_argument(
        "--output-pytest-dependencies",
        required=False,
        action="store",
        default=None,
        nargs="*",
        help="outputs the dependencies of the pytest (functional) tests. Fails if none",
    )
    return parser


def main() -> None:  # pragma: no cover
    logger = getLogger()
    args = set_parser().parse_args()

    # verbosity
    if args.verbose == 1:
        logger.setLevel(logging.INFO)
    elif args.verbose > 1:
        logger.setLevel(logging.DEBUG)

    logger.info("Loading the manifest")
    repo_manifest: Manifest
    if args.url:
        gh_ledger = GitHubLedgerHQ() if args.token is None else GitHubLedgerHQ(args.token)
        repo_manifest = gh_ledger.get_app(str(args.source)).manifest
    else:
        assert args.source.is_file(), f"'{args.source.resolve()}' does not appear to be a file."
        manifest = args.source.resolve()

        repo_manifest = Manifest.from_path(manifest)

    # check directory path against manifest data
    if args.check is not None:
        logger.info("Checking the manifest")
        repo_manifest.check(args.check)
        return

    # no check
    logger.info("Displaying manifest info")
    display_content: Dict = defaultdict(dict)

    if args.output_build_directory:
        display_content["build_directory"] = str(repo_manifest.app.build_directory)

    if args.output_sdk:
        display_content["sdk"] = repo_manifest.app.sdk
    if args.output_devices:
        display_content["devices"] = list(repo_manifest.app.devices)

    if args.output_use_cases is not None:
        use_cases = repo_manifest.use_cases.json if repo_manifest.use_cases else dict()
        non_empty = len(use_cases) > 0
        if len(args.output_use_cases) != 0:
            use_cases = {k: v for (k, v) in use_cases.items() if k in args.output_use_cases}
        if not len(use_cases) and non_empty:
            logger.error("No use case match these ones: '%s'", args.output_use_cases)
            sys.exit(2)
        display_content["use_cases"] = use_cases

    if args.output_tests_dependencies is not None:
        dependencies = dict()
        if len(repo_manifest.pytests) != 0 and repo_manifest.pytests[0].dependencies is not None:
            dependencies = repo_manifest.pytests[0].dependencies.json
        non_empty = len(dependencies) > 0
        if len(args.output_tests_dependencies) != 0:
            dependencies = {
                k: v for (k, v) in dependencies.items() if k in args.output_tests_dependencies
            }
        if not len(dependencies) and non_empty:
            logger.error("No use case match these ones: '%s'", args.output_tests_dependencies)
            sys.exit(2)
        display_content["tests"]["dependencies"] = dependencies

    if args.output_tests_unit_directory:
        if repo_manifest.unit_tests is None and (
            len(repo_manifest.pytests) == 0
            or cast(TestsConfig, repo_manifest.pytests[0]).unit_directory is None
        ):
            logger.error("This manifest does not contains the 'unit_tests.directory' field")
            sys.exit(2)
        else:
            if repo_manifest.unit_tests is not None:
                display_content["tests"]["unit_directory"] = str(
                    repo_manifest.unit_tests.unit_directory
                )
            else:
                display_content["tests"]["unit_directory"] = str(
                    cast(TestsConfig, repo_manifest.pytests[0]).unit_directory
                )

    if args.output_tests_pytest_directory:
        if len(repo_manifest.pytests) == 0:
            logger.error(
                "This manifest does not contains any [tests] (manifest version = 1) or [pytests] (manifest version > 1) field"
            )
            sys.exit(2)
        test_config = repo_manifest.pytests[0]
        if isinstance(test_config, TestsConfig):
            # Legacy format, only one possible directory to return so we return it
            display_content["tests"]["pytest_directory"] = str(test_config.pytest_directory)
        elif isinstance(test_config, PyTestsConfig):
            # If we have several pytests, we look for the [standalone] one
            for cfg in repo_manifest.pytests:
                assert isinstance(cfg, PyTestsConfig)
                if cfg.key == "standalone":
                    display_content["tests"]["pytest_directory"] = str(cfg.directory)
                    break
        else:
            logger.error(
                "This manifest contains a [pytests] field, but no [tests] field. "
                "Please use the --output-pytest-directories option instead"
            )
            sys.exit(2)

    if args.output_pytest_directories is not None:
        if len(repo_manifest.pytests) == 0:
            logger.error(
                "This manifest does not contains any [tests] (manifest version = 1) or [pytests] (manifest version > 1) field"
            )
            sys.exit(2)
        display_content["pytest_directories"] = list()
        for idx, test_config in enumerate(repo_manifest.pytests):
            if isinstance(test_config, PyTestsConfig):
                if len(args.output_pytest_directories) == 1:
                    if idx != int(args.output_pytest_directories[0]):
                        continue
                display_content["pytest_directories"].append(
                    {"name": test_config.key, "directory": str(test_config.directory)}
                )
            if isinstance(test_config, TestsConfig):
                # Also add legacy format to the output list, but only if pytest_directory is defined
                if test_config.pytest_directory is not None:
                    display_content["pytest_directories"].append(
                        {"name": "tests", "directory": str(test_config.pytest_directory)}
                    )

    if args.output_pytest_usecases is not None:
        if len(repo_manifest.pytests) == 0:
            logger.error(
                "This manifest does not contains any [tests] (manifest version = 1) or [pytests] (manifest version > 1) field"
            )
            sys.exit(2)
        display_content["pytest_usecases"] = list()
        for idx, test_config in enumerate(repo_manifest.pytests):
            if isinstance(test_config, TestsConfig):
                continue
            elif isinstance(test_config, PyTestsConfig):
                if len(args.output_pytest_usecases) == 1:
                    if idx != int(args.output_pytest_usecases[0]):
                        continue
                display_content["pytest_usecases"].append(str(test_config.self_use_case))

    if args.output_pytest_dependencies is not None:
        if len(repo_manifest.pytests) != 0:
            display_content["pytests_dependencies"] = list()
            for idx, test_config in enumerate(repo_manifest.pytests):
                pytest_dependencies = list()
                if test_config.dependencies is not None:
                    pytest_dependencies = list(test_config.dependencies)
                    if len(args.output_pytest_dependencies) >= 1:
                        if idx != int(args.output_pytest_dependencies[0]):
                            continue
                    if len(args.output_pytest_dependencies) == 2:
                        for k, v in test_config.dependencies.json.items():
                            if k != args.output_pytest_dependencies[1]:
                                continue
                            display_content["pytests_dependencies"].append(v)
                    else:
                        display_content["pytests_dependencies"].append(pytest_dependencies)
                else:
                    display_content["pytests_dependencies"].append(pytest_dependencies)
            # if there is only one list of dependencies, we remove the list
            if len(display_content["pytests_dependencies"]) == 1:
                display_content["pytests_dependencies"] = display_content["pytests_dependencies"][0]
            if len(display_content["pytests_dependencies"]) == 0:
                logger.error("No pytest dependencies found")
                sys.exit(2)

    # cropping down to the latest dict, if previouses only has 1 key so that the output (either text
    # or JSON) is the smallest possible
    while True:
        if len(display_content) == 1:
            k, v = display_content.popitem()
            if isinstance(v, dict):
                display_content = v
            else:
                display_content = {k: v}
                break
        else:
            break

    if not display_content:
        return

    if args.json:
        logger.debug("Output as JSON string")
        print(json.dumps(display_content))
    else:
        logger.debug("Output as plain text")
        text_output(display_content)
