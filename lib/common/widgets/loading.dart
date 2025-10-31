import 'package:five_line_task/core/constants/theme/app_colors.dart';
import 'package:flutter/material.dart';

Widget loading({Color? color}) {
  return Center(
    child: CircularProgressIndicator(
      color: color ?? AppColors.primary,
      strokeWidth: 5.0,
    ),
  );
}