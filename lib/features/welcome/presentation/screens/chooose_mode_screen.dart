import 'package:five_line_task/app_route.dart';
import 'package:five_line_task/common/widgets/app_button.dart';
import 'package:five_line_task/common/widgets/logo.dart';
import 'package:five_line_task/core/constants/app_strings.dart';
import 'package:five_line_task/core/constants/assets_path/app_images.dart';
import 'package:five_line_task/core/constants/assets_path/app_vectors.dart';
import 'package:five_line_task/core/constants/theme/app_text.dart';
import 'package:five_line_task/features/welcome/presentation/widgets/mood_vector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChoooseModeScreen extends StatelessWidget {
  const ChoooseModeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppImages.chooseModeBg,
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 27.w, vertical: 40.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: double.infinity, height: 20.h),
                spotifyLogo(),
                Spacer(),
                Text(
                  AppStrings.chooseMode,
                  textAlign: TextAlign.center,
                  style: AppTextTheme.headingMediumBold,
                ),
                SizedBox(height: 21.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MoodVector(
                      themeMode: ThemeMode.light,
                      title: AppStrings.lightMood,
                      vectorName: AppVectors.sun,
                    ),
                    SizedBox(width: 20.w),
                    MoodVector(
                      themeMode: ThemeMode.dark,

                      title: AppStrings.darkMood,
                      vectorName: AppVectors.moon,
                    ),
                  ],
                ),
                SizedBox(height: 25.h),
                AppButton(title: AppStrings.getStarted, onPressed: () {

                  Navigator.pushNamed(context, AppRoutes.chooseSignMethodScreen);
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
