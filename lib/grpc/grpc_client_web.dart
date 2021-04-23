import 'package:grpc/grpc_web.dart';
import 'package:grpc/service_api.dart';
import 'package:kmanual/config.dart';

ClientChannel createChannel() {
  return GrpcWebClientChannel.xhr(
    Uri.parse(endpoint),
  );
}
