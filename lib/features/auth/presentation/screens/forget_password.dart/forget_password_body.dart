import 'package:five_line_task/app_route.dart';
import 'package:five_line_task/common/widgets/app_button.dart';
import 'package:five_line_task/common/widgets/app_rich_text.dart';
import 'package:five_line_task/common/widgets/app_text_form_field.dart';
import 'package:five_line_task/common/widgets/loading.dart';
import 'package:five_line_task/core/constants/app_strings.dart';
import 'package:five_line_task/core/constants/theme/app_text.dart';
import 'package:five_line_task/features/auth/presentation/bloc/bloc.dart';
import 'package:five_line_task/features/auth/presentation/bloc/states.dart';
import 'package:five_line_task/features/auth/presentation/widgets/auth_methods.dart';
import 'package:five_line_task/features/auth/presentation/widgets/auth_separator.dart';
import 'package:five_line_task/features/auth/presentation/widgets/forget_password_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocConsumer, ReadContext;
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInBody extends StatelessWidget {
  const SignInBody({super.key});

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
            AppStrings.signIn,
            textAlign: TextAlign.center,
            style: AppTextTheme.headingLightBold,
          ),
          SizedBox(height: 5.h),
          appRichText(text1: AppStrings.support1, text2: AppStrings.support2),
          SizedBox(height: 30.h),
          MyTaskTextFields(controller: emailController,),
          SizedBox(height: 15.h),
          MyTaskTextFields(controller: passwordController,),
          SizedBox(height: 18.h),
          forgetPasswordText(),
          SizedBox(height: 15.h),
          BlocConsumer<AuthCubit, AuthState>(
            listener: (BuildContext context, AuthState state) {
              // Handle state changes here
              if (state is SigninSuccess) {
                // Navigate to home or show success
              } else if (state is SigninFailure) {}
            },
            builder: (BuildContext context, AuthState state) {
              return AppButton(
                title: state is SigninLoading ? loading() : AppStrings.signUp,
                onPressed: state is SigninLoading
                    ? null
                    : () {
                        context.read<AuthCubit>().signInWithEmailAndPassword(
                          emailController.text,
                          passwordController.text
                        );
                      },
              );
            },
          ),
          SizedBox(height: 18.h),
        
        ],
      ),
    );
  }
}
