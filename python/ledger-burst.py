#!/usr/bin/env python2.7
#*******************************************************************************
#*   Ledger Blue
#*   (c) 2016 Ledger
#*
#*  Licensed under the Apache License, Version 2.0 (the "License");
#*  you may not use this file except in compliance with the License.
#*  You may obtain a copy of the License at
#*
#*      http://www.apache.org/licenses/LICENSE-2.0
#*
#*  Unless required by applicable law or agreed to in writing, software
#*  distributed under the License is distributed on an "AS IS" BASIS,
#*  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#*  See the License for the specific language governing permissions and
#*  limitations under the License.
#********************************************************************************
from ledgerblue.comm import getDongle
from ledgerblue.commException import CommException
from RSAddress import RSAddress
import hashlib
import struct
import sys
import transaction
from datetime import datetime, timedelta
import pytz
import json
import urllib, urllib2
from pprint import pprint

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
    reset='\033[0m'
    bold='\033[01m'
    disable='\033[02m'
    underline='\033[04m'
    reverse='\033[07m'
    strikethrough='\033[09m'
    invisible='\033[08m'
    class fg:
        black='\033[30m'
        red='\033[31m'
        green='\033[32m'
        orange='\033[33m'
        blue='\033[34m'
        purple='\033[35m'
        cyan='\033[36m'
        white='\033[37m'
        lightgrey='\033[90m'
        lightred='\033[91m'
        lightgreen='\033[92m'
        yellow='\033[93m'
        lightblue='\033[94m'
        pink='\033[95m'
        lightcyan='\033[96m'
    class bg:
        black='\033[40m'
        red='\033[41m'
        green='\033[42m'
        orange='\033[43m'
        blue='\033[44m'
        purple='\033[45m'
        cyan='\033[46m'
        lightgrey='\033[47m'

# Some constants
ONE_NXT = 100000000
EPOCH_BEGINNING = datetime(2014, 8, 11, 2, 0, 0, 0)

# This will take a timestamp in the BURST blockchain epoch format
# and convert it to a standard datetime
def convertFromEpochTime(theTime):
	time = EPOCH_BEGINNING + timedelta(seconds=theTime)
	utc = pytz.timezone('UTC')
	return time.replace(tzinfo=utc).astimezone(tz=None)

# This will take a standard date time and return a timetsamp int he
# BURST blockchain format
def convertToEpochTime(theTime):
	diff = (theTime.replace(tzinfo=None) - EPOCH_BEGINNING)
	return int(((diff.days * 86400000) + (diff.seconds * 1000) + (diff.microseconds / 1000)) / 1000)

# Return the current time in the BURST Blockchain epoch format
def getEpochTime():
	utc = pytz.timezone('UTC')
	return convertToEpochTime(datetime.now(utc))

# This is a class designed to handle the itneraction with an online wallet API
class OnlineWallet:
	def __init__(self, baseWalletUrl):
		self.base = baseWalletUrl

	# Get economic clustering information
	def getECBlockInfo(self):
		a = [('requestType','getECBlock')]
		params = urllib.urlencode(a)
		request_url = self.base + "?" + params
		result = json.loads(urllib.urlopen(request_url).read())
		return (result['ecBlockHeight'], result['ecBlockId'])

	# Get information about a wallet
	def getWallet(self, wallet):
		a = (('requestType','getAccount'),('account', wallet))
		params = urllib.urlencode(a)
		request_url = self.base + "?" + params
		result = json.loads(urllib.urlopen(request_url).read())
		return result

	# get time
	def getWalletTime(self):
		request_url = self.base + "?requestType=getTime"
		result = json.loads(urllib.urlopen(request_url).read())
		return result['time'];

	# Get wallet balance
	def getWalletBalance(self, wallet):
		return float(getWallet(wallet)['balanceNQT']) / ONE_NXT

	# Get wallet public key
	def getWalletPublicKey(self, wallet):
		return getWallet(wallet)['publicKey']

	# Broadcast transaction to the network
	def broadcastTransaction(self, hexData):
		a = [('requestType','broadcastTransaction'), ('transactionBytes', hexData)]
		params = urllib.urlencode(a)
		request_url = self.base
		result = json.loads(urllib.urlopen(request_url, params.encode('ascii')).read())
		return result

