import 'package:easy_localization/easy_localization.dart';
import 'package:five_line_task/app_route.dart';
import 'package:five_line_task/common/helpers.dart/is_dark_mode.dart';
import 'package:five_line_task/common/widgets/app_button.dart';
import 'package:five_line_task/common/widgets/app_rich_text.dart';
import 'package:five_line_task/common/widgets/app_text_form_field.dart';
import 'package:five_line_task/common/widgets/loading.dart';
import 'package:five_line_task/core/constants/app_strings.dart';
import 'package:five_line_task/core/constants/theme/app_colors.dart';
import 'package:five_line_task/core/constants/theme/app_text.dart';
import 'package:five_line_task/features/auth/presentation/bloc/bloc.dart';
import 'package:five_line_task/features/auth/presentation/bloc/states.dart';

import 'package:five_line_task/features/auth/presentation/widgets/forget_password_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocConsumer, ReadContext;
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPasswordBody extends StatelessWidget {
  const ForgetPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Padding(
      padding: EdgeInsets.all(22.0.w),
      child: Column(
        children: [
          SizedBox(height: 30.h, width: double.infinity),
          Text(
            AppStrings.signIn.tr(),
            textAlign: TextAlign.center,
            style: context.isDarkMode
                ? AppTextTheme.headingMediumBold
                : AppTextTheme.headingLightBold,
          ),
          SizedBox(height: 5.h),
          appRichText(
            text1: AppStrings.support1.tr(),
            text2: AppStrings.support2.tr(),
            context: context,
          ),
          SizedBox(height: 30.h),
          MyTaskTextFields(
            controller: emailController,
            hintText: AppStrings.typeEmail.tr(),
          ),
          SizedBox(height: 15.h),
          MyTaskTextFields(
            controller: passwordController,
            hintText: AppStrings.typePassword.tr(),
          ),
          SizedBox(height: 18.h),
          forgetPasswordText(
            context,
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.forgetPassword);
            },
          ),
          SizedBox(height: 15.h),
          BlocConsumer<AuthCubit, AuthState>(
            listener: (BuildContext context, AuthState state) {
              // Handle state changes here
              if (state is SigninSuccess) {
                Navigator.pushReplacementNamed(context, AppRoutes.tasksPage);
              } else if (state is SigninFailure) {}
            },
            builder: (BuildContext context, AuthState state) {
              return AppButton(
                title: state is SigninLoading
                    ? loading()
                    : AppStrings.signUp.tr(),
                onPressed: state is SigninLoading
                    ? null
                    : () {
                        context.read<AuthCubit>().signInWithEmailAndPassword(
                          emailController.text,
                          passwordController.text,
                        );
                      },
                // textColor: AppColors.lightBackground,
              );
            },
          ),

          SizedBox(height: 37.h),
          MaterialButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, AppRoutes.signUp);
            },
            child: appRichText(
              text1: AppStrings.register1.tr(),
              text2: AppStrings.register2.tr(),
              context: context,
            ),
          ),
        ],
      ),
    );
  }
}
