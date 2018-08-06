#!/usr/bin/env python2.7
# *******************************************************************************
# *   Ledger Blue
# *   (c) 2016 Ledger
# *
# *  Licensed under the Apache License, Version 2.0 (the "License");
# *  you may not use this file except in compliance with the License.
# *  You may obtain a copy of the License at
# *
# *      http://www.apache.org/licenses/LICENSE-2.0
# *
# *  Unless required by applicable law or agreed to in writing, software
# *  distributed under the License is distributed on an "AS IS" BASIS,
# *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# *  See the License for the specific language governing permissions and
# *  limitations under the License.
# ********************************************************************************
from ledgerblue.comm import getDongle
from ledgerblue.commException import CommException
import base58
import hashlib
import struct
import sys
import pywaves.crypto as pwcrypto
import pywaves as pw
import time

global dongle
dongle = None

pw.setOffline()

chain_id = 'T'

class colors:
    '''Colors class:
    reset all colors with colors.reset
    two subclasses fg for foreground and bg for background.
    use as colors.subclass.colorname.
    i.e. colors.fg.red or colors.bg.green
    also, the generic bold, disable, underline, reverse, strikethrough,
    and invisible work with the main class
    i.e. colors.bold
    '''
    reset = '\033[0m'
    bold = '\033[01m'
    disable = '\033[02m'
    underline = '\033[04m'
    reverse = '\033[07m'
    strikethrough = '\033[09m'
    invisible = '\033[08m'

    class fg:
        black = '\033[30m'
        red = '\033[31m'
        green = '\033[32m'
        orange = '\033[33m'
        blue = '\033[34m'
        purple = '\033[35m'
        cyan = '\033[36m'
        white = '\033[37m'
        lightgrey = '\033[90m'
        lightred = '\033[91m'
        lightgreen = '\033[92m'
        yellow = '\033[93m'
        lightblue = '\033[94m'
        pink = '\033[95m'
        lightcyan = '\033[96m'

    class bg:
        black = '\033[40m'
        red = '\033[41m'
        green = '\033[42m'
        orange = '\033[43m'
        blue = '\033[44m'
        purple = '\033[45m'
        cyan = '\033[46m'
        lightgrey = '\033[47m'


def getKeysFromDongle(path, networkByte):
    global dongle
    while (True):
        try:
            data_bytes = bytes(("800400" + '{0:x}'.format(ord(networkByte)) + "14").decode('hex')) + path_to_bytes(path)
            data = dongle.exchange(data_bytes)
            return [data[0:32], data[32:67]]
        except CommException as e:
            if (e.sw == 0x6985):
                print(colors.fg.red + "Required condition failed." + colors.reset)
            if (e.sw == 0x9100):
                print(colors.fg.red + "User denied signing request on Ledger Nano S device." + colors.reset)
            break
        except Exception as e:
            raw_input(
                "An error occurred while processing the request, repeat or correct your request (note what all the bip32 path parts should be hardened)")
            sys.exc_clear()
            break

# 128 - 5 service bytes
CHUNK_SIZE = 123
PRIME_DERIVATION_FLAG = 0x80000000


def path_to_bytes(path):
    return ''.join([struct.pack(">I", n) for n in path])


def convert_prime(n):
    # Convert minus signs to uint32 with flag
    return [int(abs(x) | PRIME_DERIVATION_FLAG) if x < 0 else x for x in n]


def expand_path(n):
    # Convert string of bip32 path to list of uint32 integers with prime flags
    # 0/-1/1' -> [0, 0x80000001, 0x80000001]
    if not n:
        return []

    n = n.split('/')

    # m/a/b/c => a/b/c
    if n[0] == 'm':
        n = n[1:]

    path = []
    for x in n:
        prime = False
        if x.endswith("'"):
            x = x.replace('\'', '')
            prime = True
        if x.startswith('-'):
            prime = True

        x = abs(int(x))

        if prime:
            x |= PRIME_DERIVATION_FLAG

        path.append(x)

    return path


def build_transfer_bytes(publicKey, recipient, asset, amount, attachment='', feeAsset='', txFee=100000, timestamp=0):
    if timestamp == 0:
        timestamp = int(time.time() * 1000)
    sData = b'\4' + \
            base58.b58decode(publicKey) + \
            (b'\1' + base58.b58decode(asset.assetId) if asset else b'\0') + \
            (b'\1' + base58.b58decode(feeAsset.assetId) if feeAsset else b'\0') + \
            struct.pack(">Q", timestamp) + \
            struct.pack(">Q", amount) + \
            struct.pack(">Q", txFee) + \
            base58.b58decode(recipient.address) + \
            struct.pack(">H", len(attachment)) + \
            pwcrypto.str2bytes(attachment)
    return sData


