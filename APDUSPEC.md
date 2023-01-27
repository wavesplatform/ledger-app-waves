# Waves App

## General structure

The general structure of commands and responses is as follows:

#### Command
| Field         | Type     | Content                | Expected  |
| ------------- | -------- | ---------------------- | --------- |
| CLA           | byte (1) | Application Identifier | 0x80      |
| INS_SIGN      | byte (1) | Sign Instruction       | 0x02      |
| P1_CONFIRM    | byte (1) | Payload desc           | 0x01      |
|               |          |                        | 1 = add   |
|               |          |                        | 2 = last  |
| P2            | byte (1) | ----                   | not used  |
| L             | byte (1) | Bytes in payload       | (depends) |

### Response

| Field   | Type     | Content     | Note                     |
| ------- | -------- | ----------- | ------------------------ |
| ANSWER  | byte (?) | Answer      | depends on the command   |
| SW1-SW2 | byte (2) | Return code | see list of return codes |

### Return codes

| Return code | Description                                 |
| ----------- | ------------------------------------------- |
| 0x9100      | SW_USER_CANCELLED                           |
| 0x6982      | SW_SECURITY_STATUS_NOT_SATISFIED            |
| 0x9101      | SW_SIGN_DATA_NOT_MATCH                      |
| 0x6986      | SW_DEVICE_IS_LOCKED                         |
| 0x6D00      | SW_INS_NOT_SUPPORTED                        |
| 0x6E00      | SW_CLA_NOT_SUPPORTED                        |
| 0x9103      | SW_INCORRECT_PRECISION_VALUE                |
| 0x9000      | SW_OK                                       |
| 0x6A86      | SW_INCORRECT_P1_P2                          |
| 0x9105      | SW_PROTOBUF_DECODING_FAILED                 |
| 0x9102      | SW_DEPRECATED_SIGN_PROTOCOL                 |
| 0x6985      | SW_CONDITIONS_NOT_SATISFIED                 |
| 0x9104      | SW_INCORRECT_TRANSACTION_TYPE_VERSION       |
| 0x6990      | SW_BUFFER_OVERFLOW                          |
---

## Command definition

### GET_VERSION

#### Command
| Field         | Type     | Content                | Expected  |
| ------------- | -------- | ---------------------- | --------- |
| CLA           | byte (1) | Application Identifier | 0x80      |
| INS_SIGN      | byte (1) | Sign Instruction       | 0x02      |
| P1_CONFIRM    | byte (1) | Payload desc           | 0x01      |
|               |          |                        | 1 = add   |
|               |          |                        | 2 = last  |
| P2            | byte (1) | ----                   | not used  |
| L             | byte (1) | Bytes in payload       | (depends) |

#### Response

| Field   | Type     | Content          | Note                            |
| ------- | -------- | ---------------- | ------------------------------- |
| TEST    | byte (1) | Test Mode        | 0xFF means test mode is enabled |
| MAJOR   | byte (2) | Version Major    | 0..65535                        |
| MINOR   | byte (2) | Version Minor    | 0..65535                        |
| PATCH   | byte (2) | Version Patch    | 0..65535                        |
| LOCKED  | byte (1) | Device is locked | 0x6986                          |
| SW1-SW2 | byte (2) | Return code      | see list of return codes        |

---

### INS_GET_ADDR_ED25519

#### Command

| Field   | Type     | Content                   | Expected   |     |
| ------- | -------- | ------------------------- | ---------- | --- |
| CLA     | byte (1) | Application Identifier    | 0x90       |     |
| INS     | byte (1) | Instruction ID            | 0x01       |     |
| P1      | byte (1) | Request User confirmation | No = 0     |     |
| P2      | byte (1) | Parameter 2               | ignored    |     |
| L       | byte (1) | Bytes in payload          | (depends)  |     |
| Path[0] | byte (4) | Derivation Path Data      | 0x80000000 | 44  |
| Path[1] | byte (4) | Derivation Path Data      | 0x80000000 | 354 |
| Path[2] | byte (4) | Derivation Path Data      | ?          |     |
| Path[3] | byte (4) | Derivation Path Data      | ?          |     |
| Path[4] | byte (4) | Derivation Path Data      | ?          |     |

#### Response

| Field   | Type      | Content     | Note                     |
| ------- | --------- | ----------- | ------------------------ |
| PK      | byte (32) | Public Key  |                          |
| ADDR    | byte (??) | address     |                          |
| SW1-SW2 | byte (2)  | Return code | see list of return codes |

