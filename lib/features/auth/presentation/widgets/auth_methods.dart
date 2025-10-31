import 'package:five_line_task/core/constants/assets_path/app_vectors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:svg_flutter/svg.dart';

class AuthMethouds extends StatelessWidget {
  const AuthMethouds({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(AppVectors.google, width: 25.w),
        SizedBox(width: 50.w),
        SvgPicture.asset(AppVectors.apple, width: 25.w),
      ],
    );
  }
}
