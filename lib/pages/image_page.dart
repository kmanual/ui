import 'package:flutter/material.dart';
import 'package:kmanual/grpc/generated/repository.pb.dart';
import 'package:kmanual/grpc/grpc_glient.dart';

class ImagePage extends StatefulWidget {
  ImagePage({Key? key}) : super(key: key);

  @override
  _ImagePageState createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final name = args['name'] ?? '';

    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: FutureBuilder<GetTagListResponse>(
        future: GrpcClient().getTagList(name),
        builder: (context, AsyncSnapshot<GetTagListResponse> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: Text('Loading...'),
            );
          }
          return ListView(
            children: snapshot.data!.tags
                .map(
                  (e) => ListTile(
                    title: Text(e),
                    onTap: () {},
                  ),
                )
                .toList(),
          );
        },
      ),
    );
  }
}
