# Copyright (c) 2017 Jake B.

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

from io import BytesIO
import struct
import curve25519
import hashlib

def readTransactionData(fp):
    transaction = {}
    transaction['type'] = struct.unpack('<b', fp.read(1))[0]
    subtype = struct.unpack('<b', fp.read(1))[0]
    transaction['version'] = (subtype & 0xF0) >> 4
    transaction['subtype'] = subtype & 0x0F;
    transaction['timestamp'] = struct.unpack('<I', fp.read(4))[0]
    transaction['deadline']  = struct.unpack('<H', fp.read(2))[0]
    transaction['senderPublicKey'] = fp.read(32)
    transaction['recipientId'] = struct.unpack('<Q', fp.read(8))[0]
    transaction['amountNQT'] = struct.unpack('<Q', fp.read(8))[0]
    transaction['feeNQT'] = struct.unpack('<Q', fp.read(8))[0]
    transaction['referencedTransactionFullHash'] = fp.read(32)
    transaction['signature'] = fp.read(64)
    transaction['flags'] = 0
    transaction['ecBlockHeight'] = 0
    transaction['ecBlockId'] = 0

    if (transaction['version'] > 0):
        transaction['flags'] = struct.unpack('<I', fp.read(4))[0]
        transaction['ecBlockHeight'] = struct.unpack('<I', fp.read(4))[0]
        transaction['ecBlockId'] = struct.unpack('<Q', fp.read(8))[0]

    if (transaction['flags'] & 0x01):
        msg_version = struct.unpack('<b', fp.read(1))[0]
        length = struct.unpack('<I', fp.read(4))[0] & 0x7FFFFFFF
        transaction['message'] = fp.read(length)

    return transaction

def transactionToBytes(t):
    data = bytearray()
    data.extend(struct.pack("<b", int(t['type'])))
    data.extend(struct.pack("<b", ((t['version'] << 4) & 0xF0) | (t['subtype'] & 0x0F)))
    data.extend(struct.pack("<I", t['timestamp']))
    data.extend(struct.pack("<H", t['deadline']))
    data.extend(t['senderPublicKey'])
    data.extend(struct.pack("<Q", t['recipientId']))
    data.extend(struct.pack("<Q", t['amountNQT']))
    data.extend(struct.pack("<Q", t['feeNQT']))
    data.extend(t['referencedTransactionFullHash'])
    data.extend(t['signature'])
    if (t['version'] > 0):
        if ('message' in t):
            t['flags'] |= 0x01
        data.extend(struct.pack("<I", t['flags']))
        data.extend(struct.pack("<I", t['ecBlockHeight']))
        data.extend(struct.pack("<Q", t['ecBlockId']))        
        if ('message' in t):
            data.extend(struct.pack("<b", 1)) #version
            data.extend(struct.pack("<I", len(t['message']) | 0x80000000))
            data.extend(t['message'])
    return data
