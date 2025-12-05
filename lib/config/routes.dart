import 'package:flutter/material.dart';

import '../presentation/screens/home/home_screen.dart';
import '../presentation/screens/posts/post_detail_screen.dart';
import '../data/models/post_model.dart';

class AppRoutes {
  static const String home = '/';
  static const String postDetail = '/postDetail';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case postDetail:
        final post = settings.arguments as PostModel;
        return MaterialPageRoute(builder: (_) => PostDetailScreen(post: post));

      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('Route not found'))),
        );
    }
  }
}
