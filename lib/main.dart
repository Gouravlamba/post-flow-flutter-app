import 'package:assignment/logic/posts/posts_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';
import 'data/repository/post_repository.dart';
import 'data/services/api_service.dart';
import 'data/services/local_storage_service.dart';
import 'data/local/local_database.dart';
import 'logic/posts/posts_bloc.dart';
import 'logic/bottom_nav/bottom_nav_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final localDb = await LocalDatabase.init();
  final localStorageService = LocalStorageService(localDatabase: localDb);
  final apiService = ApiService();
  final postRepository = PostRepository(
    apiService: apiService,
    localStorageService: localStorageService,
  );

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => BottomNavCubit()),
        BlocProvider(
          create: (_) =>
              PostsBloc(postRepository: postRepository)..add(LoadPostsEvent()),
        ),
      ],
      child: MyApp(postRepository: postRepository),
    ),
  );
}
