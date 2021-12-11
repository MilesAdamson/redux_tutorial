import 'package:flutter/material.dart';
import 'package:redux_tutorial/models/post.dart';

class PostListTile extends StatelessWidget {
  final Post post;

  const PostListTile({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(post.title),
      subtitle: Text(post.body),
    );
  }
}
