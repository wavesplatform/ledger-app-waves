# a pedagogical implementation of curve25519 with ec-kcdsa
# coded by doctorevil to validate nxt's port of Matthijs van Duin's implementation
# warning: this implementation is not timing attack resistant 
# ec arithmetic equations from http://hyperelliptic.org/EFD/g1p/auto-montgom.html

# Modified slightly to support  Python 3 these modifications are released under
# the MIT license.  Specifically the disclaimer of warranty/liability:

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

from hashlib import sha256
from ecdsa.numbertheory import square_root_mod_prime, SquareRootError, inverse_mod

CURVE_P = 2**255 - 19
CURVE_A = 486662
CURVE_ORDER = 7237005577332262213973186563042994240857116359379907606001950938285454250989
CURVE_G_X = 9
CURVE_G_Y = 14781619447589544791020593568409986887264606134616475288964881837755586237401

def le32(n): # to little endian
    #return bytes.fromhex('%064x' % n) #[::-1]
    return bytes.fromhex('%064x' % n)[::-1]

def from_le32(s):
    #return int(s.hex(), 16)
    return int(s[::-1].hex(), 16)

def curve25519_x_to_y(x):
    t = (x ** 3 + CURVE_A * x ** 2 + x) % CURVE_P
    try:
        return square_root_mod_prime(t, CURVE_P)
    except SquareRootError:
        return None

def curve25519_affine_add(x1, y1, x2, y2):
    if (x1, y1) == (1, 0):
        return x2, y2
    if (x2, y2) == (1, 0):
        return x1, y1
    if x1 == x2 and y1 != y2:
        return (1, 0)
    if x1 == x2 and y1 == y2:
        return curve25519_affine_double(x1, y1)
    
    t1 = (y2 - y1) ** 2 % CURVE_P
    t2 = (x2 - x1) ** 2 % CURVE_P
    x3 = (t1 * inverse_mod(t2, CURVE_P) - 486662 - x1 - x2) % CURVE_P
    t1 = (2 * x1 + x2 + 486662) % CURVE_P
    t2 = (y2 - y1) % CURVE_P
    t3 = (x2 - x1) % CURVE_P

    y3 = t1 * (y2 - y1) * inverse_mod((x2 - x1) % CURVE_P, CURVE_P) - \
        t2 ** 3 * inverse_mod(t3 ** 3 % CURVE_P, CURVE_P) - y1
    y3 = y3 % CURVE_P
    return x3, y3

def curve25519_affine_double(x1, y1):
    if (x1, y1) == (1, 0):
        return (1, 0)
    
    x2 = (3 * x1 ** 2 + 2 * CURVE_A * x1 + 1) ** 2 * inverse_mod((2 * y1) ** 2, CURVE_P) - CURVE_A - x1 - x1
    y2 = (2 * x1 + x1 + CURVE_A) * (3 * x1 ** 2 + 2 * CURVE_A * x1 + 1) * inverse_mod(2 * y1, CURVE_P) - \
        (3 * x1 ** 2 + 2 * CURVE_A * x1 + 1) ** 3 * inverse_mod((2 * y1) ** 3, CURVE_P) - y1
    return x2 % CURVE_P, y2 % CURVE_P
    
def curve25519_affine_mult(n, x1, y1):
    tx, ty = 1, 0
    for bit in map(int, bin(n)[2:]):
        tx, ty = curve25519_affine_double(tx, ty)
        if bit:
            tx, ty = curve25519_affine_add(tx, ty, x1, y1)
    return tx, ty

def clamp(secret):
    a = secret[0]
    a &= 248
    b = secret[31]
    b &= 127
    b |= 64
    returnVal = (bytearray((a,)) + secret[1:-1] + bytearray((b,)))
    return returnVal
    
def is_negative(x):
    return x & 1
    
def curve25519_eckcdsa_keygen(secret):
    s = from_le32(clamp(secret))
    x, y = curve25519_affine_mult(s, CURVE_G_X, CURVE_G_Y)
    signing_key = inverse_mod(s if is_negative(y) else -s, CURVE_ORDER)
    return le32(x), le32(signing_key), le32(s)

def kcdsa_sign(message, secret):
    
    verification_key, signing_key, ignored = curve25519_eckcdsa_keygen(secret)
    
    m = sha256(message).digest()
    k = sha256(m + signing_key).digest()
    k_Gx, ignored, k_clamped = curve25519_eckcdsa_keygen(k)
    r = sha256(m + k_Gx).digest()
    s = (from_le32(k_clamped) - from_le32(r)) * from_le32(signing_key) % CURVE_ORDER
    
    return le32(s) + r

def kcdsa_verify(signature, message, public_key):
    if len(signature) != 64:
        return False

    s = from_le32(signature[:32])
    r = from_le32(signature[32:64])
    
    px = from_le32(public_key) 
    py = curve25519_x_to_y(px)
    if py is None: # pubkey is bogus; bail
        return False
    
    tx1, ty1 = curve25519_affine_mult(s, px, py)
    tx2, ty2 = curve25519_affine_mult(r, CURVE_G_X, CURVE_G_Y)
    if not is_negative(py):
        ty2 = -ty2
    k_Gx, k_Gy = curve25519_affine_add(tx1, ty1, tx2, ty2)  
    
    m = sha256(message).digest() 
    return le32(r) == sha256(m + le32(k_Gx)).digest()

if __name__ == "__main__":
    import sys
    
    passphrase = sys.argv[1].encode('utf-8')
    secret = sha256(passphrase).digest()
    message = sys.argv[2].encode('utf-8')
    
    verification_key, signing_key, secret_clamped = curve25519_eckcdsa_keygen(secret)
    print('pubkey', verification_key.hex())
    print('signing key', signing_key.hex())
    signature = kcdsa_sign(message, secret)
    print('signature', signature.hex())
    assert kcdsa_verify(signature, message, verification_key)
    assert not kcdsa_verify(signature[::-1], signature, verification_key)