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
import base64
import order_pb2 as opb
from amount_pb2 import Amount
import transaction_pb2 as tpb
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
            data_bytes = bytes(
                ("800400" + '{0:x}'.format(ord(networkByte)) + "14").decode('hex')) + path_to_bytes(path)
            data = dongle.exchange(data_bytes)
            return [data[0:32], data[32:67]]
        except CommException as e:
            if (e.sw == 0x6985):
                print(colors.fg.red + "Required condition failed." + colors.reset)
            if (e.sw == 0x9100):
                print(
                    colors.fg.red + "User denied signing request on Ledger Nano S device." + colors.reset)
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
                print(
                    colors.fg.red + "User denied signing request on Ledger Nano S device." + colors.reset)
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


def build_transfer_bytes(publicKey, recipient, asset, amount, attachment='', feeAsset='', txFee=100000, timestamp=0, version=b'\2'):
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


def build_transfer_protobuf(publicKey, recipient, asset, amount, attachment='', feeAsset='', txFee=100000, timestamp=0, version=3):
    if timestamp == 0:
        timestamp = int(time.time() * 1000)
    to = Recipient(public_key_hash=base58.b58decode(recipient))
    amountTx = Amount(asset_id=(base58.b58decode(
        asset.assetId) if asset else b'\0'), amount=amount)
    transfer = tpb.TransferTransactionData(
        recipient=to, amount=amountTx, attachment=attachment)
    fee = Amount(asset_id=(base58.b58decode(feeAsset.assetId)
                           if feeAsset else b'\0'), amount=txFee)
    trx = tpb.Transaction(chain_id=87, sender_public_key=base58.b58decode(
        publicKey), fee=fee, timestamp=timestamp, version=version, transfer=transfer)
    return trx.SerializeToString()


def build_masstransfer_protobuf(publicKey, recipient, asset, amount, attachment='', feeAsset='', txFee=100000, timestamp=0, version=3):
    if timestamp == 0:
        timestamp = int(time.time() * 1000)
    to = Recipient(public_key_hash=base58.b58decode(recipient))
    transfers = list()
    transfers.append(tpb.MassTransferTransactionData.Transfer(
        recipient=to, amount=amount))
    transfers.append(tpb.MassTransferTransactionData.Transfer(
        recipient=to, amount=amount))
    transfers.append(tpb.MassTransferTransactionData.Transfer(
        recipient=to, amount=amount))
    mass_transfer = tpb.MassTransferTransactionData(asset_id=(base58.b58decode(
        asset.assetId) if asset else b'\0'), transfers=transfers, attachment=attachment)
    fee = Amount(asset_id=(base58.b58decode(feeAsset.assetId)
                           if feeAsset else b'\0'), amount=txFee)
    trx = tpb.Transaction(chain_id=87, sender_public_key=base58.b58decode(
        publicKey), fee=fee, timestamp=timestamp, version=version, mass_transfer=mass_transfer)
    return trx.SerializeToString()


def build_issue_protobuf(publicKey, name, descr, amount, decimals, reissue, feeAsset='', txFee=100000, timestamp=0, version=3):
    if timestamp == 0:
        timestamp = int(time.time() * 1000)
    issue = tpb.IssueTransactionData(
        name=name, description=descr, amount=amount, decimals=decimals, reissuable=reissue)
    fee = Amount(asset_id=(base58.b58decode(feeAsset.assetId)
                           if feeAsset else b'\0'), amount=txFee)
    trx = tpb.Transaction(chain_id=87, sender_public_key=base58.b58decode(
        publicKey), fee=fee, timestamp=timestamp, version=version, issue=issue)
    return trx.SerializeToString()


def build_set_ac_script_protobuf(publicKey, script, feeAsset='', txFee=100000, timestamp=0, version=3):
    if timestamp == 0:
        timestamp = int(time.time() * 1000)
    scr = tpb.SetScriptTransactionData(script=script)
    fee = Amount(asset_id=(base58.b58decode(feeAsset.assetId)
                           if feeAsset else b'\0'), amount=txFee)
    trx = tpb.Transaction(chain_id=87, sender_public_key=base58.b58decode(
        publicKey), fee=fee, timestamp=timestamp, version=version, set_script=scr)
    return trx.SerializeToString()


def build_set_as_script_protobuf(publicKey, asset, script, feeAsset='', txFee=100000, timestamp=0, version=3):
    if timestamp == 0:
        timestamp = int(time.time() * 1000)
    scr = tpb.SetAssetScriptTransactionData(
        asset_id=base58.b58decode(asset.assetId), script=script)
    fee = Amount(asset_id=(base58.b58decode(feeAsset.assetId)
                           if feeAsset else b'\0'), amount=txFee)
    trx = tpb.Transaction(chain_id=87, sender_public_key=base58.b58decode(
        publicKey), fee=fee, timestamp=timestamp, version=version, set_asset_script=scr)
    return trx.SerializeToString()


