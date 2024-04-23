//
//  Generated code. Do not modify.
//  source: news.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use emptyDescriptor instead')
const Empty$json = {
  '1': 'Empty',
};

/// Descriptor for `Empty`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List emptyDescriptor = $convert.base64Decode(
    'CgVFbXB0eQ==');

@$core.Deprecated('Use newsIdDescriptor instead')
const NewsId$json = {
  '1': 'NewsId',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `NewsId`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List newsIdDescriptor = $convert.base64Decode(
    'CgZOZXdzSWQSDgoCaWQYASABKAlSAmlk');

@$core.Deprecated('Use newsDescriptor instead')
const News$json = {
  '1': 'News',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
    {'1': 'body', '3': 3, '4': 1, '5': 9, '10': 'body'},
    {'1': 'postImage', '3': 4, '4': 1, '5': 9, '10': 'postImage'},
  ],
};

/// Descriptor for `News`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List newsDescriptor = $convert.base64Decode(
    'CgROZXdzEg4KAmlkGAEgASgJUgJpZBIUCgV0aXRsZRgCIAEoCVIFdGl0bGUSEgoEYm9keRgDIA'
    'EoCVIEYm9keRIcCglwb3N0SW1hZ2UYBCABKAlSCXBvc3RJbWFnZQ==');

@$core.Deprecated('Use newsListDescriptor instead')
const NewsList$json = {
  '1': 'NewsList',
  '2': [
    {'1': 'news', '3': 1, '4': 3, '5': 11, '6': '.News', '10': 'news'},
  ],
};

/// Descriptor for `NewsList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List newsListDescriptor = $convert.base64Decode(
    'CghOZXdzTGlzdBIZCgRuZXdzGAEgAygLMgUuTmV3c1IEbmV3cw==');

