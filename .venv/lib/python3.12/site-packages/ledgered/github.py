from enum import IntEnum, auto
from github import ContentFile as PyContentFile, Github as PyGithub, Repository as PyRepository
from github.GithubException import UnknownObjectException, GithubException
from pathlib import Path
from typing import List, Optional
from unittest.mock import patch

from ledgered.manifest import MANIFEST_FILE_NAME, Manifest

LEDGER_ORG_NAME = "ledgerhq"
APP_PLUGIN_PREFIX = "app-plugin-"


class Condition(IntEnum):
    WITH = auto()
    WITHOUT = auto()
    ONLY = auto()


class NoManifestException(FileNotFoundError):
    def __init__(self, repository: "AppRepository"):
        super().__init__(
            f"`ledger_app.toml` manifest not found in repository '{repository.url}', "
            f"branch '{repository.current_branch}'."
        )


class AppRepository(PyRepository.Repository):
    def __init__(self, *args, **kwargs) -> None:
        super().__init__(*args, **kwargs)
        self._manifest: Optional[Manifest] = None
        self._makefile: Optional[str] = None
        self._branch: str = self.default_branch
        self._variant_param: Optional[str] = None
        self._variant_values: List[str] = []

    @property
    def manifest(self) -> Manifest:
        if self._manifest is None:
            try:
                manifest = self.get_contents(MANIFEST_FILE_NAME, ref=self.current_branch)
            except GithubException as e:
                if e.status == 404:
                    raise NoManifestException(self)
                raise e
            except UnknownObjectException as e:
                if e.status == 404:
                    raise NoManifestException(self)
                raise e

            # `get_contents` can return a list, but here there can only be one manifest
            assert isinstance(manifest, PyContentFile.ContentFile)
            manifest_content = manifest.decoded_content.decode()
            self._manifest = Manifest.from_string(manifest_content)
        return self._manifest

    @property
    def makefile_path(self) -> Path:
        location = self.manifest.app.build_directory
        if self.manifest.app.is_rust:
            location /= "Cargo.toml"
        else:
            location /= "Makefile"
        return location

    @property
    def makefile(self) -> str:
        if self._makefile is None:
            # paths on Windows contain "\" which are not compatible with GitHub remote paths
            makefile = self.get_contents(
                str(self.makefile_path).replace("\\", "/"), ref=self.current_branch
            )
            # `get_contents` can return a list, but here there can only be one Makefile / Cargo.toml
            assert isinstance(makefile, PyContentFile.ContentFile)
            self._makefile = makefile.decoded_content.decode()
        return self._makefile

    @property
    def variants(self) -> List[str]:
        if not self._variant_values:
            self._set_variants()
        return self._variant_values

    @property
    def variant_param(self) -> Optional[str]:
        if self._variant_param is None:
            self._set_variants()
        return self._variant_param

    @property
    def current_branch(self) -> str:
        return self._branch

    @current_branch.setter
    def current_branch(self, new_branch: str) -> None:
        self._branch = self.get_branch(new_branch).name
        # invalidating previously fetched info, as they may differ on another branch
        self._manifest = None
        self._makefile = None
        self._variant_param = None
        self._variant_values.clear()

    def _set_variants(self) -> None:
        """Extracts the variants from the app Makefile"""

        for line in self.makefile.splitlines():
            if "VARIANTS" in line:
                # Ex: `@echo VARIANTS COIN ACA ACA_XL`
                # Sometimes, it can be a computed value in the Makefile, ex: `@echo VARIANTS CHAIN $(SUPPORTED_CHAINS)`
                # => No solution to get them for now
                parts = line.split(" ")
                if len(parts) >= 3:
                    self._variant_param = parts[2]
                    if not parts[3].startswith("$("):
                        self._variant_values = parts[3:]
            elif "VARIANT_PARAM" in line and "=" in line:
                # There should be a single word here, ex: `VARIANT_PARAM = COIN`
                self._variant_param = line.split("=")[1].split()[0]
            elif "VARIANT_VALUES" in line and "=" in line:
                # We can have multiple values here, ex: `VARIANT_VALUES = bitcoin_testnet bitcoin`
                # Sometimes, it can be a computed value in the Makefile, ex: `VARIANT_VALUES = $(SUPPORTED_CHAINS)`
                # => No solution to get them for now
                self._variant_values = [
                    val.strip() for val in line.split("=")[1].split() if not val.startswith("$(")
                ]

            if self._variant_param is not None and self._variant_values:
                break
        else:
            # No variant found
            self._variant_values = []

        if not self._variant_values:
            # Invalid configuration, reset the name
            self._variant_param = None


