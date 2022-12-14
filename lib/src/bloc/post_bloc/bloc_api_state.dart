part of 'bloc_api_bloc.dart';

abstract class PostApiState extends Equatable {}

class PostLoadingState extends PostApiState {
  @override
  List<Object?> get props => [];
}

class PostLoadedState extends PostApiState {
  final List<Post> post;

  PostLoadedState(this.post);

  @override
  List<Object?> get props => [post];
}

class PostErrorState extends PostApiState {
  final String error;

  PostErrorState(this.error);

  @override
  List<Object?> get props => [error];
}
