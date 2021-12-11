import 'package:redux_tutorial/models/user.dart';

abstract class UsersAction {}

class LoadUsersAction implements UsersAction {
  @override
  String toString() => "$LoadUsersAction";
}

class LoadUsersSucceededAction implements UsersAction {
  final List<User> users;

  LoadUsersSucceededAction(this.users);

  @override
  String toString() => "$LoadUsersSucceededAction";
}

class LoadUsersFailedAction implements UsersAction {
  final String error;

  LoadUsersFailedAction(this.error);

  @override
  String toString() => "$LoadUsersFailedAction($error)";
}
