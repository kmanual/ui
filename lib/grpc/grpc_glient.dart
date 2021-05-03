import 'dart:async';

import 'package:kmanual/grpc/generated/kubernetes.pbgrpc.dart';
import 'package:kmanual/grpc/generated/project.pbgrpc.dart';
import 'package:kmanual/grpc/generated/repository.pbgrpc.dart';
import 'package:kmanual/grpc/grpc_client_builder.dart';
import 'package:grpc/service_api.dart';

final grpc = GrpcClient();

class GrpcClient {
  final RepositoryClient repository;
  final KubernetesClient kubernetes;
  final ProjectsClient projects;

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
      : repository = RepositoryClient(
          createChannel(),
          options: CallOptions(
            providers: [_metadataProvider],
          ),
        ),
        kubernetes = KubernetesClient(
          createChannel(),
          options: CallOptions(
            providers: [_metadataProvider],
          ),
        ),
        projects = ProjectsClient(
          createChannel(),
          options: CallOptions(
            providers: [_metadataProvider],
          ),
        );

  ResponseFuture<GetImageListResponse> getImageList(bool all) {
    return repository.getImageList(
      GetImageListReuqest()..all = all,
    );
  }

  ResponseFuture<GetTagListResponse> getTagList(String name) {
    return repository.getTagList(
      GetTagListReuqest()..name = name,
    );
  }

  ResponseFuture<GetManifestResponse> getManifest(String name, String tag) {
    return repository.getManifest(
      GetManifestReuqest()
        ..name = name
        ..tag = tag,
    );
  }

  ResponseFuture<GetKServiceListResponse> getKServiceList(String namespace) {
    return kubernetes.getKServiceList(
      GetKServiceListReuqest()..namespace = namespace,
    );
  }

  ResponseFuture<CreateResponse> create({
    required String name,
    required String displayName,
    required String image,
    String? tag,
    String namespace = 'default',
  }) {
    return projects.create(
      CreateReuqest()
        ..image = image
        ..name = name
        ..namespace = namespace
        ..tag = tag ?? ''
        ..displayName = displayName,
    );
  }

  ResponseFuture<GetListResponse> getList() {
    return projects.getList(
      GetListRequest(),
    );
  }

  ResponseFuture<DeployResponse> deploy(String id) {
    return projects.deploy(
      DeployRequest()..id = id,
    );
  }
}
