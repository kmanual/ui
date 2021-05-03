import 'package:flutter/material.dart';
import 'package:kmanual/grpc/generated/project.pbgrpc.dart';
import 'package:kmanual/grpc/grpc_glient.dart';

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
      body: FutureBuilder<GetListResponse>(
        future: GrpcClient().getList(),
        builder: (context, AsyncSnapshot<GetListResponse> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: Text('Loading...'),
            );
          }
          return ListView(
            children: snapshot.data!.projects
                .map(
                  (project) => ListTile(
                    title: Text(project.displayName),
                    subtitle: Text('${project.name}: ${project.image}'),
                    trailing: IconButton(
                      icon: Icon(Icons.upload),
                      tooltip: 'Deploy to Cluster',
                      onPressed: () {
                        GrpcClient().deploy(project.id);
                      },
                    ),
                  ),
                )
                .toList(),
          );
        },
      ),
    );
  }
}