class GitHubApps(list):
    def __init__(self, apps: List[AppRepository]):
        super().__init__([r for r in apps if r.name.startswith("app-")])

    def filter(
        self,
        name: Optional[str] = None,
        archived: Condition = Condition.WITH,
        private: Condition = Condition.WITH,
        legacy: Condition = Condition.WITH,
        plugin: Condition = Condition.WITH,
        only_list: Optional[List[str]] = None,
        exclude_list: Optional[List[str]] = None,
        sdk: Optional[List[str]] = None,
    ) -> "GitHubApps":
        new_list: List[AppRepository] = [i for i in self]
        # only_list filtering (takes precedence on exclude_list)
        if only_list:
            new_list = [r for r in new_list if r.name in only_list]
        # exclude_list filtering
        elif exclude_list:
            new_list = [r for r in new_list if r.name not in exclude_list]
        # sdk filtering
        # archived filtering
        if archived == Condition.WITHOUT:
            new_list = [r for r in new_list if not r.archived]
        elif archived == Condition.ONLY:
            new_list = [r for r in new_list if r.archived]
        # private filtering
        if private == Condition.WITHOUT:
            new_list = [r for r in new_list if not r.private]
        elif private == Condition.ONLY:
            new_list = [r for r in new_list if r.private]
        # name filtering
        if name is not None:
            new_list = [r for r in new_list if name.lower() in r.name.lower()]
        # legacy apps filtering
        if legacy == Condition.WITHOUT:
            new_list = [r for r in new_list if "legacy" not in r.name.lower()]
        elif legacy == Condition.ONLY:
            new_list = [r for r in new_list if "legacy" in r.name.lower()]
        # plugin apps filtering
        if plugin == Condition.WITHOUT:
            new_list = [r for r in new_list if not r.name.lower().startswith(APP_PLUGIN_PREFIX)]
        elif plugin == Condition.ONLY:
            new_list = [r for r in new_list if r.name.lower().startswith(APP_PLUGIN_PREFIX)]
        if sdk is not None:
            # Check list of sdk
            sdk_list = [s.lower() for s in sdk]
            res_list = []
            for r in new_list:
                try:
                    if r.manifest.app.sdk in sdk_list:
                        res_list.append(r)
                except NoManifestException:
                    pass
            new_list = res_list

        return GitHubApps(new_list)

    def first(self, *args, **kwargs) -> Optional[AppRepository]:
        results = self.filter(*args, **kwargs)
        return results[0] if results else None


class GitHubLedgerHQ(PyGithub):
    def __init__(self, *args, **kwargs) -> None:
        super().__init__(*args, **kwargs)
        self._org = self.get_organization(LEDGER_ORG_NAME)
        self._apps: Optional[GitHubApps] = None

    @property
    def apps(self) -> GitHubApps:
        if self._apps is None:
            with patch("github.Repository.Repository", AppRepository):
                self._apps = GitHubApps(self._org.get_repos())
        return self._apps

    def get_app(self, name) -> AppRepository:
        """
        Fetch a specific application repository on GitHub.
        The name must be exact.
        """
        assert name.startswith("app-"), f"'{name}' is not prefixed with 'app-'!"
        with patch("github.Repository.Repository", AppRepository):
            return self._org.get_repo(name)
