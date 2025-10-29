import 'package:five_line_task/core/constants/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {

  static final lightTheme = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.lightBackground,
      elevation: 0,
    ),
    fontFamily: 'Satoshi',
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.lightBackground,
    brightness: Brightness.light,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ), // RoundedRectangleBorder
      ), // ElevatedButton.styleFrom
    ), // ElevatedButtonThemeData
  );
  static final darkTheme = ThemeData(
    
        fontFamily: 'Satoshi',
  primaryColor: AppColors.primary,
  scaffoldBackgroundColor: AppColors.darkBackground,
  brightness: Brightness.dark,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primary,
      textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ), // RoundedRectangleBorder
    ), // ElevatedButton.styleFrom
  ), // ElevatedButtonThemeData
); // ThemeData
}