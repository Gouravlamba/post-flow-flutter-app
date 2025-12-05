import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/post_model.dart';
import '../../core/constants/app_colors.dart';
import '../../config/routes.dart';
import '../../logic/posts/posts_bloc.dart';
import '../../logic/posts/posts_event.dart';

class PostItemCard extends StatelessWidget {
  final PostModel post;

  const PostItemCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    final bool isRead = post.isRead;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isRead ? AppColors.readColor : null,

        gradient: isRead
            ? null
            : LinearGradient(
                colors: [
                  AppColors.unreadGradientStart,
                  AppColors.unreadGradientEnd,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),

        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.black12, width: 1),
        boxShadow: const [
          BoxShadow(color: Colors.black26, blurRadius: 4, offset: Offset(2, 2)),
        ],
      ),

      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 10,
        ),

        title: Text(
          post.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: isRead ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),

        subtitle: Text(
          post.body,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: isRead ? Colors.white70 : Colors.black87,
            fontSize: 13,
          ),
        ),

        onTap: () {
          context.read<PostsBloc>().add(MarkPostAsReadEvent(post));

          Navigator.of(
            context,
          ).pushNamed(AppRoutes.postDetail, arguments: post);
        },
      ),
    );
  }
}
