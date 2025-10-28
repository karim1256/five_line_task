import 'package:five_line_task/app_route.dart';
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
          Image.asset(
            AppImages.getStartedBG,
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
                  AppStrings.enjoyListening,
                  textAlign: TextAlign.center,
                  style: AppTextTheme.headingMediumBold,
                ),
                SizedBox(height: 21.h),
                Text(
                  AppStrings.loremIpsum,
                  textAlign: TextAlign.center,
                  style: AppTextTheme.bodySmallGrey,
                  maxLines: 3,
                ),
                SizedBox(height: 25.h),
                AppButton(
                  title: AppStrings.getStarted,
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