def build_reissue_protobuf(publicKey, asset, amount, re, feeAsset='', txFee=100000, timestamp=0, version=3):
    if timestamp == 0:
        timestamp = int(time.time() * 1000)
    amountTx = Amount(asset_id=base58.b58decode(asset.assetId), amount=amount)
    reissue = tpb.ReissueTransactionData(asset_amount=amountTx,  reissuable=re)
    fee = Amount(asset_id=(base58.b58decode(feeAsset.assetId)
                           if feeAsset else b'\0'), amount=txFee)
    trx = tpb.Transaction(chain_id=87, sender_public_key=base58.b58decode(
        publicKey), fee=fee, timestamp=timestamp, version=version, reissue=reissue)
    return trx.SerializeToString()


def build_burn_protobuf(publicKey, asset, amount, feeAsset='', txFee=100000, timestamp=0, version=3):
    if timestamp == 0:
        timestamp = int(time.time() * 1000)
    amountTx = Amount(asset_id=base58.b58decode(asset.assetId), amount=amount)
    burn = tpb.BurnTransactionData(asset_amount=amountTx)
    fee = Amount(asset_id=(base58.b58decode(feeAsset.assetId)
                           if feeAsset else b'\0'), amount=txFee)
    trx = tpb.Transaction(chain_id=87, sender_public_key=base58.b58decode(
        publicKey), fee=fee, timestamp=timestamp, version=version, burn=burn)
    return trx.SerializeToString()


def build_lease_protobuf(publicKey, to, amount, feeAsset='', txFee=100000, timestamp=0, version=3):
    if timestamp == 0:
        timestamp = int(time.time() * 1000)
    recipient = Recipient(public_key_hash=base58.b58decode(to))
    lease = tpb.LeaseTransactionData(recipient=recipient, amount=amount)
    fee = Amount(asset_id=(base58.b58decode(feeAsset.assetId)
                           if feeAsset else b'\0'), amount=txFee)
    trx = tpb.Transaction(chain_id=87, sender_public_key=base58.b58decode(
        publicKey), fee=fee, timestamp=timestamp, version=version, lease=lease)
    return trx.SerializeToString()


def build_cancel_lease_protobuf(publicKey, leaseId, feeAsset='', txFee=100000, timestamp=0, version=3):
    if timestamp == 0:
        timestamp = int(time.time() * 1000)
    lease_cancel = tpb.LeaseCancelTransactionData(
        lease_id=base58.b58decode(leaseId))
    fee = Amount(asset_id=(base58.b58decode(feeAsset.assetId)
                           if feeAsset else b'\0'), amount=txFee)
    trx = tpb.Transaction(chain_id=87, sender_public_key=base58.b58decode(
        publicKey), fee=fee, timestamp=timestamp, version=version, lease_cancel=lease_cancel)
    return trx.SerializeToString()


def build_creating_alias_protobuf(publicKey, alias, feeAsset='', txFee=100000, timestamp=0, version=3):
    if timestamp == 0:
        timestamp = int(time.time() * 1000)
    alias = tpb.CreateAliasTransactionData(alias=alias)
    fee = Amount(asset_id=(base58.b58decode(feeAsset.assetId)
                           if feeAsset else b'\0'), amount=txFee)
    trx = tpb.Transaction(chain_id=87, sender_public_key=base58.b58decode(
        publicKey), fee=fee, timestamp=timestamp, version=version, create_alias=alias)
    return trx.SerializeToString()


def build_update_asset_protobuf(publicKey, asset, name, description, feeAsset='', txFee=100000, timestamp=0, version=3):
    if timestamp == 0:
        timestamp = int(time.time() * 1000)
    update_asset = tpb.UpdateAssetInfoTransactionData(
        asset_id=base58.b58decode(asset.assetId),  name=name, description=description)
    fee = Amount(asset_id=(base58.b58decode(feeAsset.assetId)
                           if feeAsset else b'\0'), amount=txFee)
    trx = tpb.Transaction(chain_id=87, sender_public_key=base58.b58decode(
        publicKey), fee=fee, timestamp=timestamp, version=version, update_asset_info=update_asset)
    return trx.SerializeToString()


def build_data_protobuf(publicKey, feeAsset='', txFee=100000, timestamp=0, version=3):
    if timestamp == 0:
        timestamp = int(time.time() * 1000)
    list = []
    for x in range(1):
        k = "jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj" + str(x)
        s = "jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj" + str(x)
        dataEntery = tpb.DataTransactionData.DataEntry(key=k, string_value=s)
        list.append(dataEntery)
    data = tpb.DataTransactionData(data=list)
    fee = Amount(asset_id=(base58.b58decode(feeAsset.assetId)
                           if feeAsset else b''), amount=txFee)
    trx = tpb.Transaction(chain_id=84, sender_public_key=base58.b58decode(
        publicKey), fee=fee, timestamp=timestamp, version=version, data_transaction=data)
    return trx.SerializeToString()


