import 'dart:async';

import 'package:kmanual/grpc/generated/repository.pbgrpc.dart';
import 'package:kmanual/grpc/grpc_client_builder.dart';
import 'package:grpc/service_api.dart';

final grpc = GrpcClient();

class GrpcClient {
  final RepositoryClient client;

  static final GrpcClient _singleton = GrpcClient._internal();

  factory GrpcClient() => _singleton;

  static Future<void> _metadataProvider(
      Map<String, String> metadata, String uri) async {
    final String? _authToken = '...'; // await Preferences.getAuthToken();
    if (_authToken != null && _authToken.isNotEmpty) {
      metadata['Authorization'] = 'Bearer $_authToken';
    }
  }

  GrpcClient._internal()
      : client = RepositoryClient(
          createChannel(),
          options: CallOptions(
            providers: [_metadataProvider],
          ),
        );

  ResponseFuture<GetImageListResponse> getImageList(bool all) {
    return client.getImageList(GetImageListReuqest()..all = all);
  }
}
