import 'package:redux/redux.dart';
import 'package:redux_tutorial/models/user.dart';
import 'package:redux_tutorial/store/application_state.dart';
import 'package:redux_tutorial/store/users/actions.dart';

class HomeScreenViewModel {
  final Store<ApplicationState> _store;
  final bool isLoading;
  final List<User> users;
  final String? errorMessage;

  bool get hasAnyUsers => users.isNotEmpty;
  bool get hasError => errorMessage != null && users.isEmpty;

  HomeScreenViewModel(
    this._store,
    this.isLoading,
    this.users,
    this.errorMessage,
  );

  static HomeScreenViewModel converter(Store<ApplicationState> store) {
    return HomeScreenViewModel(
      store,
      store.state.usersState.isLoading,
      store.state.usersState.data.values.toList(),
      store.state.usersState.errorMessage,
    );
  }

  void loadUsers() => _store.dispatch(LoadUsersAction());
}
