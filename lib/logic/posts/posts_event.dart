import 'package:equatable/equatable.dart';

import '../../data/models/post_model.dart';

abstract class PostsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadPostsEvent extends PostsEvent {}

class RefreshPostsEvent extends PostsEvent {}

class MarkPostAsReadEvent extends PostsEvent {
  final PostModel post;

  MarkPostAsReadEvent(this.post);

  @override
  List<Object?> get props => [post];
}
