    # 80 02 
    # [not last command message: 1 byte: 00 hex] 
    # [chain id: 1 byte: 00 hex] 
    # [payload size byte: 7b hex: 123 bytes] 
    # [bip32 path bytes: 20 bytes: ...] 
    # [amount decimals: 1 byte] 
    # [amount 2 decimals: 1 byte] 
    # [fee decimals: 1 byte] 
    # [data type: 1 byte] 
    # [data version: 1 byte] 
    # [tx data size: 4 byte] 
    # [tx chunk bytes: 93 bytes]
    # function _fillDataForSign(path: string, sOData: ISignTxData): Promise<Buffer> {
    #     const prefixData = Buffer.concat([
    #     Waves.splitPath(path),
    #             Buffer.from([
    #                 sData.amountPrecision,
    #                 sData.amount2Precision,
    #                 sData.feePrecision,
    #                 sData.dataType,
    #                 sData.dataVersion
    #             ]),
    #             new Buffer(Waves._toInt32Bytes(sData.dataBuffer.byteLength))
    #         ]);
    #     return Buffer.concat([prefixData, sData.dataBuffer, sData.dataBuffer, sData.dataBuffer, sData.dataBuffer]);
    # }
    #   const sData = sOData as ISignTxData;
    #   sData.dataType = WAVES_CONFIG.SIGNED_CODES.SOME_DATA
    #   sData.dataVersion = 0;
    #   sData.amountPrecision = 0;
    #   sData.feePrecision = 0;
    #   const dataForDevice = await this._fillDataForSign(path, sData);
    #   return await this._signData(dataForDevice);

    #   const dataBuffer = await dataBufferAsync;
    #    const maxChunkLength = WAVES_CONFIG.MAX_SIZE - 5;
    #    const dataLength = dataBuffer.length;
    #    let sendBytes = 0;
    #    let result;
    #    while (dataLength > sendBytes) {
    #        const chunkLength = Math.min(dataLength - sendBytes, maxChunkLength);
    #        const isLastByte = (dataLength - sendBytes > maxChunkLength) ? 0x00 : 0x80;
    #        const chainId = this.networkCode;
    #        const txChunk = dataBuffer.slice(sendBytes, chunkLength + sendBytes);
    #        sendBytes += chunkLength;
    #        result = await this.transport.send(0x80, 0x02, isLastByte, chainId, txChunk);
    #        const isError = Waves.checkError(result.slice(-2));
    #        if (isError) {
    #            throw isError;
    #        }
    #    }
    #
    #    return base58Encode(result.slice(0, -2));

    #    const WAVES_CONFIG = {
    #       STATUS: {
    #            SW_OK: 0x9000,
    #            SW_USER_CANCELLED: 0x9100,
    #            SW_DEPRECATED_SIGN_PROTOCOL: 0x9102,
    #            SW_INCORRECT_PRECISION_VALUE: 0x9103,
    #            SW_INCORRECT_TRANSACTION_TYPE_VERSION: 0x9104,
    #            SW_PROTOBUF_DECODING_FAILED: 0x9105,
    #            SW_BYTE_DECODING_FAILED: 0x9106,
    #            SW_CONDITIONS_NOT_SATISFIED: 0x6985,
    #            SW_DEVICE_IS_LOCKED: 0x6986,
    #            SW_BUFFER_OVERFLOW: 0x6990,
    #            SW_INCORRECT_P1_P2: 0x6A86,
    #            SW_INS_NOT_SUPPORTED: 0x6D00,
    #            SW_CLA_NOT_SUPPORTED: 0x6E00,
    #            SW_SECURITY_STATUS_NOT_SATISFIED: 0x6982
    #        },
    #        SECRET: 'WAVES',
    #        PUBLIC_KEY_LENGTH: 32,
    #        ADDRESS_LENGTH: 35,
    #        STATUS_LENGTH: 2,
    #        SIGNED_CODES: {
    #            ORDER: 0xFC,
    #            SOME_DATA: 0xFD,
    #            REQUEST: 0xFE,
    #            MESSAGE: 0xFF
    #        },
    #        MAX_SIZE: 128,
    #        WAVES_PRECISION: 8,
    #        MAIN_NET_CODE: 87,
    #    };

    #    export interface ISignData {
    #        dataBuffer: Uint8Array;
    #    }
    #    
    #    export interface ISignTxData extends ISignData{
    #        dataType: number;
    #        dataVersion: number;
    #        amountPrecision?: number;
    #        amount2Precision?: number;
    #        feePrecision?: number;
    #    }
    #    
    #    export interface ISignOrderData extends ISignData{
    #        dataVersion: number;
    #        amountPrecision?: number;
    #        feePrecision?: number;
    #    }

from ragger.backend.interface import BackendInterface, RAPDU
from ragger.bip import pack_derivation_path
from typing import Optional
from enum import IntEnum
import base58
from nacl import hash

CLA: int = 0x80

class InsType(IntEnum):
    GET_VERSION    = 0x06
    GET_APP_NAME   = 0x08
    GET_PUBLIC_KEY = 0x04
    SIGN_TX        = 0x02

class SIGNED_CODES:
    SOME_DATA = 0xFD
    ORDER = 0xFC
    REQUEST = 0xFE
    MESSAGE = 0xFF

