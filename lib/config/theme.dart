import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,

      // Scaffold Background
      scaffoldBackgroundColor: AppColors.bg,

      // Color Scheme
      colorScheme: ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        surface: AppColors.cardSurface,
        onSurface: AppColors.primary,
      ),

      // App Bar
      appBarTheme: const AppBarTheme(
        backgroundColor: Color.fromARGB(255, 241, 193, 157),
        foregroundColor: AppColors.primary,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
      ),

      // Text Theme
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          color: AppColors.primary,
          fontWeight: FontWeight.bold,
        ),
        bodyMedium: TextStyle(color: AppColors.primary),
        bodySmall: TextStyle(color: AppColors.primary),
      ),

      // Icons
      iconTheme: const IconThemeData(color: AppColors.primary),

      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),
    );
  }
}
