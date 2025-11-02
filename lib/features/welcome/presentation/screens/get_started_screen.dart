import 'package:easy_localization/easy_localization.dart';
import 'package:five_line_task/app_route.dart';
import 'package:five_line_task/common/helpers.dart/is_dark_mode.dart';
import 'package:five_line_task/common/widgets/app_button.dart';
import 'package:five_line_task/common/widgets/logo.dart';
import 'package:five_line_task/core/constants/app_strings.dart';
import 'package:five_line_task/core/constants/assets_path/app_images.dart';
import 'package:five_line_task/core/constants/theme/app_text.dart';
import 'package:five_line_task/features/welcome/presentation/widgets/mood_vector.dart';
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
            top: 120.h,
            left: 40.w,
            child: Image.asset(AppImages.getStartedBG, width: 0.5.sw),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 27.w, vertical: 40.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: double.infinity, height: 10.h),
                logo(),
                const Spacer(),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MoodVector(
                      onTap: () {
                        context.setLocale(const Locale("ar"));
                      },
                      title: AppStrings.arabic.tr(),
                      imageName: AppImages.arabic,
                    ),
                    SizedBox(width: 20.w),
                    MoodVector(
                      onTap: () {
                        context.setLocale(const Locale("en"));
                      },
                      title: AppStrings.english.tr(),
                      imageName: AppImages.english,
                    ),
                  ],
                ),
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
