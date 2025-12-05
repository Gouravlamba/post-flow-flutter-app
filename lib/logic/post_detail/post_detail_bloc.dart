import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/post_model.dart';
import '../../data/repository/post_repository.dart';
import 'post_detail_event.dart';
import 'post_detail_state.dart';

class PostDetailBloc extends Bloc<PostDetailEvent, PostDetailState> {
  final PostRepository postRepository;

  PostDetailBloc({required this.postRepository}) : super(PostDetailInitial()) {
    on<PostDetailEvent>(_onLoadPostDetail);
  }

  Future<void> _onLoadPostDetail(
    PostDetailEvent event,
    Emitter<PostDetailState> emit,
  ) async {
    try {
      emit(PostDetailLoading());
      final PostModel post = await postRepository.getPostDetail(event.postId);
      emit(PostDetailLoaded(post));
    } catch (e) {
      emit(PostDetailError(e.toString()));
    }
  }
}
