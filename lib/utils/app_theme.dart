import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static final ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.blackColor,
    canvasColor: AppColors.blackColor,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: AppColors.goldColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      backgroundColor: AppColors.blackColor,
      surfaceTintColor: Colors.transparent,
      iconTheme: IconThemeData(color: AppColors.goldColor),
    ),
  );
}
