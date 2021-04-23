import 'package:flutter/material.dart';
import 'package:kmanual/grpc/generated/repository.pb.dart';
import 'package:kmanual/grpc/grpc_glient.dart';
import 'package:kmanual/pages/image_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kmanual'),
      ),
      body: FutureBuilder<GetImageListResponse>(
        future: GrpcClient().getImageList(true),
        builder: (context, AsyncSnapshot<GetImageListResponse> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: Text('Loading...'),
            );
          }
          return ListView(
            children: snapshot.data!.repositories
                .map(
                  (e) => ListTile(
                    title: Text(e),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ImagePage(),
                          settings: RouteSettings(
                            arguments: {'name': e},
                          ),
                        ),
                      );
                    },
                  ),
                )
                .toList(),
          );
        },
      ),
    );
  }
}
