from ledgered.devices import Device
from ragger.navigator import Navigator, NavInsID


# In this test we check the behavior of the device main menu
def test_app_mainmenu(device: Device,
                      navigator: Navigator,
                      test_name: str,
                      default_screenshot_path: str) -> None:
    # Navigate in the main menu
    instructions = []
    if device.is_nano:
        instructions += [
            NavInsID.RIGHT_CLICK,
            NavInsID.RIGHT_CLICK
        ]

    assert len(instructions) > 0
    navigator.navigate_and_compare(default_screenshot_path, test_name, instructions,
                                   screen_change_before_first_instruction=False)
