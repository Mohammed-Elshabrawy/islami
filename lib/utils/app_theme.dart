import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static final ThemeData darkMode = ThemeData(
      scaffoldBackgroundColor: AppColors.transparentColor,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: AppColors.goldColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),

      backgroundColor: AppColors.blackColor,
      iconTheme: IconThemeData(
        color: AppColors.goldColor
      ),
    ),
  );
}