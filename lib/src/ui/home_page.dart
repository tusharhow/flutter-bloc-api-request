import 'package:bloc_api/src/bloc/post_bloc/bloc_api_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../components/post_listview_item.dart';
import '../repository/post_repository.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostBloc(
        RepositoryProvider.of<PostRepository>(context),
      )..add(LoadPostEvent()),
      child: Scaffold(
        appBar: AppBar(title: const Text('The Post App')),
        body: BlocBuilder<PostBloc, PostApiState>(
          builder: (context, state) {
            if (state is PostLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is PostLoadedState) {
              final post = state.post;
              return PostListViewItem(post: post, loadedState: state);
            } else if (state is PostErrorState) {
              return Center(
                child: Text(state.error.toString()),
              );
            }
            return const Center(
              child: Text('Something went wrong'),
            );
          },
        ),
      ),
    );
  }
}
