import 'package:flutter/cupertino.dart';
import 'package:redux_tutorial/models/post.dart';
import 'package:redux_tutorial/models/user.dart';

class ApplicationState {
  final DataState<User> usersState;
  final DataState<Post> postsState;

  ApplicationState(
    this.usersState,
    this.postsState,
  );

  factory ApplicationState.initial() {
    return ApplicationState(
      DataState<User>.initial(),
      DataState<Post>.initial(),
    );
  }

  ApplicationState copyWith({
    DataState<User>? usersState,
    DataState<Post>? postsState,
  }) {
    return ApplicationState(
      usersState ?? this.usersState,
      postsState ?? this.postsState,
    );
  }

  @override
  int get hashCode => hashValues(usersState, postsState);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is ApplicationState &&
            usersState == other.usersState &&
            postsState == other.postsState);
  }
}

class DataState<T> {
  final Map<int, T> data;
  final String? errorMessage;
  final bool isLoading;

  factory DataState.initial() {
    return DataState(
      {},
      null,
      false,
    );
  }

  DataState(
    this.data,
    this.errorMessage,
    this.isLoading,
  );

  DataState<T> copyWith({
    Map<int, T>? data,
    String? errorMessage,
    bool? isLoading,
  }) {
    return DataState<T>(
      data ?? this.data,
      // If data is non-null, we wipe any previous error message
      data != null ? null : errorMessage ?? this.errorMessage,
      isLoading ?? this.isLoading,
    );
  }

  @override
  int get hashCode => hashValues(data, errorMessage, isLoading);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is DataState<T> &&
            data == other.data &&
            errorMessage == other.errorMessage &&
            isLoading == other.isLoading);
  }
}
