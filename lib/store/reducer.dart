import 'package:redux_tutorial/store/application_state.dart';
import 'package:redux_tutorial/store/posts/reducers.dart';
import 'package:redux_tutorial/store/users/reducers.dart';

// This is the top-level reducer which combines all other reducers.
// By combining them in this way, isolated state machines in our app can be
// in different classes, folders and files, making it easier to manage.
ApplicationState reducer(ApplicationState state, action) {
  return ApplicationState(
    usersReducer(state.usersState, action),
    postsReducer(state.postsState, action),
  );
}
