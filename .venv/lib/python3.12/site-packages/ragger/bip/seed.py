from typing import Tuple, Sequence
from enum import Enum, auto

from bip_utils import Bip32Secp256k1
from bip_utils import Bip32Nist256p1
from bip_utils import Bip32Ed25519Slip
from bip_utils import Bip32Ed25519Kholaw
from bip_utils import Bip32Ed25519Blake2bSlip
from bip_utils import Bip39SeedGenerator


class CurveChoice(Enum):
    Secp256k1 = auto()
    Nist256p1 = auto()
    Ed25519Slip = auto()
    Ed25519Kholaw = auto()
    Ed25519Blake2bSlip = auto()


GET_CURVE_OBJ = {
    CurveChoice.Secp256k1: Bip32Secp256k1,
    CurveChoice.Nist256p1: Bip32Nist256p1,
    CurveChoice.Ed25519Slip: Bip32Ed25519Slip,
    CurveChoice.Ed25519Kholaw: Bip32Ed25519Kholaw,
    CurveChoice.Ed25519Blake2bSlip: Bip32Ed25519Blake2bSlip,
}

SPECULOS_MNEMONIC = (
    "glory promote mansion idle axis finger extra february uncover one trip resource "
    "lawn turtle enact monster seven myth punch hobby comfort wild raise skin")


def calculate_public_key_and_chaincode(curve: CurveChoice,
                                       path: str,
                                       mnemonic: Sequence[str] = SPECULOS_MNEMONIC,
                                       compress_public_key: bool = False) -> Tuple[str, str]:
    if not isinstance(curve, CurveChoice):
        raise ValueError(f'"{curve}" must be a CurveChoice enum')

    seed = Bip39SeedGenerator(mnemonic).Generate()
    root_node = GET_CURVE_OBJ[curve].FromSeed(seed_bytes=seed)
    child_node = root_node.DerivePath(path=path)
    public_key = child_node.PublicKey()
    chaincode = child_node.ChainCode()

    if compress_public_key:
        raw_public_key = public_key.RawCompressed()
    else:
        raw_public_key = public_key.RawUncompressed()
    return raw_public_key.ToHex(), chaincode.ToHex()
