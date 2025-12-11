from ragger.backend.interface import BackendInterface
from ragger.navigator.navigation_scenario import NavigateWithScenario
from ragger.navigator import Navigator, NavInsID, NavIns
from application_client.waves_sign_data import WavesSignData
from application_client.waves_signature import ed25519_verify
from application_client.async_exec import run_with_delay
import base58

# In this tests we check the behavior of the device when asked to sign a transaction
path = "m/44'/5741564'/0'/0'/1'"
chain_id = ord("W")  # Mainnet

issureTx = "35jNzE6skuWXZoQm3KhFiBM7NTYAQmdu9vhBtDV7Ci758wLkVWnydramgWsqV7pZrUATXNZPUevoxmvsYXY3d3796brt3BxDW8SLMN753bsu3uuB66BAn5qTUZeE"
burnTx = "5A6iNM7VcV1ACsUfX5TMVuvAxiFKsJNivpuKxF7AeeUwf3nDrroPZF51fvhhiFYJW48e2DTU4YyUGE1erPKy6Yxa2yuCVfVk9W6PtjzJEeken1ACyiZWK9wNycvG"
createAliasTx = "9a3QP78ieDtPMP4YUFSUK3DMMPpj7W69eDL2gaBBuQfaxgfHjoNp9uyf4gR8y6H6UnpzLiSJKwoyoYohSeS6wmpTEeRnAn19WU"
transferTx = "5mdX5STSX6YMAbiXGDkDbnqpU6CdTi6gXzUF9MP8ngUK3VfePKq861HdBr7CaDkXeZJTAAyQAuHQD12XHrk2jXbzneMQNQ6sLeHQCSASCZ5mhPSrA4fo847RPbHigL8m3tnEwrzY26iABveZknh4wKp7A35ELBE7MaFQNZhRhxBRRYxYkD9XzCkwZPhDUxw1UWcdFhjfeSCg9281pYqEQN"
# In this test we send to the device a transaction to sign and validate it on screen
# The transaction is short and will be sent in one chunk
# We will ensure that the displayed information is correct by using screenshots comparison

def sign_tx(tx: str, data_version: int, client: WavesSignData, navigator: Navigator, test_name: str,
                      default_screenshot_path: str, public_key: bytes, tx_type: int, amountPrecision: int = 8, amount2Precision: int = 0, feePrecision: int = 8, steps=3) -> None:
    sign_data = base58.b58decode(tx)

    instructions = instructions = ([NavIns(NavInsID.RIGHT_CLICK) for _ in range(steps)] + [NavIns(NavInsID.BOTH_CLICK)])
    
    def review_approve():
        try:
            navigator.navigate_and_compare(default_screenshot_path, test_name, instructions,
                                   screen_change_before_first_instruction=False)
        except Exception as e:
            print(f"Screenshot comparison failed: {e}")

    response = run_with_delay(lambda: client.sign_tx(path=path, tx_type=tx_type, data_version=data_version, data=sign_data, chain_id=chain_id, amountPrecision=amountPrecision, amount2Precision=amount2Precision, feePrecision=feePrecision),  review_approve, delay=1.0)
    assert response is not None
    # Verify the signature

    isTrue = ed25519_verify(signature=response.data,
                                   data=sign_data,
                                   public_key=public_key)
    assert isTrue


def test_sign_transfer_v2(backend: BackendInterface, navigator: Navigator,
                      test_name: str,
                      default_screenshot_path: str) -> None:
    # Use the app interface instead of raw interface
    client = WavesSignData(backend)
    # The path used for this entire test
    data=client.pack_derivation_path(path)
    response = client.get_public_key(chain_id=chain_id, data=data)
    public_key, _ = client.parse_pk_response(response.data)
    # Create the transaction that will be sent to the device for signing

    sign_tx(tx=transferTx, data_version=2, client=client, navigator=navigator, test_name=test_name, default_screenshot_path=default_screenshot_path, public_key=public_key, tx_type=4, amountPrecision=8, amount2Precision=0, feePrecision=8, steps=9)    


def test_sign_issure_v2(backend: BackendInterface, navigator: Navigator,
                      test_name: str,
                      default_screenshot_path: str) -> None:
    # Use the app interface instead of raw interface
    client = WavesSignData(backend)
    # The path used for this entire test
    data=client.pack_derivation_path(path)
    response = client.get_public_key(chain_id=chain_id, data=data)
    public_key, _ = client.parse_pk_response(response.data)
    # Create the transaction that will be sent to the device for signing

    sign_tx(tx=issureTx, data_version=2, client=client, navigator=navigator, test_name=test_name, default_screenshot_path=default_screenshot_path, public_key=public_key, tx_type=3)


def test_sign_burn_v2(backend: BackendInterface, navigator: Navigator,
                      test_name: str,
                      default_screenshot_path: str) -> None:
    # Use the app interface instead of raw interface
    client = WavesSignData(backend)
    # The path used for this entire test
    data=client.pack_derivation_path(path)
    response = client.get_public_key(chain_id=chain_id, data=data)
    public_key, _ = client.parse_pk_response(response.data)
    # Create the transaction that will be sent to the device for signing

    sign_tx(tx=burnTx, data_version=2, client=client, navigator=navigator, test_name=test_name, default_screenshot_path=default_screenshot_path, public_key=public_key, tx_type=6)

def test_sign_create_alias_v2(backend: BackendInterface, navigator: Navigator,
                      test_name: str,
                      default_screenshot_path: str) -> None:
    # Use the app interface instead of raw interface
    client = WavesSignData(backend)
    # The path used for this entire test
    data=client.pack_derivation_path(path)
    response = client.get_public_key(chain_id=chain_id, data=data)
    public_key, _ = client.parse_pk_response(response.data)
    # Create the transaction that will be sent to the device for signing

    sign_tx(tx=createAliasTx, data_version=2, client=client, navigator=navigator, test_name=test_name, default_screenshot_path=default_screenshot_path, public_key=public_key, tx_type=10)


