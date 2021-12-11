import 'package:redux/redux.dart';
import 'package:redux_tutorial/api/api.dart';
import 'package:redux_tutorial/store/application_state.dart';
import 'package:redux_tutorial/store/posts/actions.dart';

class PostsMiddleware implements MiddlewareClass<ApplicationState> {
  final Api api;

  PostsMiddleware(this.api);

  @override
  void call(
    Store<ApplicationState> store,
    dynamic action,
    NextDispatcher next,
  ) async {
    // DO NOT FORGET THIS. If you do, this middleware
    // will "break" the chain of NextDispatcher's
    next(action);

    if (action is LoadPostsAction) {
      try {
        final posts = await api.getPostsOfUser(action.userId);
        store.dispatch(LoadPostsSucceededAction(posts));
      } on ApiException catch (e) {
        store.dispatch(LoadPostsFailedAction(e.message));
      }
    }
  }
}
