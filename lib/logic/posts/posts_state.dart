import 'package:equatable/equatable.dart';

import '../../data/models/post_model.dart';

abstract class PostsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PostsInitial extends PostsState {}

class PostsLoading extends PostsState {}

class PostsLoaded extends PostsState {
  final List<PostModel> posts;

  PostsLoaded(this.posts);

  @override
  List<Object?> get props => [posts];
}

class PostsError extends PostsState {
  final String message;

  PostsError(this.message);

  @override
  List<Object?> get props => [message];
}
