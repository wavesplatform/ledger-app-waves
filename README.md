# nanos-app-waves

Waves wallet application for Ledger Nano S

# Introduction

This is a proof-of concept Ledger Nano S wallet app for Waves platform.

Special thanks to Jake B. for his support and advices.

# Building

You'll need a Ledger Nano S development environment.  More information can be 
found here: https://github.com/LedgerHQ/blue-devenv/ or in our wiki https://github.com/wavesplatform/nanos-app-waves/wiki

A modification to the current version of the python loader app may be required
depending on whether Ledger has released a new version or not.  More on this here:
https://github.com/lenondupe/ledger-app-stellar#troubleshooting


## Original description of Burst wallet

I say that it is proof of concept for a few reasons:

- I am not a cryptography or crypto-currency expert, and I could have introduced
  errors or security flaws into the code unintentionally. 

- I am knowingly using an ED25519 seed function to generate a Curve25519 keypair
  I think this is okay, and I'll discuss it more below, but I'm not sure. See
  "technical details" section below.

- Just in general, you shouldn't trust others with your crypto-currency.

Do not use this on your production Ledger Wallet.  I'm not responsible if you
lose your BURST or your other crypto-currencies on the same Ledger device. 

**I recommend using this only on a Ledger Nano explicitly earmarked for
'development' and one that does not contain keys for any crypto-currentcy you
care about.  Furthermore, I recommend it only for use on the Burstcoin
testnet**

As such, you agree to use this code AT YOUR OWN RISK:

The author provides the Work (and each Contributor provides its Contributions) on 
an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or 
implied, including, without limitation, any warranties or conditions of TITLE, 
NON-INFRINGEMENT, MERCHANTABILITY, or FITNESS FOR A PARTICULAR PURPOSE. You are 
solely responsible for determining the appropriateness of using or redistributing 
the Work and assume any risks associated with Your exercise of permissions under 
this License.

In no event and under no legal theory, whether in tort (including negligence),
contract, or otherwise, unless required by applicable law (such as deliberate 
and grossly negligent acts) or agreed to in writing, shall any Contributor be 
liable to You for damages, including any direct, indirect, special, incidental, 
or consequential damages of any character arising as a result of this License or 
out of the use or inability to use the Work (including but not limited to damages 
for loss of goodwill, work stoppage, computer failure or malfunction, or any and
all other commercial damages or losses), even if such Contributor has been 
advised of the possibility of such damages.

# License

Copyright (c) 2017-2018 Jake B. Updated by Waves community.

This application is based on example sources from Ledger that were released under
the Apache License, Version 2.0 and I have maintained this license for this app.

Other public domain materials, such as the Curve25519 sources, or implementations 
of known algorithms are also included.

# Technical Details

## Why I used a curve25519 library rather than internal functions

I spent some time trying to get the Ledger-provided keypair generation and curve
multiplication functions to do the necessary cryptographic singing necessary
for Burstcoin.

After some time, I gave up and just went with a library known to work.  I'm not
sure why the internal functions didn't work properly.  I tried all sorts of
combinations and endianess but never got a keypair that worked.  Possibilities
include:

- I was just doing something wrong, misunderstanding the SDK or the cryptography
- Keys and signatures may have been in a different format than Burst expects...
Possibly endianness or key format, I'm not an expert.
- Possibly Curve25519 is not fully implemented in the Ledger SDK
- Possible Burst uses a specific variant or dialect of Curve25519, and I'm not
aware.

## Why do I use the ED25519 key data generation function instead of Curve25519?

The Ledger smartly uses a system of entitlements for apps.  At load time, you 
need to declare which BIP39 keypaths and algorithms your app exepects to
generate.

This prevents a malicious or poorly secured app from generating keys or signing
transactions for a crypto-coin outside of the declared BIP39 keypath or for an
algorithm that is not explicitly needed by the Ledger app.

The function involved is called os_perso_derive_node_bip32:

     os_perso_derive_node_bip32(CX_CURVE_Ed25519, path, 5, privateKeyData, NULL);

I use CX_CURVE_Ed25519 because the entitlement system doesn't apparently
support the CX_CURVE_Curve25519 flag.

I think both ED25519 and Curve25591 expect the key data 'secret' to be a
265-byte integer... so I think this is okay... but I'm not an expert as to
whether this introduces security or cryptography problems.  Hence, I recommend
this for use on the testnet only at this time.

## Web Integration

Modifications to the PoCC Web Wallet for interfacing with the Ledger Nano S
can be found here: https://github.com/jake-b/burstcoin/tree/ledger

Note you need to enable "Web Browser" support in the app on the Ledger device
in order to switch from the standard communication protocol to the U2F 
protocol.

# Room for improvement

Lots of room to grow here.  I make no promises to move this forward.  I would
like to move my Ledger Nano from "Development" to "Production use" and that 
would halt my ability to develop.  I may get another unit for development 
eventually.

Some ideas for improvement:

- Peer review to make sure this is cryptographically sound and secure.
- Progress indicators on the device -- "Please Wait" screens etc, so the
user knows something is going on.
- Support for other types of transactions on the "Confirm Transaction" screen
currently it is very "Send Money" focused.
- A web developer should really look at the desktop/web stuff to fix and
improve the experience.
- Support for multiple wallets (derived wallets/addresses)

# Videos

Some videos on this project

[![Proof of Concept Hardware Wallet for Burstcoin Video](http://img.youtube.com/vi/8i87n5fAvWU/0.jpg)](http://www.youtube.com/watch?v=8i87n5fAvWU "Proof of Concept Hardware Wallet for Burstcoin")
[![Proof of Concept Burstcoin Ledger Web Wallet Integration Video](http://img.youtube.com/vi/7TjjhTY0eDU/0.jpg)](http://www.youtube.com/watch?v=7TjjhTY0eDU "Proof of Concept Burstcoin Ledger Web Wallet Integration")

# Support

Support this project by sending some BURST to: BURST-ZGEK-VQ86-M9FV-7SDWY
Again, no promises to future support or development, but thanks are appreciated.
