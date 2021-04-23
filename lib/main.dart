import 'package:flutter/material.dart';
import 'package:kmanual/grpc/generated/repository.pb.dart';
import 'package:kmanual/grpc/grpc_glient.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kmanual',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Kmanual'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({required this.title, Key? key}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
