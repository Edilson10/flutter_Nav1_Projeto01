import 'package:flutter/material.dart';
import 'package:projeto01/controllers/home_controller.dart';
import 'package:projeto01/models/post_model.dart';
import 'package:projeto01/repositories/home_repository_imp.dart';
import 'package:projeto01/repositories/home_repository_mock.dart';
// ignore_for_file: prefer_const_constructors

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController _controller = HomeController(HomeRepositoryImp());

  @override
  void initState() {
    super.initState();
    _controller.fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: ValueListenableBuilder<List<PostModel>>(
          valueListenable: _controller.posts,
          builder: (_, list, __) {
            return ListView.separated(
              shrinkWrap: true,
              itemCount: list.length,
              itemBuilder: (
                _,
                idx,
              ) =>
                  ListTile(
                leading: Text(list[idx].id.toString()),
                title: Text(list[idx].title),
                trailing: Icon(Icons.arrow_forward),
                onTap: () => Navigator.of(context)
                    .pushNamed('/details', arguments: list[idx]),
              ),
              separatorBuilder: (_, __) => Divider(),
            );
          }),
    );
  }
}
