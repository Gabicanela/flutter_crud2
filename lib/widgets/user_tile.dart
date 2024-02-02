import 'package:flutter/material.dart';
import 'package:flutter_crud2/models/user.dart';
import 'package:flutter_crud2/routes/app_routes.dart';

class UserTile extends StatelessWidget {

  final User user;

  const UserTile(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    var avatar = user.avatarURL == user.avatarURL.isEmpty ? const CircleAvatar(child: Icon(Icons.person)) : CircleAvatar(backgroundImage: NetworkImage(user.avatarURL),);

    return ListTile(
      leading: avatar,
      title: Text(user.name),
      subtitle: Text(user.email),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.edit),
              color: Colors.orange,
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.USER_FORM,
                  arguments: user,
                );
              },
              ),
              IconButton(
              icon: const Icon(Icons.delete),
              color: Colors.red,
              onPressed: () {},
              )
          ],
        ),
      ),
    );
  }
}