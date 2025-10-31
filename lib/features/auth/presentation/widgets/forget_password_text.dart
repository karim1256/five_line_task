  import 'package:five_line_task/core/constants/app_strings.dart';
import 'package:five_line_task/core/constants/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


Widget forgetPasswordText() {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        AppStrings.forgetPassword,
        textAlign: TextAlign.left,
        style: TextStyle(color: AppColors.lightTitle, fontSize: 13.sp),
      ),
    );
  }