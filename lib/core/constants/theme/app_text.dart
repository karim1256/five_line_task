import 'package:five_line_task/core/constants/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextTheme {
  static TextTheme get textTheme => TextTheme(
    displayLarge: TextStyle(
      fontWeight: FontWeight.bold,
      color: AppColors.lightTitle,
      fontSize: 23.sp,
    ),
    displayMedium: TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.white,
      fontSize: 18.sp,
    ),
    displaySmall: TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.white,
      fontSize: 14.sp,
    ),
    bodyMedium: TextStyle(
      fontWeight: FontWeight.w500,
      color: AppColors.greyText,
      fontSize: 13.sp,
    ),
    bodySmall: TextStyle(
      fontWeight: FontWeight.normal,
      color: AppColors.lightText,
      fontSize: 15.sp,
    ),
  );

  // Helper methods
  static TextStyle get headingMediumBold => textTheme.displayMedium!;
  static TextStyle get headingSmallBold => textTheme.displaySmall!;
  static TextStyle get headingLightBold => textTheme.displayLarge!;

  static TextStyle get bodySmallGrey => textTheme.bodyMedium!;
  static TextStyle get bodySmallLight => textTheme.bodySmall!;
}
