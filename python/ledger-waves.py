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
import struct
import sys
import pywaves.crypto as pwcrypto
import pywaves as pw
import time
import binascii
from amount_pb2 import Amount
from transaction_pb2 import Transaction, TransferTransactionData, Attachment
from recipient_pb2 import Recipient

global dongle
dongle = None

pw.setOffline()

# 'T' for testnet, 'W' for mainnet
chain_id = 'W'

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

def getVersionFromDongle():
    global dongle
    while (True):
        try:
            data_bytes = bytes(("8006000000").decode('hex'))
            data = dongle.exchange(data_bytes)
            return data[0:3]
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


def build_transfer_bytes(publicKey, recipient, asset, amount, attachment='', feeAsset='', txFee=100000, timestamp=0, version = b'\2'):
    if timestamp == 0:
        timestamp = int(time.time() * 1000)

    sData = b'\4'

    if version == b'\2':
        sData += version
        
    start_index = 31

    start_len = len(sData) + start_index
    field = base58.b58decode(publicKey)
    sData += field
    end_len = start_len + len(field)
    print('public key [{} - {}]'.format(start_len, end_len))
    
    start_len = len(sData) + start_index
    field = (b'\1' + base58.b58decode(asset.assetId) if asset else b'\0')
    sData += field
    end_len = start_len + len(field)
    print('asset [{} - {}]'.format(start_len, end_len))

    start_len = len(sData) + start_index
    field = (b'\1' + base58.b58decode(feeAsset.assetId) if feeAsset else b'\0')
    sData += field
    end_len = start_len + len(field)
    print('fee asset [{} - {}]'.format(start_len, end_len))

    start_len = len(sData) + start_index
    field = struct.pack(">Q", timestamp)
    sData += field
    end_len = start_len + len(field)
    print('timestamp [{} - {}]'.format(start_len, end_len))

    start_len = len(sData) + start_index
    field = struct.pack(">Q", amount)
    sData += field
    end_len = start_len + len(field)
    print('amount [{} - {}]'.format(start_len, end_len))

    start_len = len(sData) + start_index
    field = struct.pack(">Q", txFee)
    sData += field
    end_len = start_len + len(field)
    print('fee [{} - {}]'.format(start_len, end_len))

    start_len = len(sData) + start_index
    field = base58.b58decode(recipient.address)
    sData += field
    end_len = start_len + len(field)
    print('recipient [{} - {}]'.format(start_len, end_len))

    start_len = len(sData) + start_index
    field = struct.pack(">H", len(attachment))
    sData += field
    end_len = start_len + len(field)
    print('attachment size [{} - {}]'.format(start_len, end_len))

    start_len = len(sData) + start_index
    field = pwcrypto.str2bytes(attachment)
    sData += field
    end_len = start_len + len(field)
    print('attachment [{} - {}]'.format(start_len, end_len))

    return sData

def build_transfer_protobuf(publicKey, recipient, asset, amount, attachment='', feeAsset='', txFee=100000, timestamp=0, version = 2):
    if timestamp == 0:
        timestamp = int(time.time() * 1000)
    msg = Attachment(string_value = attachment)
    to = Recipient(public_key_hash=base58.b58decode(recipient.address))
    amountTx= Amount(asset_id=base58.b58decode(asset.assetId), amount=amount)
    transfer = TransferTransactionData(recipient=to, amount=amountTx, attachment=msg)
    fee = Amount(asset_id=(base58.b58decode(feeAsset.assetId) if feeAsset else b''), amount=txFee)
    trx = Transaction(chain_id=87, sender_public_key=base58.b58decode(publicKey), fee=fee, timestamp=timestamp, version=version, transfer=transfer)
    return trx.SerializeToString()