class WAVES_CONFIG:
    MAX_SIZE = 128  # Max APDU size for Waves app
    WAVES_PRECISION = 8 # Number of decimals for Waves currency
    MAIN_NET_CODE = 87 # Chain id for mainnet 'W'
    PUBLIC_KEY_LENGTH = 32  # Length of public key in bytes
    ADDRESS_LENGTH = 35 # Length of address in bytes
    STATUS_LENGTH = 2  # Length of status word in bytes


class STATUS:
    SW_OK = 0x9000
    SW_USER_CANCELLED = 0x9100
    SW_DEPRECATED_SIGN_PROTOCOL = 0x9102
    SW_INCORRECT_PRECISION_VALUE = 0x9103
    SW_INCORRECT_TRANSACTION_TYPE_VERSION = 0x9104
    SW_PROTOBUF_DECODING_FAILED = 0x9105
    SW_BYTE_DECODING_FAILED = 0x9106
    SW_CONDITIONS_NOT_SATISFIED = 0x6985
    SW_DEVICE_IS_LOCKED = 0x6986
    SW_BUFFER_OVERFLOW = 0x6990
    SW_INCORRECT_P1_P2 = 0x6A86
    SW_INS_NOT_SUPPORTED = 0x6D00
    SW_CLA_NOT_SUPPORTED = 0x6E00
    SW_SECURITY_STATUS_NOT_SATISFIED = 0x6982    

# Utils class to represent data to sign
class SignData:
    def __init__(self, data_type: int, data_version: int, bytes: bytes, amountPrecision: int = 0, amount2Precision: int = 0, feePrecision: int = 0) -> None:
        self.dataType = data_type
        self.dataVersion = data_version
        self.bytes = bytes
        self.amountPrecision = amountPrecision
        self.amount2Precision = amount2Precision
        self.feePrecision = feePrecision
        self.dataLength = len(self.bytes)



class WavesSignData:
    def __init__(self, backend: BackendInterface) -> None:
        self.backend = backend
    
    def get_async_response(self) -> Optional[RAPDU]:
        return self.backend.last_async_response

    def sign_custom_data(self, path: str, data: bytes, chain_id: int = WAVES_CONFIG.MAIN_NET_CODE) -> RAPDU:
        sData = SignData(data_type=SIGNED_CODES.SOME_DATA, data_version=0, bytes=data, amountPrecision=0, amount2Precision=0, feePrecision=0)
        bytes = self.prepare_data(path, sData)
        return self.sign_data(data=bytes, chain_id=chain_id)
    
    def sign_tx(self, path: str, data: bytes, tx_type: int, chain_id: int = WAVES_CONFIG.MAIN_NET_CODE, data_version=1, amountPrecision=8, amount2Precision=0, feePrecision=8) -> RAPDU:
        sData = SignData(data_type=tx_type, data_version=data_version, bytes=data, amountPrecision=amountPrecision, amount2Precision=amount2Precision, feePrecision=feePrecision)
        bytes = self.prepare_data(path, sData)
        return self.sign_data(data=bytes, chain_id=chain_id)

    def prepare_data(self, path: str, data: SignData) -> bytes:
        prefixData: bytes = self.pack_derivation_path(path) + bytes([
            data.amountPrecision,
            data.amount2Precision,
            data.feePrecision,
            data.dataType,
            data.dataVersion
        ]) + len(data.bytes).to_bytes(4, 'big')
        # Prepare the data to send
        return b"".join([
                        prefixData,
                        data.bytes,
                        data.bytes,
                        data.bytes,
                        data.bytes
                    ])
    
    def pack_derivation_path(self, path: str) -> bytes:
        """
        Returns the packed derivation path.
        """
        return pack_derivation_path(path)[1:]

    def get_public_key(self, chain_id: int = 0, data: bytes = b"") -> RAPDU:
            return self.backend.exchange(cla=CLA,
                                        ins=InsType.GET_PUBLIC_KEY,
                                        p1=0,
                                        p2=chain_id,
                                        data=data)

    def parse_pk_response(self, response: bytes):
        if len(response) < 32 + 35:
            raise ValueError(f"Response too short {len(response)}")

        public_key = response[:32]
        address_bytes = response[32:32+35]

        return public_key, address_bytes
    
    def public_key_to_address(self, public_key: bytes, chain_id: int = WAVES_CONFIG.MAIN_NET_CODE) -> str:
        bytes_prefix = bytes([1, chain_id])  # Address version and chain id
        public_key_hash = hash.blake2b(public_key)[:20]  # First 20 bytes of blake2b hash
        address_bytes = bytes_prefix + public_key_hash
        return base58.b58encode(address_bytes).decode()

    def sign_data(self, data: bytes, chain_id: int = WAVES_CONFIG.MAIN_NET_CODE) -> RAPDU:
        max_chunk_length = WAVES_CONFIG.MAX_SIZE - 5
        data_length = len(data)
        send_bytes = 0
        result = None

        while data_length > send_bytes:
            chunk_length = min(data_length - send_bytes, max_chunk_length)
            is_last_byte = 0x00 if (data_length - send_bytes > max_chunk_length) else 0x80
            chainId = chain_id
            tx_chunk = data[send_bytes:chunk_length + send_bytes]
            send_bytes += chunk_length
            result = self.backend.exchange(cla=0x80,
                                           ins=0x02,
                                           p1=is_last_byte,
                                           p2=chainId,
                                           data=tx_chunk)
        return result
    