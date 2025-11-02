import 'package:easy_localization/easy_localization.dart';
import 'package:five_line_task/common/helpers.dart/is_dark_mode.dart';
import 'package:five_line_task/common/widgets/app_button.dart';
import 'package:five_line_task/common/widgets/app_text_form_field.dart';
import 'package:five_line_task/common/widgets/loading.dart';
import 'package:five_line_task/core/constants/app_strings.dart';
import 'package:five_line_task/core/constants/theme/app_text.dart';
import 'package:five_line_task/features/auth/presentation/bloc/bloc.dart';
import 'package:five_line_task/features/auth/presentation/bloc/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPasswordBody extends StatelessWidget {
  const ForgetPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();

    return Padding(
      padding: EdgeInsets.all(22.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 50.h),
          Text(
            AppStrings.forgetPassword.tr(),
            style: context.isDarkMode
                ? AppTextTheme.headingMediumBold
                : AppTextTheme.headingLightBold,
          ),
          SizedBox(height: 10.h),
          Text(
            AppStrings.forgetPasswordDescription.tr(),
            style: context.isDarkMode
                ? AppTextTheme.bodySmallGrey
                : AppTextTheme.bodySmallLight,
          ),
          SizedBox(height: 30.h),
          Text(
          AppStrings.typeEmail.tr(),
            style: context.isDarkMode
                      ? AppTextTheme.headingMediumBold
                      : AppTextTheme.headingLightBold,
          ),
          SizedBox(height: 8.h),
          MyTaskTextFields(
            controller: emailController,
            hintText: AppStrings.typeEmail.tr(),
          ),
          SizedBox(height: 30.h),
          BlocConsumer<AuthCubit, AuthState>(
            listener: (BuildContext context, AuthState state) {
              if (state is ForgetPasswordSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message),
                    backgroundColor: Colors.green,
                  ),
                );
                // Optionally navigate back after success
                Future.delayed(const Duration(seconds: 2), () {
                  Navigator.pop(context);
                });
              } else if (state is ForgetPasswordFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            builder: (BuildContext context, AuthState state) {
              return AppButton(
                title: state is ForgetPasswordLoading
                    ? loading()
                    : AppStrings.sendResetLink.tr(),
                onPressed: state is ForgetPasswordLoading
                    ? null
                    : () {
                        if (emailController.text.isNotEmpty) {
                          context.read<AuthCubit>().sendPasswordResetEmail(
                            emailController.text,
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(AppStrings.pleaseEnterEmail.tr()),
                              backgroundColor: Colors.orange,
                            ),
                          );
                        }
                      },
              );
            },
          ),
          // SizedBox(height: 20.h),
          // if (state is ForgetPasswordSuccess)
          //   Text(
          //     AppStrings.checkYourEmail.tr(),
          //     style: const TextStyle(color: Colors.green),
          //   ),
        ],
      ),
    );
  }
}