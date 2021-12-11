import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_tutorial/api/api.dart';
import 'package:redux_tutorial/components/home_screen.dart';
import 'package:redux_tutorial/store/application_state.dart';
import 'package:redux_tutorial/store/posts/middleware.dart';
import 'package:redux_tutorial/store/reducer.dart';
import 'package:redux_tutorial/store/users/middleware.dart';

void main() {
  final dio = Dio();
  dio.options.baseUrl = "https://jsonplaceholder.typicode.com/";
  final api = Api(dio);

  final store = Store<ApplicationState>(
    reducer,
    initialState: ApplicationState.initial(),
    middleware: [
      UsersMiddleware(api),
      PostsMiddleware(api),
    ],
  );

  runApp(MyApp(store: store));
}

class MyApp extends StatelessWidget {
  final Store<ApplicationState> store;

  const MyApp({
    required this.store,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<ApplicationState>(
      store: store,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
