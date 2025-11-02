import 'package:easy_localization/easy_localization.dart';
import 'package:five_line_task/app_route.dart';
import 'package:five_line_task/core/constants/app_strings.dart';
import 'package:five_line_task/features/auth/presentation/bloc/bloc.dart';
import 'package:five_line_task/features/auth/presentation/bloc/states.dart';
import 'package:five_line_task/features/auth/presentation/widgets/authActionButton%20.dart';
import 'package:five_line_task/features/auth/presentation/widgets/authFormFields.dart';
import 'package:five_line_task/features/auth/presentation/widgets/authHeader.dart';
import 'package:five_line_task/features/auth/presentation/widgets/authNavigationText.dart';
import 'package:five_line_task/features/auth/presentation/widgets/emailField.dart';
import 'package:five_line_task/features/auth/presentation/widgets/forget_password_text.dart';
import 'package:five_line_task/features/auth/presentation/widgets/passwordField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInBody extends StatelessWidget {
  const SignInBody({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Padding(
      padding: EdgeInsets.all(22.0.w),
      child: Column(
        children: [
          AuthHeader(
            title: AppStrings.signIn.tr(),
            supportText1: AppStrings.support1.tr(),
            supportText2: AppStrings.support2.tr(),
          ),
          SizedBox(height: 30.h),
          AuthFormFields(
            children: [
              EmailField(controller: emailController),
              PasswordField(controller: passwordController),
            ],
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
            listener: (context, state) {
              if (state is SigninSuccess) {
                Navigator.pushReplacementNamed(context, AppRoutes.tasksPage);
              }
            },
            builder: (context, state) {
              return AuthActionButton(
                buttonText: AppStrings.signIn.tr(),
                onPressed: () {
                  context.read<AuthCubit>().signInWithEmailAndPassword(
                        emailController.text,
                        passwordController.text,
                      );
                },
                isLoading: state is SigninLoading,
              );
            },
          ),
          SizedBox(height: 37.h),
          AuthNavigationText(
            questionText: AppStrings.register1.tr(),
            actionText: AppStrings.register2.tr(),
            onPressed: () {
              Navigator.pushReplacementNamed(context, AppRoutes.signUp);
            },
          ),
        ],
      ),
    );
  }
}