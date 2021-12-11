import 'package:redux/redux.dart';
import 'package:redux_tutorial/api/api.dart';
import 'package:redux_tutorial/store/application_state.dart';
import 'package:redux_tutorial/store/users/actions.dart';

class UsersMiddleware implements MiddlewareClass<ApplicationState> {
  final Api api;

  UsersMiddleware(this.api);

  @override
  void call(
    Store<ApplicationState> store,
    dynamic action,
    NextDispatcher next,
  ) async {
    // DO NOT FORGET THIS. If you do, this middleware
    // will "break" the chain of NextDispatcher's
    next(action);

    if (action is LoadUsersAction) {
      try {
        final users = await api.getUsers();
        store.dispatch(LoadUsersSucceededAction(users));
      } on ApiException catch (e) {
        store.dispatch(LoadUsersFailedAction(e.message));
      }
    }
  }
}
