import 'package:redux/redux.dart';
import 'package:redux_tutorial/models/post.dart';
import 'package:redux_tutorial/models/user.dart';
import 'package:redux_tutorial/store/application_state.dart';
import 'package:redux_tutorial/store/posts/actions.dart';

class UserProfileScreenViewModel {
  final Store<ApplicationState> _store;
  final User user;
  final List<Post> posts;
  final bool isLoading;
  final String? errorMessage;

  bool get hasAnyPosts => posts.isNotEmpty;
  bool get hasError => errorMessage != null && posts.isEmpty;

  UserProfileScreenViewModel(
    this._store,
    this.user,
    this.posts,
    this.isLoading,
    this.errorMessage,
  );

  static UserProfileScreenViewModel converter(
    Store<ApplicationState> store,
    int userId,
  ) {
    return UserProfileScreenViewModel(
      store,
      store.state.usersState.data[userId]!,
      store.state.postsState.data.values
          .where((post) => post.createdBy == userId)
          .toList(),
      store.state.postsState.isLoading,
      store.state.postsState.errorMessage,
    );
  }

  void loadPosts() => _store.dispatch(LoadPostsAction(user.id));
}
