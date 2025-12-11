from enum import IntEnum
from ragger.backend.interface import BackendInterface

from application_client.boilerplate_response_unpacker import unpack_get_app_name_response

from .utils import verify_name

CLA: int = 0x80

class InsType(IntEnum):
    GET_VERSION    = 0x06
    GET_APP_NAME   = 0x08
    GET_PUBLIC_KEY = 0x04
    SIGN_TX        = 0x02
    
class P1(IntEnum):
    # Parameter 1 for first APDU number.
    P1_START = 0x00
    # Parameter 1 for maximum APDU number.
    P1_MAX   = 0x03
    # Parameter 1 for screen confirmation for GET_PUBLIC_KEY.
    P1_CONFIRM = 0x01

class P2(IntEnum):
    # Parameter 2 for last APDU to receive.
    P2_LAST = 0x00
    # Parameter 2 for more APDU to receive.
    P2_MORE = 0x80

# 8006000000
# In this test we check that the GET_APP_NAME replies the application name
def test_app_name(backend: BackendInterface) -> None:
    # Use the app interface instead of raw interface
    response = backend.exchange(cla=CLA,
                                     ins=InsType.GET_APP_NAME,
                                     p1=P1.P1_START,
                                     p2=P2.P2_LAST,
                                     data=b"")
    verify_name(unpack_get_app_name_response(response.data))

