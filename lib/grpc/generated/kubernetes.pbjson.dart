///
//  Generated code. Do not modify.
//  source: kubernetes.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use getNamespaceListReuqestDescriptor instead')
const GetNamespaceListReuqest$json = const {
  '1': 'GetNamespaceListReuqest',
};

/// Descriptor for `GetNamespaceListReuqest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getNamespaceListReuqestDescriptor = $convert.base64Decode('ChdHZXROYW1lc3BhY2VMaXN0UmV1cWVzdA==');
@$core.Deprecated('Use getNamespaceListResponseDescriptor instead')
const GetNamespaceListResponse$json = const {
  '1': 'GetNamespaceListResponse',
  '2': const [
    const {'1': 'namespaces', '3': 1, '4': 3, '5': 9, '10': 'namespaces'},
  ],
};

/// Descriptor for `GetNamespaceListResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getNamespaceListResponseDescriptor = $convert.base64Decode('ChhHZXROYW1lc3BhY2VMaXN0UmVzcG9uc2USHgoKbmFtZXNwYWNlcxgBIAMoCVIKbmFtZXNwYWNlcw==');
@$core.Deprecated('Use getKServiceListReuqestDescriptor instead')
const GetKServiceListReuqest$json = const {
  '1': 'GetKServiceListReuqest',
  '2': const [
    const {'1': 'namespace', '3': 1, '4': 1, '5': 9, '10': 'namespace'},
  ],
};

/// Descriptor for `GetKServiceListReuqest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getKServiceListReuqestDescriptor = $convert.base64Decode('ChZHZXRLU2VydmljZUxpc3RSZXVxZXN0EhwKCW5hbWVzcGFjZRgBIAEoCVIJbmFtZXNwYWNl');
@$core.Deprecated('Use getKServiceListResponseDescriptor instead')
const GetKServiceListResponse$json = const {
  '1': 'GetKServiceListResponse',
  '2': const [
    const {'1': 'services', '3': 1, '4': 3, '5': 9, '10': 'services'},
  ],
};

/// Descriptor for `GetKServiceListResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getKServiceListResponseDescriptor = $convert.base64Decode('ChdHZXRLU2VydmljZUxpc3RSZXNwb25zZRIaCghzZXJ2aWNlcxgBIAMoCVIIc2VydmljZXM=');
