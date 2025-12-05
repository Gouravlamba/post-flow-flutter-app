import 'package:equatable/equatable.dart';

class PostDetailEvent extends Equatable {
  final int postId;

  const PostDetailEvent(this.postId);

  @override
  List<Object?> get props => [postId];
}
