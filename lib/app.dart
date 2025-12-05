import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/routes.dart';
import 'config/theme.dart';
import 'data/repository/post_repository.dart';
import 'logic/post_detail/post_detail_bloc.dart';
import 'presentation/screens/home/home_screen.dart';

class MyApp extends StatelessWidget {
  final PostRepository postRepository;

  const MyApp({super.key, required this.postRepository});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PostDetailBloc(postRepository: postRepository),
      child: MaterialApp(
        title: 'Knovator Posts App',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        onGenerateRoute: AppRoutes.onGenerateRoute,
        home: const HomeScreen(),
      ),
    );
  }
}
