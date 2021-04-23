import 'package:grpc/grpc.dart';
import 'package:grpc/grpc_connection_interface.dart';

ClientChannel createChannel() {
  return ClientChannel(
    'campfire.ir',
  );
}
