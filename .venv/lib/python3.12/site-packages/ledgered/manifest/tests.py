from dataclasses import dataclass
from pathlib import Path
from typing import Dict, List, Optional, Union
from urllib.parse import urlparse

from ledgered.serializers import Jsonable, JsonDict, JsonSet
from .constants import DEFAULT_USE_CASE
from .errors import MissingField
from .utils import getLogger

APPLICATION_DIRECTORY_KEY = "application_directory"
APPLICATION_DIRECTORY_NAME = ".dependencies"


class DuplicateDependencyError(ValueError):
    pass


@dataclass
class TestsDependencyConfig(Jsonable):
    __test__ = False  # deactivate pytest discovery warning

    url: str
    ref: str
    use_case: Optional[str]

    def __init__(self, url: str, ref: str, base_dir: Path, use_case: Optional[str] = None) -> None:
        self.url = url
        self.ref = ref
        self.use_case = use_case or DEFAULT_USE_CASE
        self._name = Path(urlparse(url).path).name
        self._base_dir = Path(base_dir)

    @property
    def dir(self) -> Path:
        return (
            self._base_dir / APPLICATION_DIRECTORY_NAME / f"{self._name}-{self.ref}-{self.use_case}"
        )

    def __eq__(self, other: object) -> bool:
        if not isinstance(other, TestsDependencyConfig):
            return False
        return self.dir == other.dir

    def __hash__(self) -> int:
        return hash((self.url, self.ref, self.use_case))

    @property
    def json(self):
        json = super().json
        json[APPLICATION_DIRECTORY_KEY] = str(self.dir)
        return json


@dataclass
class TestsDependenciesConfig(Jsonable):
    __test__ = False  # deactivate pytest discovery warning

    dependencies: JsonSet

    def __init__(self, dependencies: List[Dict], base_dir: Path) -> None:
        logger = getLogger()
        self.dependencies = JsonSet()
        for dep in dependencies:
            dependency = TestsDependencyConfig(**dep, base_dir=base_dir)
            if dependency in self.dependencies:
                logger.error("Dependency duplication!")
                raise DuplicateDependencyError(dependency)
            self.dependencies.add(dependency)
            logger.debug("Dependency %s added", dependency)

    @property
    def json(self):
        return self.dependencies.json


@dataclass
class TestsConfig(Jsonable):
    __test__ = False  # deactivate pytest discovery warning

    unit_directory: Optional[Path]
    pytest_directory: Optional[Path]
    dependencies: Optional[JsonDict]

    def __init__(
        self,
        pytest_directory: Optional[Union[str, Path]] = None,
        unit_directory: Optional[Union[str, Path]] = None,
        dependencies: Optional[Dict[str, List]] = None,
    ) -> None:
        logger = getLogger()
        logger.debug("Parsing test dependencies")
        self.unit_directory = None if unit_directory is None else Path(unit_directory)
        self.pytest_directory = None if pytest_directory is None else Path(pytest_directory)
        if dependencies is None:
            self.dependencies = None
        else:
            if self.pytest_directory is None:
                raise MissingField("[tests] pytest_directory")
            self.dependencies = JsonDict()
            for key, value in dependencies.items():
                logger.info("Parsing dependencies for '%s' tests", key)
                self.dependencies[key] = TestsDependenciesConfig(value, self.pytest_directory)


@dataclass
class PyTestsConfig(Jsonable):
    __test__ = False  # deactivate pytest discovery warning

    key: str
    directory: Path
    self_use_case: Optional[str]
    dependencies: Optional[JsonDict]

    def __init__(
        self,
        key: str,
        directory: Optional[str] = None,
        self_use_case: Optional[str] = None,
        dependencies: Optional[Dict] = None,
    ) -> None:
        logger = getLogger()
        logger.debug("Parsing pytests parameters")
        self.key = key

        if directory is None:
            raise MissingField("[pytest.*.directory]")
        else:
            self.directory = Path(directory)
            self.self_use_case = self_use_case or DEFAULT_USE_CASE
            if dependencies is not None:
                self.dependencies = JsonDict()
                for key, value in dependencies.items():
                    logger.info("Parsing dependencies for '%s' tests", key)
                    self.dependencies[key] = TestsDependenciesConfig(value, self.directory)
            else:
                self.dependencies = None


@dataclass
class UnitTestsConfig(Jsonable):
    __test__ = False  # deactivate pytest discovery warning

    unit_directory: Optional[Path]

    def __init__(
        self,
        directory: Optional[Union[str, Path]] = None,
    ) -> None:
        logger = getLogger()
        logger.debug("Parsing unit tests")
        self.unit_directory = None if directory is None else Path(directory)
