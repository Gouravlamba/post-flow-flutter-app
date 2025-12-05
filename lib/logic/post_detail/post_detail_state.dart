import 'package:equatable/equatable.dart';

import '../../data/models/post_model.dart';

abstract class PostDetailState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PostDetailInitial extends PostDetailState {}

class PostDetailLoading extends PostDetailState {}

class PostDetailLoaded extends PostDetailState {
  final PostModel post;

  PostDetailLoaded(this.post);

  @override
  List<Object?> get props => [post];
}

class PostDetailError extends PostDetailState {
  final String message;

  PostDetailError(this.message);

  @override
  List<Object?> get props => [message];
}
