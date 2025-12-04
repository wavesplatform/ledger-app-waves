import pytest
from ragger.bip import pack_derivation_path
from ragger.backend.interface import BackendInterface
from ragger.navigator.navigation_scenario import NavigateWithScenario
from ragger.error import ExceptionRAPDU
from ragger.backend.interface import BackendInterface

from application_client.boilerplate_command_sender import BoilerplateCommandSender, Errors
from application_client.boilerplate_response_unpacker import unpack_get_public_key_response


# In this test we check that the GET_PUBLIC_KEY works in non-confirmation mode
# 80 04 00 57 14 8000002c80579bfc800000008000000080000001
# 80 04 00 57 15 05 8000002c80579bfc800000008000000000000001
def test_get_public_key_no_confirm(backend: BackendInterface) -> None:
    path_list = [
        "m/44'/5741564'/0'/0'/1'",
    ]
    for path in path_list:
        client = BoilerplateCommandSender(backend)
        data=pack_derivation_path(path)[1:]
        response = client.get_public_key(chain_id=ord("W"), data=data)
        public_key, address_bytes = parse_response(response.data)
        sw = response.status

        assert sw == 0x9000
        assert len(public_key) == 32
        assert len(address_bytes) == 35


def test_get_public_key_confirm_refused(backend: BackendInterface, scenario_navigator: NavigateWithScenario) -> None:
    client = BoilerplateCommandSender(backend)
    path = "m/44'/5741564'/0'/0'/1'"
    data=pack_derivation_path(path)[1:]

    with pytest.raises(ExceptionRAPDU) as e:
        with client.get_public_key_with_confirmation(chain_id=ord("W"), data=data):
            scenario_navigator.address_review_reject()

    # Assert that we have received a refusal
    assert e.value.status == Errors.SW_DENY
    assert len(e.value.data) == 0

# In this test we check that the GET_PUBLIC_KEY works in confirmation mode
def test_get_public_key_confirm_accepted(backend: BackendInterface, scenario_navigator: NavigateWithScenario) -> None:
    client = BoilerplateCommandSender(backend)
    path = "m/44'/5741564'/0'/0'/1'"
    data=pack_derivation_path(path)[1:]
    with client.get_public_key_with_confirmation(chain_id=ord("W"), data=data):
        scenario_navigator.address_review_approve()

    response = client.get_async_response()
    public_key, address_bytes = parse_response(response.data)
    sw = response.status

    assert sw == 0x9000
    assert len(public_key) == 32
    assert len(address_bytes) == 35

def parse_response(response: bytes):
    if len(response) < 32 + 35:
        raise ValueError(f"Response too short {len(response)}")

    public_key = response[:32]
    address_bytes = response[32:32+35]

    return public_key, address_bytes