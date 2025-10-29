import 'package:five_line_task/core/constants/assets_path/app_images.dart';
import 'package:five_line_task/core/constants/theme/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget logo({double width = 0.18}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(AppImages.logo, width: width.sw),
      SizedBox(width: 8.w),
      Text('MyTasks', style: AppTextTheme.logoTitle),
    ],
  );
}
