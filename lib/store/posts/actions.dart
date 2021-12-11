import 'package:redux_tutorial/models/post.dart';

abstract class PostsAction {}

class LoadPostsAction implements PostsAction {
  final int userId;

  LoadPostsAction(this.userId);

  @override
  String toString() => "$LoadPostsAction";
}

class LoadPostsSucceededAction implements PostsAction {
  final List<Post> posts;

  LoadPostsSucceededAction(this.posts);

  @override
  String toString() => "$LoadPostsSucceededAction";
}

class LoadPostsFailedAction implements PostsAction {
  final String error;

  LoadPostsFailedAction(this.error);

  @override
  String toString() => "$LoadPostsFailedAction($error)";
}
