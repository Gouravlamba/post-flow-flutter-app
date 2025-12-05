import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/bottom_nav/bottom_nav_cubit.dart';
import '../../core/constants/app_colors.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;

  const BottomNavBar({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: AppColors.navBarBg,
      selectedItemColor: AppColors.navBarSelected,
      unselectedItemColor: AppColors.navBarUnselected,
      currentIndex: currentIndex,
      onTap: (index) => context.read<BottomNavCubit>().changeTab(index),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(
          icon: Icon(Icons.article_outlined),
          label: 'Posts',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
      ],
    );
  }
}