build_transfer_protobuf('4ovEU8YpbHTurwzw8CDZaCD7m6LpyMTC4nrJcgDHb4Jh',
                                                   pw.Address('3PMpANFyKGBwzvv1UVk2KdN23fJZ8sXSVEK'),
                                                   pw.Asset('9gqcTyupiDWuogWhKv8G3EMwjMaobkw9Lpys4EY2F62t'), 1,
                                                   'privet', timestamp = 1526477921829)
        

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
    print(colors.fg.white + "\t 3. Get app version from Ledger Nano S" + colors.reset)
    print(colors.fg.white + "\t 4. Sign protobuf tx using Ledger Nano S" + colors.reset)
    print(colors.fg.white + "\t 5. Exit" + colors.reset)
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
        # fee: 0.001
        # fee asset: WAVES
        some_transfer_bytes = build_transfer_bytes('4ovEU8YpbHTurwzw8CDZaCD7m6LpyMTC4nrJcgDHb4Jh',
                                                   pw.Address('3PMpANFyKGBwzvv1UVk2KdN23fJZ8sXSVEK'),
                                                   pw.Asset('9gqcTyupiDWuogWhKv8G3EMwjMaobkw9Lpys4EY2F62t'), 1,
                                                   'privet', timestamp = 1526477921829)
        input = raw_input(colors.fg.lightblue + "Please input message to sign (for example \"" + base58.b58encode(
            str(some_transfer_bytes)) + "\")> " + colors.reset)
        if len(input) == 0:
            # 2 first bytes aren't the tx data, but info type for the ledger
            print(len(some_transfer_bytes))
            binary_data += b'\4\2'
            binary_data += struct.pack(">I", len(some_transfer_bytes))
            binary_data += some_transfer_bytes
            binary_data += some_transfer_bytes
            print(colors.fg.lightgrey + "tx bytes:   " + base58.b58encode(str(some_transfer_bytes)))
        else:
            binary_input = base58.b58decode(input)
            binary_data += struct.pack(">I", len(binary_input))
            binary_data += binary_input
            binary_data += binary_input
            print(colors.fg.lightgrey + "tx bytes:   " + base58.b58encode(str(binary_input)))
        print(colors.fg.lightgrey + "all request bytes:   " + base58.b58encode(str(binary_data)))
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
    elif (select == "3"):
        version = getVersionFromDongle()
        print('App version is {}.{}.{}'.format(version[0],version[1],version[2]))
    elif (select == "4"):
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
        # fee: 0.001
        # fee asset: WAVES
        some_transfer_bytes = build_transfer_protobuf('4ovEU8YpbHTurwzw8CDZaCD7m6LpyMTC4nrJcgDHb4Jh',
                                                   pw.Address('3PMpANFyKGBwzvv1UVk2KdN23fJZ8sXSVEK'),
                                                   pw.Asset('9gqcTyupiDWuogWhKv8G3EMwjMaobkw9Lpys4EY2F62t'), 1,
                                                   'privet', timestamp = 1526477921829)
        #some_transfer_bytes = b"0aa40108571220b985d724da1564a6354040b1718b8c8e8c59533a20b71ba3c64d5dfe7f379f381a270a200080800142003a8024017fef3519e54affbcae5c01347f648064019b0081c92c10d2b9ea0a20f398cdf7b3ca8fd03e2802c206480a160a1496639366f56efd312248d1edf056070fd5b8941c122a0a204a83e780ff016100147f073b2580ff80ffb9eba30087f400cdb2dc3b5d017c4e1099eebaf4c6b2121a021a00121100d716230100d88280edcdc30ce97f64ed122001807701fd7f01d37fb87f88ffbe01c0ff01ff010005afffcb7fb201a0f4b974122c8c8000ff0a7fff8015381f807801c1007f7f01d700c521ff018dc700017f80807680097f39378e01b500804f122980099e8b80ffff00ad2500870080017f7f880b2ca72e7fff175a00f0da00ff00803dbd2bff8000995c"
        some_transfer_bytes = base58.b58decode("uq4YDsWuUhQ2ajpzvHxWeikWkF8XodVWi8F1VdYsqFESLGc2k6g5UvtxVrER4a")
        input = raw_input(colors.fg.lightblue + "Please input message to sign (for example \"" + base58.b58encode(
            str(some_transfer_bytes)) + "\")> " + colors.reset)
        if len(input) == 0:
            # 2 first bytes aren't the tx data, but info type for the ledger
            binary_data += b'\4\2'
            binary_data += struct.pack(">I", len(some_transfer_bytes))
            binary_data += some_transfer_bytes
            binary_data += some_transfer_bytes
            print(colors.fg.lightgrey + "tx bytes:   " + base58.b58encode(str(some_transfer_bytes)))
        else:
            binary_input = base58.b58decode(input)
            binary_data += struct.pack(">I", len(binary_input))
            binary_data += binary_input
            binary_data += binary_input
            print(colors.fg.lightgrey + "tx bytes:   " + base58.b58encode(str(binary_input)))
        print(colors.fg.lightgrey + "all request bytes:   " + base58.b58encode(str(binary_data)))
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
