import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/post_model.dart';
import '../../../logic/post_detail/post_detail_bloc.dart';
import '../../../logic/post_detail/post_detail_event.dart';
import '../../../logic/post_detail/post_detail_state.dart';
import '../../widgets/app_loader.dart';
import '../../widgets/error_message.dart';

class PostDetailScreen extends StatefulWidget {
  final PostModel post;

  const PostDetailScreen({super.key, required this.post});

  @override
  State<PostDetailScreen> createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  @override
  void initState() {
    super.initState();
    context.read<PostDetailBloc>().add(PostDetailEvent(widget.post.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(children: [Image.asset("assets/task.png", height: 55)]),
      ),
      body: BlocBuilder<PostDetailBloc, PostDetailState>(
        builder: (context, state) {
          if (state is PostDetailLoading) {
            return const AppLoader();
          } else if (state is PostDetailError) {
            return ErrorMessage(
              message: state.message,
              onRetry: () => context.read<PostDetailBloc>().add(
                PostDetailEvent(widget.post.id),
              ),
            );
          } else if (state is PostDetailLoaded) {
            final post = state.post;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      post.title,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      post.body,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