def build_sponsorship_protobuf(publicKey, asset, amount, feeAsset='', txFee=100000, timestamp=0, version=3):
    if timestamp == 0:
        timestamp = int(time.time() * 1000)
    amountTx = Amount(asset_id=(base58.b58decode(asset.assetId)
                                if feeAsset else b'\0'), amount=amount)
    sponsorship = tpb.SponsorFeeTransactionData(min_fee=amountTx)
    fee = Amount(asset_id=(base58.b58decode(feeAsset.assetId)
                           if feeAsset else b'\0'), amount=txFee)
    trx = tpb.Transaction(chain_id=87, sender_public_key=base58.b58decode(
        publicKey), fee=fee, timestamp=timestamp, version=version, sponsor_fee=sponsorship)
    return trx.SerializeToString()


def build_invoke_protobuf(publicKey, dapp, function, asset, amount, asset2, amount2, feeAsset='', txFee=100000, timestamp=0, version=3):
    if timestamp == 0:
        timestamp = int(time.time() * 1000)
    amounts = []
    amountTx = Amount(asset_id=base58.b58decode(asset.assetId), amount=amount)
    amounts.append(amountTx)
    amountTx = Amount(asset_id=base58.b58decode(
        asset2.assetId), amount=amount2)
    amounts.append(amountTx)
    to = Recipient(public_key_hash=base58.b58decode(dapp))
    invoke = tpb.InvokeScriptTransactionData(
        d_app=to, function_call=function, payments=amounts)
    fee = Amount(asset_id=(base58.b58decode(feeAsset.assetId)
                           if feeAsset else b'\0'), amount=txFee)
    trx = tpb.Transaction(chain_id=87, sender_public_key=base58.b58decode(
        publicKey), fee=fee, timestamp=timestamp, version=version, invoke_script=invoke)
    return trx.SerializeToString()


