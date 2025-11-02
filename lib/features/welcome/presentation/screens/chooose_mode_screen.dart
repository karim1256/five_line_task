import 'package:easy_localization/easy_localization.dart';
import 'package:five_line_task/app_route.dart';
import 'package:five_line_task/common/helpers.dart/is_dark_mode.dart';
import 'package:five_line_task/common/widgets/app_button.dart';
import 'package:five_line_task/common/widgets/logo.dart';
import 'package:five_line_task/core/constants/app_strings.dart';
import 'package:five_line_task/core/constants/assets_path/app_images.dart';
import 'package:five_line_task/core/constants/theme/app_text.dart';
import 'package:five_line_task/features/welcome/presentation/widgets/ThemeModeRow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChoooseModeScreen extends StatelessWidget {
  const ChoooseModeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 27.w, vertical: 40.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: double.infinity, height: 20.h),
            logo(width: 0.12),
            const Spacer(),

            Image.asset(
              AppImages.chooseModeBg,
              fit: BoxFit.cover,
              width: 0.6.sw,
            ),
            Text(
              AppStrings.chooseMode.tr(),
              textAlign: TextAlign.center,
              style: context.isDarkMode
                  ? AppTextTheme.headingMediumBold
                  : AppTextTheme.headingLightBold,
            ),
            SizedBox(height: 15.h),
            const ThemeModeRow(),
            const Spacer(),
            AppButton(
              title: AppStrings.getStarted.tr(),
              onPressed: () {
                Navigator.pushReplacementNamed(context, AppRoutes.signIn);
              },
            ),
          ],
        ),
      ),
    );
  }
}
