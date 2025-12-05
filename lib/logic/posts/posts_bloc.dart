import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repository/post_repository.dart';
import 'posts_event.dart';
import 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final PostRepository postRepository;

  PostsBloc({required this.postRepository}) : super(PostsInitial()) {
    on<LoadPostsEvent>(_onLoadPosts);
    on<RefreshPostsEvent>(_onRefreshPosts);
    on<MarkPostAsReadEvent>(_onMarkAsRead);
  }

  Future<void> _onLoadPosts(
    LoadPostsEvent event,
    Emitter<PostsState> emit,
  ) async {
    try {
      emit(PostsLoading());

      // 1. Load local data first
      final localPosts = await postRepository.getLocalPosts();
      if (localPosts.isNotEmpty) {
        emit(PostsLoaded(localPosts));
      }

      // 2. Then sync with API
      final remotePosts = await postRepository.fetchAndCachePosts();
      emit(PostsLoaded(remotePosts));
    } catch (e) {
      emit(PostsError(e.toString()));
    }
  }

  Future<void> _onRefreshPosts(
    RefreshPostsEvent event,
    Emitter<PostsState> emit,
  ) async {
    try {
      emit(PostsLoading());
      final remotePosts = await postRepository.fetchAndCachePosts();
      emit(PostsLoaded(remotePosts));
    } catch (e) {
      emit(PostsError(e.toString()));
    }
  }

  Future<void> _onMarkAsRead(
    MarkPostAsReadEvent event,
    Emitter<PostsState> emit,
  ) async {
    final currentState = state;
    if (currentState is PostsLoaded) {
      final updatedPosts = currentState.posts.map((p) {
        if (p.id == event.post.id) {
          return p.copyWith(isRead: true);
        }
        return p;
      }).toList();

      emit(PostsLoaded(updatedPosts));
      await postRepository.updateReadStatus(updatedPosts);
    }
  }
}