def build_order_protobuf(publicKey, matcherPK, amountAsset, priceAsset, type, amount, price, expiration, timestamp=0, feeAsset='', txFee=100000,  version=3):
    if timestamp == 0:
        timestamp = int(time.time() * 1000)
    fee = Amount(asset_id=(base58.b58decode(feeAsset.assetId)
                           if feeAsset else b'\0'), amount=txFee)
    assetPair = opb.AssetPair(
        amount_asset_id=(base58.b58decode(amountAsset.assetId)
                         if amountAsset else b'\0'),
        price_asset_id=(base58.b58decode(priceAsset.assetId)
                        if priceAsset else b'\0'),
    )
    order = opb.Order(chain_id=87, sender_public_key=base58.b58decode(publicKey), matcher_public_key=base58.b58decode(
        matcherPK), asset_pair=assetPair, order_side=1, amount=amount, price=price, timestamp=timestamp, expiration=expiration, matcher_fee=fee, version=3)
    return order.SerializeToString()

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
    print(colors.fg.lightcyan + colors.bold +
          "Ledger Nano S - Waves test app" + colors.reset)
    print(colors.fg.white +
          "\t 1. Get PublicKey/Address from Ledger Nano S" + colors.reset)
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

            print(colors.fg.blue + "publicKey (base58): " +
                  colors.reset + base58.b58encode(str(publicKey)))
            print(colors.fg.blue + "address: " + colors.reset + address)
    elif (select == "2"):
        path = raw_input(
            colors.fg.lightblue + "Please input BIP-32 path (for example \"44'/5741564'/0'/0'/1'\")> " + colors.reset)
        if len(path) == 0:
            path = "44'/5741564'/0'/0'/1'"
        binary_data = path_to_bytes(expand_path(path))
        print(colors.fg.lightgrey + "path bytes: " +
              base58.b58encode(str(path_to_bytes(expand_path(path)))))

        # tx amount asset decimals
        binary_data += chr(8)
        # tx amount asset decimals 2
        binary_data += chr(0)
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
                                                   pw.Address(
                                                       '3PMpANFyKGBwzvv1UVk2KdN23fJZ8sXSVEK'),
                                                   pw.Asset(
                                                       '9gqcTyupiDWuogWhKv8G3EMwjMaobkw9Lpys4EY2F62t'), 100000000,
                                                   'privet', timestamp=1526477921829)
        input = raw_input(colors.fg.lightblue + "Please input message to sign (for example \"" + base58.b58encode(
            str(some_transfer_bytes)) + "\")> " + colors.reset)
        if len(input) == 0:
            # 2 first bytes aren't the tx data, but info type for the ledger
            binary_data += b'\4\2'
            binary_data += struct.pack(">I", len(some_transfer_bytes))
            binary_data += some_transfer_bytes
            binary_data += some_transfer_bytes
            binary_data += some_transfer_bytes
            print(colors.fg.lightgrey + "tx bytes:   " +
                  base58.b58encode(str(some_transfer_bytes)))
        else:
            binary_input = base58.b58decode(input)
            binary_data += struct.pack(">I", len(binary_input))
            binary_data += binary_input
            binary_data += binary_input
            binary_data += binary_input
            print(colors.fg.lightgrey + "tx bytes:   " +
                  base58.b58encode(str(binary_input)))
        print(colors.fg.lightgrey + "all request bytes:   " +
              base58.b58encode(str(binary_data)))
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

                    apdu = bytes("8002".decode('hex')) + chr(p1) + \
                        chain_id + chr(len(chunk)) + bytes(chunk)
                    signature = dongle.exchange(apdu)
                    offset += len(chunk)
                print("signature " + base58.b58encode(str(signature)))
                break
            except CommException as e:
                if (e.sw == 0x6990):
                    print(colors.fg.red +
                          "Transaction buffer max size reached." + colors.reset)
                if (e.sw == 0x6985):
                    print(colors.fg.red +
                          "Required condition failed." + colors.reset)
                if (e.sw == 0x9100):
                    print(
                        colors.fg.red + "User denied signing request on Ledger Nano S device." + colors.reset)
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
        print('App version is {}.{}.{}'.format(
            version[0], version[1], version[2]))
    elif (select == "4"):
        while (True):
            print("")
            print(colors.fg.lightcyan + colors.bold +
                  "Ledger Nano S - Waves test app" + colors.reset)
            print(colors.fg.lightcyan + colors.bold +
                  "Test protobuf transactions" + colors.reset)
            print(colors.fg.white + "\t 3. Issue" + colors.reset)
            print(colors.fg.white + "\t 4. Transfer" + colors.reset)
            print(colors.fg.white + "\t 5. Reissue" + colors.reset)
            print(colors.fg.white + "\t 6. Burn" + colors.reset)
            #print(colors.fg.white + "\t 7. Exchange" + colors.reset)
            print(colors.fg.white + "\t 8. Lease" + colors.reset)
            print(colors.fg.white + "\t 9. Lease Cancel" + colors.reset)
            print(colors.fg.white + "\t 10. Create Alias" + colors.reset)
            print(colors.fg.white + "\t 11. MassTransfer" + colors.reset)
            print(colors.fg.white + "\t 12. Data" + colors.reset)
            print(colors.fg.white + "\t 13. Set Account Script" + colors.reset)
            print(colors.fg.white + "\t 14. Sponsor Fee" + colors.reset)
            print(colors.fg.white + "\t 15. Set Asset Script" + colors.reset)
            print(colors.fg.white + "\t 16. Invoke Script" + colors.reset)
            print(colors.fg.white + "\t 17. Update Asset Info" + colors.reset)
            print(colors.fg.white + "\t 252. Order" + colors.reset)
            print(colors.fg.white + "\t 0. Exit" + colors.reset)
            select = raw_input(
                colors.fg.cyan + "Please select transaction type> " + colors.reset)
            decimals = 8  # tx amount asset decimals
            decimals2 = 0
            feeDecimals = 8  # fee amount asset decimals
            if (select == "3"):
                decimals = 3
                some_transfer_bytes = build_issue_protobuf(
                    # 3PDCeakWckRvK5vVeJnCy1R2rE1utBcJMwt
                    '4ovEU8YpbHTurwzw8CDZaCD7m6LpyMTC4nrJcgDHb4Jh',
                    "Test asset name",
                    "Test asset description, Test asset description, Test asset description",
                    1000000000,
                    decimals,
                    True,
                    pw.Asset('9gqcTyupiDWuogWhKv8G3EMwjMaobkw9Lpys4EY2F62t'),
                    100000,
                    1526477921829,
                    3
                )
            elif (select == "4"):
                decimals = 8
                some_transfer_bytes = build_transfer_protobuf(
                    # 3PDCeakWckRvK5vVeJnCy1R2rE1utBcJMwt
                    '4ovEU8YpbHTurwzw8CDZaCD7m6LpyMTC4nrJcgDHb4Jh',
                    "23edvPK94JRdmDj7rKwzLbu22Sem",  # 3P8mkuJyiFvVRLjVNfDvdqVqH92bZZkQtAL
                    pw.Asset('B3mFpuCTpShBkSNiKaVbKeipktYWufEMAEGvBAdNP6tu'),
                    100000000,
                    'privet',
                    pw.Asset('9gqcTyupiDWuogWhKv8G3EMwjMaobkw9Lpys4EY2F62t'),
                    100000,
                    1526477921829,
                    3
                )
            elif (select == "5"):
                decimals = 8
                some_transfer_bytes = build_reissue_protobuf(
                    # 3PDCeakWckRvK5vVeJnCy1R2rE1utBcJMwt
                    '4ovEU8YpbHTurwzw8CDZaCD7m6LpyMTC4nrJcgDHb4Jh',
                    pw.Asset('B3mFpuCTpShBkSNiKaVbKeipktYWufEMAEGvBAdNP6tu'),
                    100000000,
                    True,
                    pw.Asset('9gqcTyupiDWuogWhKv8G3EMwjMaobkw9Lpys4EY2F62t'),
                    100000,
                    1526477921829,
                    3
                )
            elif (select == "6"):
                decimals = 8
                some_transfer_bytes = build_burn_protobuf(
                    # 3PDCeakWckRvK5vVeJnCy1R2rE1utBcJMwt
                    '4ovEU8YpbHTurwzw8CDZaCD7m6LpyMTC4nrJcgDHb4Jh',
                    pw.Asset('B3mFpuCTpShBkSNiKaVbKeipktYWufEMAEGvBAdNP6tu'),
                    1000000000,
                    pw.Asset('9gqcTyupiDWuogWhKv8G3EMwjMaobkw9Lpys4EY2F62t'),
                    100000,
                    1526477921829,
                    3
                )

            elif (select == "8"):
                some_transfer_bytes = build_lease_protobuf(
                    # 3PDCeakWckRvK5vVeJnCy1R2rE1utBcJMwt
                    '4ovEU8YpbHTurwzw8CDZaCD7m6LpyMTC4nrJcgDHb4Jh',
                    "23edvPK94JRdmDj7rKwzLbu22Sem",  # 3P8mkuJyiFvVRLjVNfDvdqVqH92bZZkQtAL
                    100000000000,
                    pw.Asset('9gqcTyupiDWuogWhKv8G3EMwjMaobkw9Lpys4EY2F62t'),
                    100000,
                    1526477921829,
                    3
                )
            elif (select == "9"):
                some_transfer_bytes = build_cancel_lease_protobuf(
                    # 3PDCeakWckRvK5vVeJnCy1R2rE1utBcJMwt
                    '4ovEU8YpbHTurwzw8CDZaCD7m6LpyMTC4nrJcgDHb4Jh',
                    'B3mFpuCTpShBkSNiKaVbKeipktYWufEMAEGvBAdNP6tu',
                    pw.Asset('9gqcTyupiDWuogWhKv8G3EMwjMaobkw9Lpys4EY2F62t'),
                    100000,
                    1526477921829,
                    3
                )
            elif (select == "10"):
                some_transfer_bytes = build_creating_alias_protobuf(
                    # 3PDCeakWckRvK5vVeJnCy1R2rE1utBcJMwt
                    '4ovEU8YpbHTurwzw8CDZaCD7m6LpyMTC4nrJcgDHb4Jh',
                    "Test Alias",
                    pw.Asset('9gqcTyupiDWuogWhKv8G3EMwjMaobkw9Lpys4EY2F62t'),
                    100000,
                    1526477921829,
                    3
                )
            elif (select == "11"):
                some_transfer_bytes = build_masstransfer_protobuf(
                    # 3PDCeakWckRvK5vVeJnCy1R2rE1utBcJMwt
                    '4ovEU8YpbHTurwzw8CDZaCD7m6LpyMTC4nrJcgDHb4Jh',
                    "23edvPK94JRdmDj7rKwzLbu22Sem",  # 3P8mkuJyiFvVRLjVNfDvdqVqH92bZZkQtAL
                    pw.Asset('B3mFpuCTpShBkSNiKaVbKeipktYWufEMAEGvBAdNP6tu'),
                    10000000,
                    'privet0000privet0000privet0000privet0000privet0000privet0000privet0000privet0000privet0000privet0000privet0000',
                    pw.Asset('9gqcTyupiDWuogWhKv8G3EMwjMaobkw9Lpys4EY2F62t'),
                    100000,
                    1526477921829,
                    3
                )
            elif (select == "12"):
                some_transfer_bytes = build_data_protobuf(
                    # 3PDCeakWckRvK5vVeJnCy1R2rE1utBcJMwt
                    '4ovEU8YpbHTurwzw8CDZaCD7m6LpyMTC4nrJcgDHb4Jh',
                    pw.Asset('9gqcTyupiDWuogWhKv8G3EMwjMaobkw9Lpys4EY2F62t'),
                    100000,
                    1526477921829,
                    3
                )
            elif (select == "13"):
                script = base64.b64decode("AAIDAAAAAAAAAAYIARIAEgAAAAAEAAAAAAVscEtleQIAAAALbGFzdFBheW1lbnQAAAAABWxpS2V5AgAAAApiZXN0Rm9tb2VyAAAAAAVsaEtleQIAAAAGaGVpZ2h0AAAAAANkYXkAAAAAAAAABaAAAAACAAAAAWkBAAAAC2ZlYXJtaXNzaW5nAAAAAAQAAAAHcGF5bWVudAQAAAAHJG1hdGNoMAgFAAAAAWkAAAAHcGF5bWVudAMJAAABAAAAAgUAAAAHJG1hdGNoMAIAAAAPQXR0YWNoZWRQYXltZW50BAAAAAFwBQAAAAckbWF0Y2gwBAAAAAckbWF0Y2gxCAUAAAABcAAAAAdhc3NldElkAwkAAAEAAAACBQAAAAckbWF0Y2gxAgAAAApCeXRlVmVjdG9yBAAAAAdhc3NldElkBQAAAAckbWF0Y2gxCQAAAgAAAAECAAAAD2ZvbW8gd2F2ZXMgb25seQgFAAAAAXAAAAAGYW1vdW50CQAAAgAAAAECAAAAGHBheW1lbnQgbXVzdCBiZSBhdHRhY2hlZAQAAAALbGFzdFBheW1lbnQEAAAAByRtYXRjaDAJAAQaAAAAAgUAAAAEdGhpcwIAAAALbGFzdFBheW1lbnQDCQAAAQAAAAIFAAAAByRtYXRjaDACAAAAA0ludAQAAAABcAUAAAAHJG1hdGNoMAUAAAABcAAAAAAAAAAAAAMJAABnAAAAAgUAAAALbGFzdFBheW1lbnQFAAAAB3BheW1lbnQJAAACAAAAAQkAASwAAAACAgAAAA9taW4gcGF5bWVudCBpcyAJAAGkAAAAAQUAAAAHcGF5bWVudAkBAAAACFdyaXRlU2V0AAAAAQkABEwAAAACCQEAAAAJRGF0YUVudHJ5AAAAAgUAAAAFbHBLZXkFAAAAB3BheW1lbnQJAARMAAAAAgkBAAAACURhdGFFbnRyeQAAAAIFAAAABWxpS2V5CAgFAAAAAWkAAAAGY2FsbGVyAAAABWJ5dGVzCQAETAAAAAIJAQAAAAlEYXRhRW50cnkAAAACBQAAAAVsaEtleQUAAAAGaGVpZ2h0BQAAAANuaWwAAAABaQEAAAAId2l0aGRyYXcAAAAABAAAAA1jYWxsZXJDb3JyZWN0CQAAAAAAAAIICAUAAAABaQAAAAZjYWxsZXIAAAAFYnl0ZXMJAQAAAAdleHRyYWN0AAAAAQkABBwAAAACBQAAAAR0aGlzBQAAAAVsaUtleQQAAAANaGVpZ2h0Q29ycmVjdAkAAGcAAAACCQAAZQAAAAIJAQAAAAdleHRyYWN0AAAAAQkABBoAAAACBQAAAAR0aGlzBQAAAAVsaEtleQUAAAAGaGVpZ2h0BQAAAANkYXkEAAAAC2NhbldpdGhkcmF3AwUAAAANaGVpZ2h0Q29ycmVjdAUAAAANY2FsbGVyQ29ycmVjdAcDBQAAAAtjYW5XaXRoZHJhdwkBAAAAC1RyYW5zZmVyU2V0AAAAAQkABEwAAAACCQEAAAAOU2NyaXB0VHJhbnNmZXIAAAADCAUAAAABaQAAAAZjYWxsZXIJAQAAAAx3YXZlc0JhbGFuY2UAAAABBQAAAAR0aGlzBQAAAAR1bml0BQAAAANuaWwJAAACAAAAAQIAAAAGYmVob2xkAAAAACSiqig=")
                some_transfer_bytes = build_set_ac_script_protobuf(
                    # 3PDCeakWckRvK5vVeJnCy1R2rE1utBcJMwt
                    '4ovEU8YpbHTurwzw8CDZaCD7m6LpyMTC4nrJcgDHb4Jh',
                    script,
                    pw.Asset('9gqcTyupiDWuogWhKv8G3EMwjMaobkw9Lpys4EY2F62t'),
                    100000,
                    1526477921829,
                    3
                )
            elif (select == "14"):
                decimals = 6
                some_transfer_bytes = build_sponsorship_protobuf(
                    # 3PDCeakWckRvK5vVeJnCy1R2rE1utBcJMwt
                    '4ovEU8YpbHTurwzw8CDZaCD7m6LpyMTC4nrJcgDHb4Jh',
                    pw.Asset('51LxAtwBXapvvTFSbbh4nLyWFxH6x8ocfNvrXxbTChze'),
                    10000,
                    pw.Asset('9gqcTyupiDWuogWhKv8G3EMwjMaobkw9Lpys4EY2F62t'),
                    100000,
                    1526477921829,
                    3
                )
            elif (select == "15"):
                script = base64.b64decode("AAIDAAAAAAAAAAYIARIAEgAAAAAEAAAAAAVscEtleQIAAAALbGFzdFBheW1lbnQAAAAABWxpS2V5AgAAAApiZXN0Rm9tb2VyAAAAAAVsaEtleQIAAAAGaGVpZ2h0AAAAAANkYXkAAAAAAAAABaAAAAACAAAAAWkBAAAAC2ZlYXJtaXNzaW5nAAAAAAQAAAAHcGF5bWVudAQAAAAHJG1hdGNoMAgFAAAAAWkAAAAHcGF5bWVudAMJAAABAAAAAgUAAAAHJG1hdGNoMAIAAAAPQXR0YWNoZWRQYXltZW50BAAAAAFwBQAAAAckbWF0Y2gwBAAAAAckbWF0Y2gxCAUAAAABcAAAAAdhc3NldElkAwkAAAEAAAACBQAAAAckbWF0Y2gxAgAAAApCeXRlVmVjdG9yBAAAAAdhc3NldElkBQAAAAckbWF0Y2gxCQAAAgAAAAECAAAAD2ZvbW8gd2F2ZXMgb25seQgFAAAAAXAAAAAGYW1vdW50CQAAAgAAAAECAAAAGHBheW1lbnQgbXVzdCBiZSBhdHRhY2hlZAQAAAALbGFzdFBheW1lbnQEAAAAByRtYXRjaDAJAAQaAAAAAgUAAAAEdGhpcwIAAAALbGFzdFBheW1lbnQDCQAAAQAAAAIFAAAAByRtYXRjaDACAAAAA0ludAQAAAABcAUAAAAHJG1hdGNoMAUAAAABcAAAAAAAAAAAAAMJAABnAAAAAgUAAAALbGFzdFBheW1lbnQFAAAAB3BheW1lbnQJAAACAAAAAQkAASwAAAACAgAAAA9taW4gcGF5bWVudCBpcyAJAAGkAAAAAQUAAAAHcGF5bWVudAkBAAAACFdyaXRlU2V0AAAAAQkABEwAAAACCQEAAAAJRGF0YUVudHJ5AAAAAgUAAAAFbHBLZXkFAAAAB3BheW1lbnQJAARMAAAAAgkBAAAACURhdGFFbnRyeQAAAAIFAAAABWxpS2V5CAgFAAAAAWkAAAAGY2FsbGVyAAAABWJ5dGVzCQAETAAAAAIJAQAAAAlEYXRhRW50cnkAAAACBQAAAAVsaEtleQUAAAAGaGVpZ2h0BQAAAANuaWwAAAABaQEAAAAId2l0aGRyYXcAAAAABAAAAA1jYWxsZXJDb3JyZWN0CQAAAAAAAAIICAUAAAABaQAAAAZjYWxsZXIAAAAFYnl0ZXMJAQAAAAdleHRyYWN0AAAAAQkABBwAAAACBQAAAAR0aGlzBQAAAAVsaUtleQQAAAANaGVpZ2h0Q29ycmVjdAkAAGcAAAACCQAAZQAAAAIJAQAAAAdleHRyYWN0AAAAAQkABBoAAAACBQAAAAR0aGlzBQAAAAVsaEtleQUAAAAGaGVpZ2h0BQAAAANkYXkEAAAAC2NhbldpdGhkcmF3AwUAAAANaGVpZ2h0Q29ycmVjdAUAAAANY2FsbGVyQ29ycmVjdAcDBQAAAAtjYW5XaXRoZHJhdwkBAAAAC1RyYW5zZmVyU2V0AAAAAQkABEwAAAACCQEAAAAOU2NyaXB0VHJhbnNmZXIAAAADCAUAAAABaQAAAAZjYWxsZXIJAQAAAAx3YXZlc0JhbGFuY2UAAAABBQAAAAR0aGlzBQAAAAR1bml0BQAAAANuaWwJAAACAAAAAQIAAAAGYmVob2xkAAAAACSiqig=")
                some_transfer_bytes = build_set_as_script_protobuf(
                    # 3PDCeakWckRvK5vVeJnCy1R2rE1utBcJMwt
                    '4ovEU8YpbHTurwzw8CDZaCD7m6LpyMTC4nrJcgDHb4Jh',
                    pw.Asset('51LxAtwBXapvvTFSbbh4nLyWFxH6x8ocfNvrXxbTChze'),
                    script,
                    pw.Asset('9gqcTyupiDWuogWhKv8G3EMwjMaobkw9Lpys4EY2F62t'),
                    100000,
                    1526477921829,
                    3
                )
            elif (select == "16"):
                fname = "function_name"
                function_call = chr(
                    2) + chr(2) + "argument1".encode() + chr(2) + "argument2".encode()
                fcal = chr(1) + chr(9) + chr(1) + struct.pack(">I",
                                                              len(fname)) + fname.encode() + function_call
                decimals = 6
                decimals2 = 8
                some_transfer_bytes = build_invoke_protobuf(
                    # 3PDCeakWckRvK5vVeJnCy1R2rE1utBcJMwt
                    '4ovEU8YpbHTurwzw8CDZaCD7m6LpyMTC4nrJcgDHb4Jh',
                    "23edvPK94JRdmDj7rKwzLbu22Sem",  # 3P8mkuJyiFvVRLjVNfDvdqVqH92bZZkQtAL
                    fcal,
                    pw.Asset('51LxAtwBXapvvTFSbbh4nLyWFxH6x8ocfNvrXxbTChze'),
                    1000000,
                    pw.Asset('9gqcTyupiDWuogWhKv8G3EMwjMaobkw9Lpys4EY2F62t'),
                    1000000000,
                )

            elif (select == "17"):
                some_transfer_bytes = build_update_asset_protobuf(
                    # 3PDCeakWckRvK5vVeJnCy1R2rE1utBcJMwt
                    '4ovEU8YpbHTurwzw8CDZaCD7m6LpyMTC4nrJcgDHb4Jh',
                    pw.Asset('51LxAtwBXapvvTFSbbh4nLyWFxH6x8ocfNvrXxbTChze'),
                    "Test name 1",
                    "Test descr",
                    pw.Asset('9gqcTyupiDWuogWhKv8G3EMwjMaobkw9Lpys4EY2F62t'),
                    100000,
                    1526477921829,
                    3
                )
            elif(select == "252"):
                some_transfer_bytes = build_order_protobuf(
                    # 3PDCeakWckRvK5vVeJnCy1R2rE1utBcJMwt
                    '4ovEU8YpbHTurwzw8CDZaCD7m6LpyMTC4nrJcgDHb4Jh',
                    # 3P8mkuJyiFvVRLjVNfDvdqVqH92bZZkQtAL
                    "8f9MUt5QXBBC11Yu4LcfWSdgdUSZBbvXATDfykQymmLe",
                    pw.Asset('51LxAtwBXapvvTFSbbh4nLyWFxH6x8ocfNvrXxbTChze'),
                    pw.Asset('9gqcTyupiDWuogWhKv8G3EMwjMaobkw9Lpys4EY2F62t'),
                    1,  # sell
                    1000000,
                    100,
                    1526477921829,
                    1526477921829,
                    '',  # waves
                    100000,
                    3
                )
            else:
                break

            path = raw_input(
                colors.fg.lightblue + "Please input BIP-32 path (for example \"44'/5741564'/0'/0'/1'\")> " + colors.reset)
            if len(path) == 0:
                path = "44'/5741564'/0'/0'/1'"
            binary_data = path_to_bytes(expand_path(path))
            print(colors.fg.lightgrey + "path bytes: " +
                  base58.b58encode(str(path_to_bytes(expand_path(path)))))

            # tx amount asset decimals
            binary_data += chr(decimals)
            # tx amount2 asset decimals
            binary_data += chr(decimals2)
            # fee amount asset decimals
            binary_data += chr(feeDecimals)

            #some_transfer_bytes = base58.b58decode("uq4YDsWuUhQ2ajpzvHxWeikWkF8XodVWi8F1VdYsqFESLGc2k6g5UvtxVrER4a")
            #some_transfer_bytes = base58.b58decode("c4wP1kugNdzm3Sm88YVaJ3dVZ73S1RshSZNxvqmCZbQUW5yDSCGuXVK666EwipM4yqoA7EeDzseLjSDRQFaoG7pcGvSMrHEqVxw8z3qoBb3zjEvpMhFG598koLXBTZS8RXvN4U4LLJpUcEnqAbDrM4jeUwcYkqekMM3Mbm8tWAaTUbwHgE4DbUPoUid3xncWovvcZ5j9RBExrKpNhxmN1YDS2mwK59GnN4KxUxMnwAuQ5dgrbkAnDGCV9TjeJemj6eCLHKr6mhGUns7W69fRioUmJMADbkYTvgJe1nFgG5n8GiavNfDeCNKD8CYjwZBgZtRZma88pcfAtgBG293JTgcBgSdJWAMTT5J4B5URhrJWyF3mNdq6rbumTGWTGpA8HgYEPA2VgD6EGRprm1DYwdr8UD7HEx2gzDTV6A31")
            input = raw_input(colors.fg.lightblue + "Please input message to sign (for example \"" + base58.b58encode(
                str(some_transfer_bytes)) + "\")> " + colors.reset)
            if len(input) == 0:
                # 2 first bytes aren't the tx data, but info type for the ledger
                binary_data += chr(int(select)) + chr(3)
                binary_data += struct.pack(">I", len(some_transfer_bytes))
                binary_data += some_transfer_bytes
                binary_data += some_transfer_bytes
                binary_data += some_transfer_bytes
                print(colors.fg.lightgrey + "tx bytes:   " +
                      base58.b58encode(str(some_transfer_bytes)))
            else:
                binary_input = base58.b58decode(input)
                binary_data += struct.pack(">I", len(binary_input))
                binary_data += binary_input
                binary_data += binary_input
                binary_data += binary_input
                print(colors.fg.lightgrey + "tx bytes:   " +
                      base58.b58encode(str(binary_input)))
            print(colors.fg.lightgrey + "all request bytes:   " +
                  base58.b58encode(str(binary_data)))

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
                            print(
                                "Waiting for approval to sign on the Ledger Nano S")

                        apdu = bytes("8002".decode('hex')) + chr(p1) + \
                            chain_id + chr(len(chunk)) + bytes(chunk)
                        signature = dongle.exchange(apdu)
                        offset += len(chunk)

                    print("signature " + base58.b58encode(str(signature)))
                    break
                except CommException as e:
                    if (e.sw == 0x6990):
                        print(
                            colors.fg.red + "Transaction buffer max size reached." + colors.reset)
                    if (e.sw == 0x6985):
                        print(colors.fg.red +
                              "Required condition failed." + colors.reset)
                    if (e.sw == 0x9100):
                        print(
                            colors.fg.red + "User denied signing request on Ledger Nano S device." + colors.reset)
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
