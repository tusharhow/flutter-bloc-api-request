part of 'bloc_api_bloc.dart';

@immutable
abstract class PostEvent extends Equatable {
  const PostEvent();
}

class LoadPostEvent extends PostEvent {
  @override
  List<Object> get props => [];
}