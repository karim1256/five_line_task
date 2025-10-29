import 'package:easy_localization/easy_localization.dart';
import 'package:five_line_task/app_route.dart';
import 'package:five_line_task/common/helpers.dart/is_dark_mode.dart';
import 'package:five_line_task/common/widgets/app_button.dart';
import 'package:five_line_task/common/widgets/logo.dart';
import 'package:five_line_task/core/constants/app_strings.dart';
import 'package:five_line_task/core/constants/assets_path/app_images.dart';
import 'package:five_line_task/core/constants/theme/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 160.h,
            left: 20.w,
            child: Image.asset(AppImages.getStartedBG, width: 0.8.sw),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 27.w, vertical: 40.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: double.infinity, height: 20.h),
                logo(),
                Spacer(),
                Text(
                  AppStrings.enjoyListening.tr(),
                  textAlign: TextAlign.center,
                  style: context.isDarkMode
                      ? AppTextTheme.headingMediumBold
                      : AppTextTheme.headingLightBold,
                ),
                SizedBox(height: 12.h),
                Text(
                  AppStrings.loremIpsum,
                  textAlign: TextAlign.center,
                  style: context.isDarkMode
                      ? AppTextTheme.bodySmallGrey
                      : AppTextTheme.bodySmallLight,
                  maxLines: 3,
                ).tr(),
                SizedBox(height: 25.h),
                AppButton(
                  title: AppStrings.getStarted.tr(),
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                      context,
                      AppRoutes.chooseMode,
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
