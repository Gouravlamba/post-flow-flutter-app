import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/bottom_nav/bottom_nav_cubit.dart';
import '../posts/posts_list_screen.dart';
import '../settings/settings_screen.dart';
import 'home_page.dart';
import '../../widgets/bottom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static final List<Widget> _screens = [
    const HomePage(),
    const PostsListScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(
          body: _screens[currentIndex],
          bottomNavigationBar: BottomNavBar(currentIndex: currentIndex),
        );
      },
    );
  }
}
