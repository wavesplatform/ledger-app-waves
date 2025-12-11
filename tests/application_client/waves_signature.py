import pywaves_curve25519 as curve
import base58
from typing import Union


def to_bytes(x: Union[str, bytes]) -> bytes:
    """Если строка — считаем, что это Base58 и декодируем. Если bytes — возвращаем как есть."""
    if isinstance(x, bytes):
        return x
    if isinstance(x, str):
        return base58.b58decode(x)
    raise TypeError("Ожидался str или bytes")


def ed25519_verify(data: bytes, signature: Union[str, bytes], public_key: Union[str, bytes]) -> bool:
    """
    Проверяет Ed25519 подпись.

    data        — байты сообщения
    signature   — 64 байта Ed25519 подписи или base58
    public_key  — 32 байта публичного ключа или base58
    """

    sig = to_bytes(signature)
    pub = to_bytes(public_key)

    if len(pub) != 32:
        raise ValueError(f"Публичный ключ должен быть 32 байта, получено {len(pub)}")

    if len(sig) != 64:
        raise ValueError(f"Подпись должна быть 64 байта, получено {len(sig)}")

    try:
        return curve.verifySignature(public_key, data, signature) == 0
    except ValueError:
        return False