publickKey = None
def getPublicKeyFromDongle():
	global dongle
	if (publickKey):
		return publicKey
	else:
		while (True):
			try:			
				if (dongle == None):
					dongle = getDongle(True)
				publicKey = dongle.exchange(bytes("8004000000".decode('hex')))
				return publicKey
			except Exception as e:
				print e 
				answer = raw_input("Please conenct your Ledger Nano S, unlock, and launch the Burstcoin app. Press <enter> when ready. (Q quits)")
				if (answer.upper() == 'Q'):
					sys.exit(0)
				sys.exc_clear() 


wallet = OnlineWallet("http://176.9.47.157:6876/burst")
CHUNK_SIZE = 128

while (True):
	print("")
	print(colors.fg.lightcyan + colors.bold + "Ledger Nano S - Burstcoin proof of concept" + colors.reset)
	print(colors.fg.white + "\t 1. Get PublicKey/Address from Ledger Nano S" + colors.reset)
	print(colors.fg.white + "\t 2. Send money using Ledger Nano S"+ colors.reset)
	print(colors.fg.white + "\t 3. Exit" + colors.reset)
	select = raw_input(colors.fg.cyan + "Please select> "+colors.reset)

	if (select == "1"):		
		x = RSAddress("BURST")

		publicKey = getPublicKeyFromDongle()
		print colors.fg.blue + "publicKey: " + colors.reset + str(publicKey).encode('hex')

		sha = hashlib.sha256()
		sha.update(publicKey)
		pk_hash = sha.digest()
		numeric = struct.unpack("<Q", pk_hash[0:8])[0]

		x.set(unicode(numeric))
		print colors.fg.blue+"numeric: " + colors.reset, numeric
		print colors.fg.blue+"address: " + colors.reset, x.toString()
	elif (select == "2"):
		global dongle
		recipient = raw_input(colors.fg.cyan+"Enter recipient address: "+colors.reset);
		x = RSAddress("BURST")
		x.set(recipient);
		dest_acct_id = x.account_id()
		key = getPublicKeyFromDongle()
		print colors.fg.blue + "Recipient account: " + colors.reset, dest_acct_id
		amount = int(raw_input("Amount: "));
		ecBlockInfo = wallet.getECBlockInfo()

		transaction_obj = {'type'   : 0,
     		   'subtype': 0,
     		   'version': 1,
     		   'timestamp': wallet.getWalletTime(),
     		   'deadline': 1440,
               'senderPublicKey': key,
     		   'recipientId': int(dest_acct_id),
			   'amountNQT': amount * ONE_NXT,
			   'feeNQT': 1 * ONE_NXT,
			   'referencedTransactionFullHash': bytearray(('\0'*32).encode('ascii')),
			   'signature': bytearray(('\0'*64).encode('ascii')),
			   'flags': 0,
			   'ecBlockHeight': int(ecBlockInfo[0]),
			   'ecBlockId': int(ecBlockInfo[1]) }
		pprint(transaction_obj)

		if (dongle == None):
			dongle = getDongle(True)

		binary_data = transaction.transactionToBytes(transaction_obj);
		signature = None
		while (True):
			try:			
				offset = 0
				while offset != len(binary_data):				
					if (len(binary_data) - offset) > CHUNK_SIZE:
						chunk = binary_data[offset : offset + CHUNK_SIZE] 
					else:
						chunk = binary_data[offset:]
					if (offset + len(chunk)) == len(binary_data):
						p1 = 0x80
					else:
						p1 = 0x00

					if (offset == 0):
						print("Waiting for approval to sign on the Ledger Nano S");

					apdu = bytes("8002".decode('hex')) + chr(p1) + chr(0x00) + chr(len(chunk)) + bytes(chunk)
					if (apdu.encode('hex') == "6985"):
						print("Error: user denied signing on device.")
						sys.exit(1)
					signature = dongle.exchange(apdu)
					offset += len(chunk)  	
				print "signature " + str(signature).encode('hex')
				break;
			except CommException as e:
				print e.sw
				if (e.sw == 0x6985):
					print(colors.fg.red + "User denied signing request on Ledger Nano S device." + colors.reset)
			
				sys.exit(1)
			except Exception as e:
				print e, type(e)
				answer = raw_input("Please conenct your Ledger Nano S, unlock, and launch the Burstcoin app. Press <enter> when ready. (Q quits)")
				if (answer.upper() == 'Q'):
					sys.exit(0)
				sys.exc_clear() 

		if (signature):
			transaction_obj['signature']= signature
			trans_bytes = transaction.transactionToBytes(transaction_obj);
			hexdata=''.join(format(x, '02x') for x in trans_bytes)
			print(hexdata)
			result = wallet.broadcastTransaction(hexdata)
			print(result)

	else:
		break;