---

### INS_GET_ADDR_SR25519

#### Command

| Field   | Type     | Content                   | Expected   |     |
| ------- | -------- | ------------------------- | ---------- | --- |
| CLA     | byte (1) | Application Identifier    | 0x90       |     |
| INS     | byte (1) | Instruction ID            | 0x11       |     |
| P1      | byte (1) | Request User confirmation | No = 0     |     |
| P2      | byte (1) | Parameter 2               | ignored    |     |
| L       | byte (1) | Bytes in payload          | (depends)  |     |
| Path[0] | byte (4) | Derivation Path Data      | 0x80000000 | 44  |
| Path[1] | byte (4) | Derivation Path Data      | 0x80000000 | 354 |
| Path[2] | byte (4) | Derivation Path Data      | ?          |     |
| Path[3] | byte (4) | Derivation Path Data      | ?          |     |
| Path[4] | byte (4) | Derivation Path Data      | ?          |     |

#### Response

| Field   | Type      | Content     | Note                     |
| ------- | --------- | ----------- | ------------------------ |
| PK      | byte (32) | Public Key  |                          |
| ADDR    | byte (??) | DOT address |                          |
| SW1-SW2 | byte (2)  | Return code | see list of return codes |

---

### INS_SIGN_ED25519

#### Command

| Field         | Type     | Content                | Expected  |
| ------------- | -------- | ---------------------- | --------- |
| CLA           | byte (1) | Application Identifier | 0x80      |
| INS_SIGN      | byte (1) | Sign Instruction       | 0x02      |
| P1_CONFIRM    | byte (1) | Payload desc           | 0x01      |
|               |          |                        | 1 = add   |
|               |          |                        | 2 = last  |
| P2            | byte (1) | ----                   | not used  |
| L             | byte (1) | Bytes in payload       | (depends) |
The first packet/chunk includes only the derivation path

All other packets/chunks contain data chunks that are described below

#####   

| Field   | Type     | Content              | Expected |
| ------- | -------- | -------------------- | -------- |
| Path[0] | byte (4) | Derivation Path Data | 44       |
| Path[1] | byte (4) | Derivation Path Data | 354      |
| Path[2] | byte (4) | Derivation Path Data | ?        |
| Path[3] | byte (4) | Derivation Path Data | ?        |
| Path[4] | byte (4) | Derivation Path Data | ?        |

##### Other Chunks/Packets

| Field   | Type     | Content         | Expected |
| ------- | -------- | --------------- | -------- |
| Message | bytes... | Message to Sign |          |

#### Response 

| Field   | Type      | Content     | Note                     |
| ------- | --------- | ----------- | ------------------------ |
| SIG     | byte (64) | Signature   |                          |
| SW1-SW2 | byte (2)  | Return code | see list of return codes |

---
### INS_SIGN_SR25519 

#### Command

| Field         | Type     | Content                | Expected  |
| ------------- | -------- | ---------------------- | --------- |
| CLA           | byte (1) | Application Identifier | 0x80      |
| INS_SIGN      | byte (1) | Sign Instruction       | 0x02      |
| P1_CONFIRM    | byte (1) | Payload desc           | 0x01      |
|               |          |                        | 1 = add   |
|               |          |                        | 2 = last  |
| P2            | byte (1) | ----                   | not used  |
| L             | byte (1) | Bytes in payload       | (depends) |

The first packet/chunk includes only the derivation path

All other packets/chunks contain data chunks that are described below

##### First Packet

| Field   | Type     | Content              | Expected |
| ------- | -------- | -------------------- | -------- |
| Path[0] | byte (4) | Derivation Path Data | 44       |
| Path[1] | byte (4) | Derivation Path Data | 5741564  |
| Path[2] | byte (4) | Derivation Path Data | ?        |
| Path[3] | byte (4) | Derivation Path Data | ?        |
| Path[4] | byte (4) | Derivation Path Data | ?        |

##### Other Chunks/Packets

| Field   | Type     | Content         | Expected |
| ------- | -------- | --------------- | -------- |
| Message | bytes... | Message to Sign |          |

#### Response

| Field   | Type      | Content     | Note                     |
| ------- | --------- | ----------- | ------------------------ |
| SIG     | byte (64) | Signature   |                          |
| SW1-SW2 | byte (2)  | Return code | see list of return codes |