while (True):
    while (dongle == None):
        try:
            dongle = getDongle(True)
        except Exception as e:
            answer = raw_input(
                "Please connect your Ledger Nano S, unlock, and launch the Waves app. Press <enter> when ready. (Q quits)")
            if (answer.upper() == 'Q'):
                sys.exit(0)
            sys.exc_clear()

    print("")
    print(colors.fg.lightcyan + colors.bold + "Ledger Nano S - Waves test app" + colors.reset)
    print(colors.fg.white + "\t 1. Get PublicKey/Address from Ledger Nano S" + colors.reset)
    print(colors.fg.white + "\t 2. Sign tx using Ledger Nano S" + colors.reset)
    print(colors.fg.white + "\t 3. Exit" + colors.reset)
    select = raw_input(colors.fg.cyan + "Please select> " + colors.reset)

    if (select == "1"):
        path = raw_input(
            colors.fg.lightblue + "Please input BIP-32 path (for example \"44'/5741564'/0'/0'/1'\")> " + colors.reset)
        if len(path) == 0:
            path = "44'/5741564'/0'/0'/1'"
        keys = getKeysFromDongle(expand_path(path), chain_id)
        if keys:
            publicKey = keys[0]
            address = keys[1]

            print(colors.fg.blue + "publicKey (base58): " + colors.reset + base58.b58encode(str(publicKey)))
            print(colors.fg.blue + "address: " + colors.reset + address)
    elif (select == "2"):
        path = raw_input(
            colors.fg.lightblue + "Please input BIP-32 path (for example \"44'/5741564'/0'/0'/1'\")> " + colors.reset)
        if len(path) == 0:
            path = "44'/5741564'/0'/0'/1'"
        binary_data = path_to_bytes(expand_path(path))
        print(colors.fg.lightgrey + "path bytes: " + base58.b58encode(str(path_to_bytes(expand_path(path)))))

        # tx amount asset decimals
        binary_data += chr(8)
        # fee amount asset decimals
        binary_data += chr(8)

        # Tx info
        #
        # amount: 1
        # asset: 9gqcTyupiDWuogWhKv8G3EMwjMaobkw9Lpys4EY2F62t
        # from: 3PDCeakWckRvK5vVeJnCy1R2rE1utBcJMwt
        # to: 3PMpANFyKGBwzvv1UVk2KdN23fJZ8sXSVEK
        # attachment: privet
        # fee: 1
        # fee asset: WAVES
        # tx id: 7ij6k6kaPYobHmzv8TLTs64wWL8o8mCoKnCJctRa2MKm
        some_transfer_bytes = build_transfer_bytes('4ovEU8YpbHTurwzw8CDZaCD7m6LpyMTC4nrJcgDHb4Jh',
                                                   pw.Address('3PMpANFyKGBwzvv1UVk2KdN23fJZ8sXSVEK'),
                                                   pw.Asset('9gqcTyupiDWuogWhKv8G3EMwjMaobkw9Lpys4EY2F62t'), 1,
                                                   'privet', timestamp = 1526477921829)
        input = raw_input(colors.fg.lightblue + "Please input message to sign (for example \"" + base58.b58encode(
            str(some_transfer_bytes)) + "\")> " + colors.reset)
        if len(input) == 0:
            binary_data += some_transfer_bytes
            print(colors.fg.lightgrey + "tx bytes:   " + base58.b58encode(str(some_transfer_bytes)))
        else:
            binary_data += base58.b58decode(input)
            print(colors.fg.lightgrey + "tx bytes:   " + base58.b58encode(str(input)))
        signature = None
        while (True):
            try:
                offset = 0
                while offset != len(binary_data):
                    if (len(binary_data) - offset) > CHUNK_SIZE:
                        chunk = binary_data[offset: offset + CHUNK_SIZE]
                    else:
                        chunk = binary_data[offset:]
                    if (offset + len(chunk)) == len(binary_data):
                        p1 = 0x80
                    else:
                        p1 = 0x00

                    if (offset == 0):
                        print("Waiting for approval to sign on the Ledger Nano S")

                    apdu = bytes("8002".decode('hex')) + chr(p1) + chain_id + chr(len(chunk)) + bytes(chunk)
                    signature = dongle.exchange(apdu)
                    offset += len(chunk)
                print("signature " + base58.b58encode(str(signature)))
                break
            except CommException as e:
                if (e.sw == 0x6990):
                    print(colors.fg.red + "Transaction buffer max size reached." + colors.reset)
                if (e.sw == 0x6985):
                    print(colors.fg.red + "Required condition failed." + colors.reset)
                if (e.sw == 0x9100):
                    print(colors.fg.red + "User denied signing request on Ledger Nano S device." + colors.reset)
                break
            except Exception as e:
                print(e, type(e))
                answer = raw_input(
                    "Please connect your Ledger Nano S, unlock, and launch the Waves app. Press <enter> when ready. (Q quits)")
                if (answer.upper() == 'Q'):
                    sys.exit(0)
                sys.exc_clear()
    else:
        break
