import 'package:bloc/bloc.dart';
import 'package:bloc_api/src/model/post.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../../repository/post_repository.dart';
part 'bloc_api_event.dart';
part 'bloc_api_state.dart';

class PostBloc extends Bloc<PostEvent, PostApiState> {
  final PostRepository _postRepository;

  PostBloc(this._postRepository) : super(PostLoadingState()) {
    on<LoadPostEvent>((event, emit) async {
      emit(PostLoadingState());
      try {
        final post = await _postRepository.fetchPost();
        emit(PostLoadedState(post));
      } catch (e) {
        emit(PostErrorState(e.toString()));
      }
    });
  }
}
