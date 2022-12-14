import 'package:flutter/material.dart';
import '../bloc/post_bloc/bloc_api_bloc.dart';
import '../model/post.dart';

class PostListViewItem extends StatelessWidget {
  const PostListViewItem({
    Key? key,
    required this.post,
    required this.loadedState,
  }) : super(key: key);

  final List<Post> post;
  final PostLoadedState loadedState;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: post.length,
      itemBuilder: (context, index) {
        final post = loadedState.post[index];
        return ListTile(
          title: Text(post.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              )),
          subtitle: Text(
            post.body,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          leading: CircleAvatar(
            child: Text(post.id.toString()),
          ),
        );
      },
    );
  }
}
