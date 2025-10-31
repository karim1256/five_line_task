


import 'package:five_line_task/core/constants/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';  
class AuthSeparator extends StatelessWidget {
  const AuthSeparator({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(color: AppColors.textForm, width: 125.w, height: 1),
        SizedBox(width: 8.w),
        Text(
          "or",
          textAlign: TextAlign.left,
          style: TextStyle(
            color: AppColors.lightTitle,
            fontSize: 13.sp,
          ),
        ),
        SizedBox(width: 8.w),
        Container(color: AppColors.textForm, width: 125.w, height: 1),
      ],
    );
  }
}