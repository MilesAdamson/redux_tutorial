import 'package:redux/redux.dart';
import 'package:redux_tutorial/models/post.dart';
import 'package:redux_tutorial/store/application_state.dart';
import 'package:redux_tutorial/store/posts/actions.dart';

final postsReducer = combineReducers<DataState<Post>>([
  TypedReducer<DataState<Post>, LoadPostsAction>(onPostsLoading),
  TypedReducer<DataState<Post>, LoadPostsSucceededAction>(onPostsLoaded),
  TypedReducer<DataState<Post>, LoadPostsFailedAction>(onPostsLoadFailure),
]);

DataState<Post> onPostsLoading(
  DataState<Post> state,
  LoadPostsAction action,
) {
  return state.copyWith(isLoading: true);
}

DataState<Post> onPostsLoaded(
  DataState<Post> state,
  LoadPostsSucceededAction action,
) {
  final posts = Map<int, Post>.from(state.data);

  for (final post in action.posts) {
    posts[post.id] = post;
  }

  return state.copyWith(
    isLoading: false,
    data: posts,
  );
}

DataState<Post> onPostsLoadFailure(
  DataState<Post> state,
  LoadPostsFailedAction action,
) {
  return state.copyWith(isLoading: false, errorMessage: action.error);
}
