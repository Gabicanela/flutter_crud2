import 'package:flutter/material.dart';
import 'package:flutter_crud2/provider/users.dart';
import 'package:flutter_crud2/routes/app_routes.dart';
import 'package:flutter_crud2/widgets/user_tile.dart';
import 'package:provider/provider.dart';

class UserList extends StatelessWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context) {
    final Users users = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de usuários'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.USER_FORM);
            }, icon: const Icon(Icons.add))
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, i) => UserTile(users.byIndex(i)),
        itemCount: users.count,
          ),
    );
  }
}