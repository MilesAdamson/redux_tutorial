import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_tutorial/components/post_list_tile.dart';
import 'package:redux_tutorial/store/application_state.dart';
import 'package:redux_tutorial/view_models/user_profile_screen_view_model.dart';

class UserProfileScreen extends StatefulWidget {
  // Pass the id, not the user. We want this screen
  // to be reactive to changes to the user, using a
  // view model to get the most recent version in the store
  final int userId;

  const UserProfileScreen({
    Key? key,
    required this.userId,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => UserProfileScreenState();
}

class UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<ApplicationState, UserProfileScreenViewModel>(
      converter: (store) => UserProfileScreenViewModel.converter(
        store,
        widget.userId,
      ),
      onInitialBuild: (viewModel) => viewModel.loadPosts(),
      builder: (context, viewModel) {
        return Scaffold(
          appBar: AppBar(
            title: Text(viewModel.user.name),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: CircleAvatar(
                  child: Text(viewModel.user.initials),
                  radius: 60,
                ),
              ),
              buildContactInfo(viewModel),
              const Divider(
                height: 1,
                color: Colors.black,
              ),
              Expanded(
                child: Builder(
                  builder: (context) {
                    if (viewModel.isLoading) {
                      return const Center(
                        child: Text("Fetching posts..."),
                      );
                    }

                    if (viewModel.hasError) {
                      return Center(
                        child: Text(viewModel.errorMessage!),
                      );
                    }

                    return ListView.builder(
                      itemCount: viewModel.posts.length,
                      itemBuilder: (context, i) =>
                          PostListTile(post: viewModel.posts[i]),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Row buildContactInfo(UserProfileScreenViewModel viewModel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            alignment: Alignment.centerRight,
            child: Text(viewModel.user.email),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Container(
            width: 1,
            height: 20,
            color: Colors.black,
          ),
        ),
        Expanded(
          child: Container(
            alignment: Alignment.centerLeft,
            child: Text(viewModel.user.phone),
          ),
        ),
      ],
    );
  }
}
