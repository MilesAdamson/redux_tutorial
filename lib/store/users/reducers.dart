import 'package:redux/redux.dart';
import 'package:redux_tutorial/models/user.dart';
import 'package:redux_tutorial/store/application_state.dart';
import 'package:redux_tutorial/store/users/actions.dart';

final usersReducer = combineReducers<DataState<User>>([
  TypedReducer<DataState<User>, LoadUsersAction>(onUsersLoading),
  TypedReducer<DataState<User>, LoadUsersSucceededAction>(onUsersLoaded),
  TypedReducer<DataState<User>, LoadUsersFailedAction>(onUsersLoadFailure),
]);

DataState<User> onUsersLoading(
  DataState<User> state,
  LoadUsersAction action,
) {
  return state.copyWith(isLoading: true);
}

DataState<User> onUsersLoaded(
  DataState<User> state,
  LoadUsersSucceededAction action,
) {
  final users = Map<int, User>.from(state.data);

  for (final user in action.users) {
    users[user.id] = user;
  }

  return state.copyWith(
    isLoading: false,
    data: users,
  );
}

DataState<User> onUsersLoadFailure(
  DataState<User> state,
  LoadUsersFailedAction action,
) {
  return state.copyWith(isLoading: false, errorMessage: action.error);
}
