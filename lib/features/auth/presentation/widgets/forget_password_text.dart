import 'package:easy_localization/easy_localization.dart';
import 'package:five_line_task/common/helpers.dart/is_dark_mode.dart';
import 'package:five_line_task/core/constants/app_strings.dart';
import 'package:five_line_task/core/constants/theme/app_text.dart';
import 'package:flutter/material.dart';

Widget forgetPasswordText(BuildContext context, {VoidCallback? onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Align(
      alignment: Alignment.topLeft,
      child: Text(
        AppStrings.forgetPassword.tr(),
        style: context.isDarkMode
            ? AppTextTheme.bodySmallGrey
            : AppTextTheme.bodySmallLight,
      ),
    ),
  );
}