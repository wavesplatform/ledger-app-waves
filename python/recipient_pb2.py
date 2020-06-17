# -*- coding: utf-8 -*-
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: recipient.proto

from google.protobuf import descriptor as _descriptor
from google.protobuf import message as _message
from google.protobuf import reflection as _reflection
from google.protobuf import symbol_database as _symbol_database
# @@protoc_insertion_point(imports)

_sym_db = _symbol_database.Default()


import nanopb_pb2 as nanopb__pb2


DESCRIPTOR = _descriptor.FileDescriptor(
  name='recipient.proto',
  package='waves',
  syntax='proto3',
  serialized_options=b'\n&com.wavesplatform.protobuf.transaction\252\002\005Waves',
  serialized_pb=b'\n\x0frecipient.proto\x12\x05waves\x1a\x0cnanopb.proto\"j\n\tRecipient\x12,\n\x0fpublic_key_hash\x18\x01 \x01(\x0c\x42\x11\x92?\x0e\x92\x01\x0b\x63onst char*H\x00\x12\"\n\x05\x61lias\x18\x02 \x01(\tB\x11\x92?\x0e\x92\x01\x0b\x63onst char*H\x00\x42\x0b\n\trecipientB0\n&com.wavesplatform.protobuf.transaction\xaa\x02\x05Wavesb\x06proto3'
  ,
  dependencies=[nanopb__pb2.DESCRIPTOR,])




_RECIPIENT = _descriptor.Descriptor(
  name='Recipient',
  full_name='waves.Recipient',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  fields=[
    _descriptor.FieldDescriptor(
      name='public_key_hash', full_name='waves.Recipient.public_key_hash', index=0,
      number=1, type=12, cpp_type=9, label=1,
      has_default_value=False, default_value=b"",
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=b'\222?\016\222\001\013const char*', file=DESCRIPTOR),
    _descriptor.FieldDescriptor(
      name='alias', full_name='waves.Recipient.alias', index=1,
      number=2, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=b"".decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=b'\222?\016\222\001\013const char*', file=DESCRIPTOR),
  ],
  extensions=[
  ],
  nested_types=[],
  enum_types=[
  ],
  serialized_options=None,
  is_extendable=False,
  syntax='proto3',
  extension_ranges=[],
  oneofs=[
    _descriptor.OneofDescriptor(
      name='recipient', full_name='waves.Recipient.recipient',
      index=0, containing_type=None, fields=[]),
  ],
  serialized_start=40,
  serialized_end=146,
)

_RECIPIENT.oneofs_by_name['recipient'].fields.append(
  _RECIPIENT.fields_by_name['public_key_hash'])
_RECIPIENT.fields_by_name['public_key_hash'].containing_oneof = _RECIPIENT.oneofs_by_name['recipient']
_RECIPIENT.oneofs_by_name['recipient'].fields.append(
  _RECIPIENT.fields_by_name['alias'])
_RECIPIENT.fields_by_name['alias'].containing_oneof = _RECIPIENT.oneofs_by_name['recipient']
DESCRIPTOR.message_types_by_name['Recipient'] = _RECIPIENT
_sym_db.RegisterFileDescriptor(DESCRIPTOR)

Recipient = _reflection.GeneratedProtocolMessageType('Recipient', (_message.Message,), {
  'DESCRIPTOR' : _RECIPIENT,
  '__module__' : 'recipient_pb2'
  # @@protoc_insertion_point(class_scope:waves.Recipient)
  })
_sym_db.RegisterMessage(Recipient)


DESCRIPTOR._options = None
_RECIPIENT.fields_by_name['public_key_hash']._options = None
_RECIPIENT.fields_by_name['alias']._options = None
# @@protoc_insertion_point(module_scope)
