import 'package:flutter/material.dart';
import 'package:redux_tutorial/models/user.dart';

class UserListTile extends StatelessWidget {
  final User user;
  final void Function() onPressed;

  const UserListTile({
    Key? key,
    required this.user,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPressed,
      title: Text(user.name),
      subtitle: Text(user.email),
    );
  }
}
