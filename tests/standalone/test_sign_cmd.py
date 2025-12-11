from ragger.backend.interface import BackendInterface
from ragger.navigator.navigation_scenario import NavigateWithScenario
from ragger.navigator import Navigator, NavInsID, NavIns
from application_client.waves_sign_data import WavesSignData
from application_client.waves_signature import ed25519_verify
from application_client.async_exec import run_with_delay

# In this tests we check the behavior of the device when asked to sign a transaction
path = "m/44'/5741564'/0'/0'/1'"
chain_id = ord("W")  # Mainnet

# In this test we send to the device a transaction to sign and validate it on screen
# The transaction is short and will be sent in one chunk
# We will ensure that the displayed information is correct by using screenshots comparison
def test_sign_data(backend: BackendInterface, navigator: Navigator,
                      test_name: str,
                      default_screenshot_path: str) -> None:
    # Use the app interface instead of raw interface
    client = WavesSignData(backend)
    # The path used for this entire test
    data=client.pack_derivation_path(path)
    response = client.get_public_key(chain_id=chain_id, data=data)
    public_key, _ = client.parse_pk_response(response.data)
    # Create the transaction that will be sent to the device for signing
    sign_data = bytes("test data to sign", "utf-8")

    instructions = [
                NavIns(NavInsID.RIGHT_CLICK),
                NavIns(NavInsID.RIGHT_CLICK),
                NavIns(NavInsID.RIGHT_CLICK),
                NavIns(NavInsID.BOTH_CLICK),
            ]
    
    def review_approve():
        try:
            navigator.navigate_and_compare(default_screenshot_path, test_name, instructions,
                                   screen_change_before_first_instruction=False)
        except Exception as e:
            print(f"Screenshot comparison failed: {e}")
        print("Approving on device")

    def signing():
        return  client.sign_custom_data(path=path, data=sign_data, chain_id=chain_id)

    response = run_with_delay(signing,  review_approve, delay=3.0)

    assert response is not None
    # Verify the signature

    isTrue = ed25519_verify(signature=response.data,
                                   data=sign_data,
                                   public_key=public_key)
    assert isTrue

