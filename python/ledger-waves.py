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
import hashlib
import struct
import sys

global dongle
dongle = None


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


global publicKey, privateKey
publicKey = None
privateKey = None


def getPublicKeyFromDongle():
    global publicKey
    global dongle
    if (publicKey):
        return publicKey
    else:
        while (True):
            try:
                if (dongle == None):
                    dongle = getDongle(True)
                data = dongle.exchange(bytes("8004000000".decode('hex')))
                publicKey = data[0:32]
                return publicKey
            except Exception as e:
                print e
                answer = raw_input(
                    "Please conenct your Ledger Nano S, unlock, and launch the Burstcoin app. Press <enter> when ready. (Q quits)")
                if (answer.upper() == 'Q'):
                    sys.exit(0)
                sys.exc_clear()


def getPrivateKeyFromDongle():
    global privateKey
    global dongle
    if (privateKey):
        return privateKey
    else:
        while (True):
            try:
                if (dongle == None):
                    dongle = getDongle(True)
                data = dongle.exchange(bytes("8004000000".decode('hex')))
                privateKey = data[32:64]
                return privateKey
            except Exception as e:
                print e
                answer = raw_input(
                    "Please conenct your Ledger Nano S, unlock, and launch the Burstcoin app. Press <enter> when ready. (Q quits)")
                if (answer.upper() == 'Q'):
                    sys.exit(0)
                sys.exc_clear()


CHUNK_SIZE = 128

while (True):
    print("")
    print(colors.fg.lightcyan + colors.bold + "Ledger Nano S - Waves proof of concept" + colors.reset)
    print(colors.fg.white + "\t 1. Get PublicKey/Address from Ledger Nano S" + colors.reset)
    print(colors.fg.white + "\t 2. Sign anything (for example '31' hex byte) using Ledger Nano S" + colors.reset)
    print(colors.fg.white + "\t 3. Exit" + colors.reset)
    select = raw_input(colors.fg.cyan + "Please select> " + colors.reset)

    if (select == "1"):
        publicKey = getPublicKeyFromDongle()
        pKey = getPrivateKeyFromDongle()

        print colors.fg.blue + "publicKey: " + colors.reset + str(publicKey).encode('hex')
        print colors.fg.blue + "privateKey: " + colors.reset + str(pKey).encode('hex')
    elif (select == "2"):
        binary_data = bytes("31".decode('hex'))
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

                    apdu = bytes("8002".decode('hex')) + chr(p1) + chr(0x00) + chr(len(chunk)) + bytes(chunk)
                    if (apdu.encode('hex') == "6985"):
                        print("Error: user denied signing on device.")
                        sys.exit(1)
                    signature = dongle.exchange(apdu)
                    offset += len(chunk)
                print "signature " + str(signature).encode('hex')
                break
            except CommException as e:
                print e.sw
                if (e.sw == 0x6985):
                    print(colors.fg.red + "User denied signing request on Ledger Nano S device." + colors.reset)

                sys.exit(1)
            except Exception as e:
                print e, type(e)
                answer = raw_input(
                    "Please conenct your Ledger Nano S, unlock, and launch the Burstcoin app. Press <enter> when ready. (Q quits)")
                if (answer.upper() == 'Q'):
                    sys.exit(0)
                sys.exc_clear()
    else:
        break
