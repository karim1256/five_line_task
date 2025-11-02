import 'package:easy_localization/easy_localization.dart';
import 'package:five_line_task/app_route.dart';
import 'package:five_line_task/common/helpers.dart/is_dark_mode.dart';
import 'package:five_line_task/common/widgets/app_button.dart';
import 'package:five_line_task/common/widgets/logo.dart';
import 'package:five_line_task/core/constants/app_strings.dart';
import 'package:five_line_task/core/constants/assets_path/app_images.dart';
import 'package:five_line_task/core/constants/assets_path/app_vectors.dart';
import 'package:five_line_task/core/constants/theme/app_text.dart';
import 'package:five_line_task/features/welcome/presentation/cubit/theme_cubit/theme_cubit.dart';
import 'package:five_line_task/features/welcome/presentation/widgets/mood_vector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChoooseModeScreen extends StatelessWidget {
  const ChoooseModeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 160.h,
            left: 50.w,
            child: Image.asset(
              AppImages.chooseModeBg,
              fit: BoxFit.cover,
              width: 0.7.sw,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 27.w, vertical: 40.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: double.infinity, height: 20.h),
                logo(),
                const Spacer(),
                Text(
                  AppStrings.chooseMode.tr(),
                  textAlign: TextAlign.center,
                  style: context.isDarkMode
                      ? AppTextTheme.headingMediumBold
                      : AppTextTheme.headingLightBold,
                ),
                SizedBox(height: 15.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MoodVector(
                      onTap: () {
                        context.read<ThemeCubit>().updateTheme(ThemeMode.light);
                      },
                      title: AppStrings.lightMood.tr(),
                      vectorName: AppVectors.sun,
                    ),
                    SizedBox(width: 20.w),
                    MoodVector(
                      onTap: () {
                        context.read<ThemeCubit>().updateTheme(ThemeMode.dark);
                      },
                      title: AppStrings.darkMood.tr(),
                      vectorName: AppVectors.moon,
                    ),
                  ],
                ),
                SizedBox(height: 25.h),
                AppButton(
                  title: AppStrings.getStarted.tr(),
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.signIn);
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
