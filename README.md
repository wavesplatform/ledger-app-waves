# nanos-app-waves 🔷 [![Build Status](https://travis-ci.com/wavesplatform/nanos-app-waves.svg?branch=master)](https://travis-ci.com/wavesplatform/nanos-app-waves)

# Introduction

This is a Ledger devices wallet app for Waves platform.

Special thanks to Jean Passot and Oto from the Ledger team, Jake Bordens from the Ledger/Birst community for their support and advices.

# Building 👷

You'll need a Ledger Nano S development environment.  More information can be 
found [here](https://github.com/wavesplatform/nanos-app-waves/wiki).

Also there're [my ledger dev env docker image](https://github.com/Tolsi/ledger-devenv), you can use it to build it.

## Nano S

```rm -rf bin/ debug/ dep/ obj/ app.hex src/glyphs.c src/glyphs.h && make BOLOS_ENV=/opt/ledger/ BOLOS_SDK=/home/nanos-secure-sdk```

## Nano X

```rm -rf bin/ debug/ dep/ obj/ app.hex src/glyphs.c src/glyphs.h && make BOLOS_ENV=/opt/ledger/ BOLOS_SDK=/home/ledger/sdk-nanox-1.2.4-1.3```

## Blue

```rm -rf bin/ debug/ dep/ obj/ app.hex src/glyphs.c src/glyphs.h && make BOLOS_ENV=/opt/ledger/ BOLOS_SDK=/home/blue-secure-sdk/```

# Installation 📲

You can download the official version of this application, signed and verified by the Ledger team, from [the official Ledger Live application](https://www.ledger.com/ledger-live).

Building and installing from the source code is usually required in order to develop or customize the application. In addition, you will receive a warning that this application was received from an unreliable source. Try to avoid this, it may be unsafe.

## Nano S

```python -m ledgerblue.loadApp --appFlags 0x240 --path "44'/5741564'" --curve secp256k1 --curve ed25519 --tlv --targetId 0x31100004 --delete --fileName bin/app.hex --appName Waves --appVersion 1.0.1 --dataSize 64 --icon 010000000000ffffffffffffff7ffe3ffc1ff80ff007e003c003c007e00ff01ff83ffc7ffeffffffff```

## Nano X

Note that at the time of publication of this manual (March 2020), the installation of your applications is possible only on special devices for developers.

```python -m ledgerblue.loadApp --appFlags 0x240 --path "44'/5741564'" --curve secp256k1 --curve ed25519 --tlv --targetId 0x33000004 --delete --fileName bin/app.hex --appName "Waves" --appVersion 1.0.1 --dataSize 256 --icon 010000000000ffffff000030001ec00ff807ffe3fff97ffc0ffe013f8007c0000000```

## Blue

```python -m ledgerblue.loadApp --appFlags 0x240 --path "44'/5741564'" --curve secp256k1 --curve ed25519 --tlv --targetId 0x31010004 --delete --fileName bin/app.hex --appName "Waves" --appVersion 1.0.1 --dataSize 0x0000000000000100 --icon 04f9efe900f9f9f900fadaca00fae4da00fbbb9b00fc9c6c00fcb18c00fd925d00fe7e3e00fe691e00ff5f0f00ffc0a000ffe0d000ff601000ffffff00ff55000011111111112176f8ffffffffffffffffff8f671211111111111111111153f9ffffffffffffffffffffffffff9f351111111111111150ffffffffffffffffffffffffffffffffff05111111111121faffffffffffffffffffffffffffffffffffaf1211111111f4ffffffffffffffffffffffffffffffffffffff4f11111121ffffffffffffffffffffffffffffffffffffffffff121111a0ffffffffffffffffffffffffffffffffffffffffff0a1111f5ffffffffffffffffffffffffffffffffffffffffff5f1131ffffffffffffffffffffffddffffffffffffffffffffff1351ffffffffffffffffffffdfccfdffffffffffffffffffff1591ffffffffffffffffffffcdeedcffffffffffffffffffff19f2ffffffffffffffffffdfeceecefdffffffffffffffffff2ff6ffffffffffffffffffcdeebbeedcffffffffffffffffff6ff7ffffffffffffffffdfecbeffebcefdffffffffffffffff7ff8ffffffffffffffffcdeefbffbfeedcffffffffffffffff8fffffffffffffffffdfecbeffffffebcefdffffffffffffffffffffffffffffffffcdeefbffffffbfeedcffffffffffffffffffffffffffffffdfecbeffffffffffebcefdffffffffffffffffffffffffffffcdeefbffffffffffbfeedcffffffffffffffffffffffffffdfecbeffffffffffffffebcefdffffffffffffffffffffffffcdeefbffffffffffffffbfeedcffffffffffffffffffffffdfecbeffffffffffffffffffebcefdffffffffffffffffffffcdeefbffffffffffffffffffbfeedcffffffffffffffffffdfecbeffffffffffffffffffffffebcefdffffffffffffffffcdeefbffffffffffffffffffffffbfeedcffffffffffffffffcdeefbffffffffffffffffffffffbfeedcffffffffffffffffdfecbeffffffffffffffffffffffebcefdffffffffffffffffffcdeefbffffffffffffffffffbfeedcffffffffffffffffffffdfecbeffffffffffffffffffebcefdffffffffffffffffffffffcdeefbffffffffffffffbfeedcffffffffffffffffffffffffdfecbeffffffffffffffebcefdffffffffffffffffffffffffffcdeefbffffffffffbfeedcffffffffffffffffffffffffffffdfecbeffffffffffebcefdffffffffffffffffffffffffffffffcdeefbffffffbfeedcffffffffffffffffffffffffffffffffdfecbeffffffebcefdfffffffffffffffff8ffffffffffffffffcdeefbffbfeedcffffffffffffffff8ff7ffffffffffffffffdfecbeffebcefdffffffffffffffff7ff6ffffffffffffffffffcdeebbeedcffffffffffffffffff6ff2ffffffffffffffffffdfeceecefdffffffffffffffffff2f91ffffffffffffffffffffcdeedcffffffffffffffffffff1951ffffffffffffffffffffdfccfdffffffffffffffffffff1531ffffffffffffffffffffffddffffffffffffffffffffff1311f5ffffffffffffffffffffffffffffffffffffffffff5f1111a0ffffffffffffffffffffffffffffffffffffffffff0a111121ffffffffffffffffffffffffffffffffffffffffff12111111f4ffffffffffffffffffffffffffffffffffffff4f1111111121faffffffffffffffffffffffffffffffffffaf12111111111150ffffffffffffffffffffffffffffffffff051111111111111153f9ffffffffffffffffffffffffff9f351111111111111111112176f8ffffffffffffffffff8f67121111111111```

# Debugging 🙇

To simplify the development and debugging process, it is recommended to follow [the Ledger debugging instructions](https://ledger.readthedocs.io/en/latest/userspace/debugging.html). All this has been tested only with the Ledger Nano S.

1. Install a debug firmware (according to the instructions above)
2. Install a custom CA for PIN bypass (according to the instructions above)
3. Build and use USBTool (according to the instructions above). 

  Hint: before that on Mac OS X you should install a `libusb-compat` package: `brew install libusb-compat`, then just call `make clean && make` from the app root

4. Change debug flag in `Makefile` to `DEBUG = 1`
5. Build and install the app adding the `--rootPrivateKey` key from the second step

  Now the device should ask you only one confirmation instead of several! Take care of your buttons, fingers and time 😊

6. Start `usbtool` on the PC, then your app on Ledger device, send some APDU and look at the debug output in `usbtool` stdout!
7. Check [the Ledger device emulator](https://github.com/LedgerHQ/speculos), but at the time of writing (March 2020), it does not support most system calls.

Happy hacking!
