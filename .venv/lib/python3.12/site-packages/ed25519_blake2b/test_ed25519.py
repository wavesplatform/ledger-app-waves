from __future__ import print_function
import sys
import unittest
import time
from binascii import hexlify, unhexlify
import ed25519_blake2b
from ed25519_blake2b import _ed25519 as raw

if sys.version_info[0] == 3:
    def int2byte(i):
        return bytes((i,))
else:
    int2byte = chr

def flip_bit(s, bit=0, in_byte=-1):
    as_bytes = [ord(b) if isinstance(b, str) else b for b in s]
    as_bytes[in_byte] = as_bytes[in_byte] ^ (0x01<<bit)
    return  b"".join([int2byte(b) for b in as_bytes])

# the pure-python demonstration code (on my 2010 MacBookPro) takes 5s to
# generate a public key, 9s to sign, 14s to verify

# the SUPERCOP-ref version we use takes 2ms for keygen, 2ms to sign, and 7ms
# to verify

class Basic(unittest.TestCase):
    timer = None
    def log(self, msg):
        return
        now = time.time()
        if self.timer is None:
            self.timer = now
        else:
            elapsed = now - self.timer
            self.timer = now
            print(" (%f elapsed)" % elapsed)
        print(msg)

    def test_version(self):
        # just make sure it can be retrieved
        ver = ed25519_blake2b.__version__
        self.failUnless(isinstance(ver, type("")))

    def test_constants(self):
        # the secret key we get from raw.keypair() are 64 bytes long, and
        # are mostly the output of a sha512 call. The first 32 bytes are the
        # private exponent (random, with a few bits stomped).
        self.failUnlessEqual(raw.SECRETKEYBYTES, 32)
        # the public key is the encoded public point
        self.failUnlessEqual(raw.PUBLICKEYBYTES, 32)
        self.failUnlessEqual(raw.SIGNATUREKEYBYTES, 64)

    def test_raw(self):
        sk_s = b"\x00" * 32 # usually urandom(32)
        vk_s, sk_s = raw.publickey(b"\x00" * 32)
        self.failUnlessEqual(len(vk_s), 32)
        exp_vks = unhexlify(b"19d3d919475deed4696b5d13018151d1"
                            b"af88b2bd3bcff048b45031c1f36d1858")
        self.failUnlessEqual(vk_s, exp_vks)
        msg = b"hello world"
        msg_and_sig = raw.sign(msg, sk_s)
        sig = msg_and_sig[:-len(msg)]
        self.failUnlessEqual(len(sig), 64)
        exp_sig = unhexlify(b"e98f4fdcab831f3449cf77148dd1009d"
                            b"9e8dba184825aa8ff0a295601e2b4668"
                            b"c77258d0e4aa541774c14d7ce1ca1c48"
                            b"de9585e7045b80e016932b2aec5a7f0a")
        self.failUnlessEqual(sig, exp_sig)
        ret = raw.open(sig+msg, vk_s) # don't raise exception
        self.failUnlessEqual(ret, msg)
        self.failUnlessRaises(raw.BadSignatureError,
                              raw.open,
                              sig+msg+b".. NOT!", vk_s)
        self.failUnlessRaises(raw.BadSignatureError,
                              raw.open,
                              sig+flip_bit(msg), vk_s)
        self.failUnlessRaises(raw.BadSignatureError,
                              raw.open,
                              sig+msg, flip_bit(vk_s))
        self.failUnlessRaises(raw.BadSignatureError,
                              raw.open,
                              sig+msg, flip_bit(vk_s, in_byte=2))
        self.failUnlessRaises(raw.BadSignatureError,
                              raw.open,
                              flip_bit(sig)+msg, vk_s)
        self.failUnlessRaises(raw.BadSignatureError,
                              raw.open,
                              flip_bit(sig, in_byte=33)+msg, vk_s)

    def test_keypair(self):
        sk, vk = ed25519_blake2b.create_keypair()
        self.failUnless(isinstance(sk, ed25519_blake2b.SigningKey), sk)
        self.failUnless(isinstance(vk, ed25519_blake2b.VerifyingKey), vk)
        sk2, vk2 = ed25519_blake2b.create_keypair()
        self.failIfEqual(hexlify(sk.to_bytes()), hexlify(sk2.to_bytes()))

        # you can control the entropy source
        def not_so_random(length):
            return b"4"*length
        sk1, vk1 = ed25519_blake2b.create_keypair(entropy=not_so_random)
        self.failUnlessEqual(sk1.to_ascii(encoding="base64"),
                             b"NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ")
        self.failUnlessEqual(vk1.to_ascii(encoding="base64"),
                             b"GhKCJoEFnsvVGfO3cR8u34N5Lc13hO1xi437UcaCyAE")
        sk2, vk2 = ed25519_blake2b.create_keypair(entropy=not_so_random)
        self.failUnlessEqual(sk1.to_ascii(encoding="base64"),
                             sk2.to_ascii(encoding="base64"))
        self.failUnlessEqual(vk1.to_ascii(encoding="base64"),
                             vk2.to_ascii(encoding="base64"))


    def test_publickey(self):
        seed = unhexlify(b"4ba96b0b5303328c7405220598a587c4"
                         b"acb06ed9a9601d149f85400195f1ec3d")
        sk = ed25519_blake2b.SigningKey(seed)
        self.failUnlessEqual(hexlify(sk.to_bytes()),
                             (b"4ba96b0b5303328c7405220598a587c4"
                              b"acb06ed9a9601d149f85400195f1ec3d"))
        self.failUnlessEqual(hexlify(sk.to_seed()),
                             (b"4ba96b0b5303328c7405220598a587c4"
                              b"acb06ed9a9601d149f85400195f1ec3d"))
        self.failUnlessRaises(ValueError,
                              ed25519_blake2b.SigningKey, b"wrong length")
        sk2 = ed25519_blake2b.SigningKey(seed)
        self.failUnlessEqual(sk, sk2)

    def test_OOP(self):
        # BLAKE2b fork doesn't include public key as a part of the secret key
        sk_s = unhexlify(b"4ba96b0b5303328c7405220598a587c4"
                         b"acb06ed9a9601d149f85400195f1ec3d")
        sk = ed25519_blake2b.SigningKey(sk_s)
        self.failUnlessEqual(len(sk.to_bytes()), 32)
        self.failUnlessEqual(sk.to_bytes(), sk_s)

        vk = sk.get_verifying_key()
        self.failUnlessEqual(len(vk.to_bytes()), 32)
        exp_vks = unhexlify(b"eb8d01ec6900d9536dc0574268a5bb10"
                            b"ae4ca3fa75d5dcf12dcc51c299adc032")
        self.failUnlessEqual(vk.to_bytes(), exp_vks)
        self.failUnlessEqual(ed25519_blake2b.VerifyingKey(vk.to_bytes()), vk)
        msg = b"hello world"
        sig = sk.sign(msg)
        self.failUnlessEqual(len(sig), 64)
        exp_sig = unhexlify(b"6f6371e5ca4270e27d130912ba346a17"
                            b"06c3a7b0fae93012013c4b39e360a248"
                            b"9e6a95843ad186f5f6305a6f08d07036"
                            b"53891d54872029aabc6dbf0a616a5c02")
        self.failUnlessEqual(sig, exp_sig)
        self.failUnlessEqual(vk.verify(sig, msg), None) # also, don't throw
        self.failUnlessRaises(ed25519_blake2b.BadSignatureError,
                              vk.verify, sig, msg+b".. NOT!")

    def test_object_identity(self):
        sk1_s = unhexlify(b"ef32972ae3f1252a5aa1395347ea008c"
                          b"bd2fed0773a4ea45e2d2d06c8cf8fbd4"
                          b"c024601a9c5b854fb100ff3116cf4f22"
                          b"a311565f027391cb49d3bbe11c44399d")
        sk2_s = unhexlify(b"3d550c158900b4c2922b6656d2f80572"
                          b"89de4ee65043745179685ae7d29b944d"
                          b"672b8a2cb23f9e75e1d46ce249cd9c04"
                          b"68f816f1c734a102822b60e18b41eacd")
        sk1a = ed25519_blake2b.SigningKey(sk1_s)
        sk1b = ed25519_blake2b.SigningKey(sk1_s)
        vk1a = sk1a.get_verifying_key()
        vk1b = sk1b.get_verifying_key()
        sk2 = ed25519_blake2b.SigningKey(sk2_s)
        vk2 = sk2.get_verifying_key()
        self.failUnlessEqual(sk1a, sk1b)
        self.failIfEqual(sk1a, sk2)
        self.failUnlessEqual(vk1a, vk1b)
        self.failIfEqual(vk1a, vk2)

        self.failIfEqual(sk2, b"not a SigningKey")
        self.failIfEqual(vk2, b"not a VerifyingKey")

    def test_prefix(self):
        sk1,vk1 = ed25519_blake2b.create_keypair()
        PREFIX = b"private0-"
        p = sk1.to_bytes(PREFIX)
        # that gives us a binary string with a prefix
        self.failUnless(p[:len(PREFIX)] == PREFIX, repr(p))
        sk2 = ed25519_blake2b.SigningKey(p, prefix=PREFIX)
        self.failUnlessEqual(sk1, sk2)
        self.failUnlessEqual(repr(sk1.to_bytes()), repr(sk2.to_bytes()))
        self.failUnlessRaises(ed25519_blake2b.BadPrefixError,
                              ed25519_blake2b.SigningKey, p, prefix=b"WRONG-")
        # SigningKey.to_seed() can do a prefix too
        p = sk1.to_seed(PREFIX)
        self.failUnless(p[:len(PREFIX)] == PREFIX, repr(p))
        sk3 = ed25519_blake2b.SigningKey(p, prefix=PREFIX)
        self.failUnlessEqual(sk1, sk3)
        self.failUnlessEqual(repr(sk1.to_bytes()), repr(sk3.to_bytes()))
        self.failUnlessRaises(ed25519_blake2b.BadPrefixError,
                              ed25519_blake2b.SigningKey, p, prefix=b"WRONG-")

        # verifying keys can do this too
        PREFIX = b"public0-"
        p = vk1.to_bytes(PREFIX)
        self.failUnless(p.startswith(PREFIX), repr(p))
        vk2 = ed25519_blake2b.VerifyingKey(p, prefix=PREFIX)
        self.failUnlessEqual(vk1, vk2)
        self.failUnlessEqual(repr(vk1.to_bytes()), repr(vk2.to_bytes()))
        self.failUnlessRaises(ed25519_blake2b.BadPrefixError,
                              ed25519_blake2b.VerifyingKey, p, prefix=b"WRONG-")

        # and signatures
        PREFIX = b"sig0-"
        p = sk1.sign(b"msg", PREFIX)
        self.failUnless(p.startswith(PREFIX), repr(p))
        vk1.verify(p, b"msg", PREFIX)
        self.failUnlessRaises(ed25519_blake2b.BadPrefixError,
                              vk1.verify, p, b"msg", prefix=b"WRONG-")

    def test_ascii(self):
        b2a = ed25519_blake2b.to_ascii
        a2b = ed25519_blake2b.from_ascii
        for prefix in ("", "prefix-"):
            for length in range(0, 100):
                b1 = b"a"*length
                for base in ("base64", "base32", "base16", "hex"):
                    a = b2a(b1, prefix, base)
                    b2 = a2b(a, prefix, base)
                    self.failUnlessEqual(b1, b2)

    def test_encoding(self):
        sk_s = b"\x88" * 32 # usually urandom(32)
        sk1 = ed25519_blake2b.SigningKey(sk_s)
        vk1 = sk1.get_verifying_key()

        def check1(encoding, expected):
            PREFIX = "private0-"
            p = sk1.to_ascii(PREFIX, encoding)
            self.failUnlessEqual(p, expected)
            sk2 = ed25519_blake2b.SigningKey(p, prefix=PREFIX, encoding=encoding)
            self.failUnlessEqual(repr(sk1.to_bytes()), repr(sk2.to_bytes()))
            self.failUnlessEqual(sk1, sk2)
        check1("base64", b"private0-iIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIg")
        check1("base32", b"private0-rceirceirceirceirceirceirceirceirceirceirceirceircea")
        check1("hex", b"private0-8888888888888888888888888888888888888888888888888888888888888888")

        def check2(encoding, expected):
            PREFIX="public0-"
            p = vk1.to_ascii(PREFIX, encoding)
            self.failUnlessEqual(p, expected)
            vk2 = ed25519_blake2b.VerifyingKey(p, prefix=PREFIX, encoding=encoding)
            self.failUnlessEqual(repr(vk1.to_bytes()), repr(vk2.to_bytes()))
            self.failUnlessEqual(vk1, vk2)
        check2("base64", b"public0-LyjqpyjpsKe+gSWQ0qPqcLyc7r+yrZkO54E+RqDzpG8")
        check2("base32", b"public0-f4uovjzi5gykppubewinfi7koc6jz3v7wkwzsdxhqe7enihturxq")
        check2("hex", b"public0-2f28eaa728e9b0a7be812590d2a3ea70bc9ceebfb2ad990ee7813e46a0f3a46f")

        def check3(encoding, expected):
            msg = b"msg"
            PREFIX="sig0-"
            sig = sk1.sign(msg, PREFIX, encoding)
            self.failUnlessEqual(sig, expected)
            vk1.verify(sig, msg, PREFIX, encoding)
        check3("base64", b"sig0-zaHq9S5BED37aeA0YH7Evw63mJUYyEWWP80EIEu1ERvQDwN3uyJodFqunYIL9/DMsK9RkEeuZdcc5BJtRZ15CA")
        check3("base32", b"sig0-zwq6v5joieid363j4a2ga7wex4hlpgevddeelfr7zuccas5vcen5adydo65se2dulkxj3aql67ymzmfpkgiepltf24ooietniwoxsca")
        check3("hex", b"sig0-cda1eaf52e41103dfb69e034607ec4bf0eb7989518c845963fcd04204bb5111bd00f0377bb2268745aae9d820bf7f0ccb0af519047ae65d71ce4126d459d7908")


if __name__ == '__main__':
    unittest.main()
