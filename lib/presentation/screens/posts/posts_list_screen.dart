import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/posts/posts_bloc.dart';
import '../../../logic/posts/posts_event.dart';
import '../../../logic/posts/posts_state.dart';
import '../../../data/models/post_model.dart';
import '../../widgets/post_item_card.dart';
import '../../widgets/app_loader.dart';
import '../../widgets/error_message.dart';

class PostsListScreen extends StatelessWidget {
  const PostsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset("assets/task.png", height: 55),
            const SizedBox(width: 10),
          ],
        ),
      ),
      body: BlocBuilder<PostsBloc, PostsState>(
        builder: (context, state) {
          if (state is PostsLoading) {
            return const AppLoader();
          } else if (state is PostsError) {
            return ErrorMessage(
              message: state.message,
              onRetry: () {
                context.read<PostsBloc>().add(LoadPostsEvent());
              },
            );
          } else if (state is PostsLoaded) {
            final posts = state.posts;
            if (posts.isEmpty) {
              return const Center(child: Text('No posts available'));
            }
            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final PostModel post = posts[index];
                return PostItemCard(post: post);
              },
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
