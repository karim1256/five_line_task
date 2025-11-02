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
import 'package:five_line_task/features/auth/presentation/widgets/nameField.dart';
import 'package:five_line_task/features/auth/presentation/widgets/passwordField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Padding(
      padding: EdgeInsets.all(22.0.w),
      child: Column(
        children: [
          AuthHeader(
            title: AppStrings.signUp.tr(),
            supportText1: AppStrings.support1.tr(),
            supportText2: AppStrings.support2.tr(),
          ),
          SizedBox(height: 30.h),
          AuthFormFields(
            children: [
              NameField(controller: nameController),
              EmailField(controller: emailController),
              PasswordField(controller: passwordController),
            ],
          ),
          SizedBox(height: 15.h),
          BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is SignupSuccess) {
                Navigator.pushReplacementNamed(context, AppRoutes.tasksPage);
              }
            },
            builder: (context, state) {
              return AuthActionButton(
                buttonText: AppStrings.signUp.tr(),
                onPressed: () {
                  context.read<AuthCubit>().createUserWithEmailAndPassword(
                        emailController.text,
                        passwordController.text,
                        nameController.text,
                      );
                },
                isLoading: state is SignupLoading,
              );
            },
          ),
          SizedBox(height: 40.h),
          AuthNavigationText(
            questionText: AppStrings.signInQuetion.tr(),
            actionText: AppStrings.signIn.tr(),
            onPressed: () {
              Navigator.pushReplacementNamed(context, AppRoutes.signIn);
            },
          ),
        ],
      ),
    );
  }
}