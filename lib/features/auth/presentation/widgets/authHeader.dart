import 'package:easy_localization/easy_localization.dart';
import 'package:five_line_task/common/helpers.dart/is_dark_mode.dart';
import 'package:five_line_task/common/widgets/app_rich_text.dart';
import 'package:five_line_task/core/constants/app_strings.dart';
import 'package:five_line_task/core/constants/theme/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthHeader extends StatelessWidget {
  final String title;
  final String supportText1;
  final String supportText2;

  const AuthHeader({
    super.key,
    required this.title,
    required this.supportText1,
    required this.supportText2,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: title == AppStrings.signUp.tr() ? 20.h : 30.h),
        Text(
          title,
          textAlign: TextAlign.center,
          style: context.isDarkMode
              ? AppTextTheme.headingMediumBold
              : AppTextTheme.headingLightBold,
        ),
        SizedBox(height: title == AppStrings.signUp.tr() ? 8.h : 5.h),
        appRichText(
          text1: supportText1,
          text2: supportText2,
          context: context,
        ),
      ],
    );
  }
}
