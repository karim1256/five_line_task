import 'package:five_line_task/app_route.dart';
import 'package:five_line_task/common/widgets/app_button.dart';
import 'package:five_line_task/common/widgets/back_button.dart';
import 'package:five_line_task/common/widgets/logo.dart';
import 'package:five_line_task/core/constants/app_strings.dart';
import 'package:five_line_task/core/constants/assets_path/app_images.dart';
import 'package:five_line_task/core/constants/theme/app_colors.dart';
import 'package:five_line_task/core/constants/theme/app_text.dart';
import 'package:flutter/material.dart' hide BackButton;
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ChooseSignMethodScreen extends StatelessWidget {
  const ChooseSignMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              child: Image.asset(AppImages.chooseSignMethoud),
            ),
            Column(
              children: [
                Align(alignment: Alignment.topLeft, child: AppBackButton()),
                SizedBox(height: 30.h),
                logo(),
                SizedBox(height: 75.h),

                Text(
                  AppStrings.enjoyListening,
                  textAlign: TextAlign.center,
                  style: AppTextTheme.headingLightBold,
                ),
                SizedBox(height: 10.h),
                SizedBox(
                  width: 0.8.sw,
                  child: Text(
                    AppStrings.chooseSignMethod,
                    textAlign: TextAlign.center,
                    style: AppTextTheme.bodySmallLight,
                    maxLines: 2,
                  ),
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppButton(
                      onPressed: () {},
                      title: "Regisier",
                      padding: EdgeInsets.symmetric(
                        horizontal: 40.w,
                      ), // More padding on left & right
                    ),

                    SizedBox(width: 10.w),

                    AppButton(
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.signIn);
                      },
                      title: "Sign In",
                      padding: EdgeInsets.symmetric(
                        horizontal: 45.w,
                      ), // More padding on left & right
                      backgroundColor: AppColors.lightBackground,
                      textColor: AppColors.lightTitle,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
