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
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    double spaceBetweenFields = 8.h;
    return Padding(
      padding: EdgeInsets.all(22.0.w),
      child: Column(
        children: [
          SizedBox(height: 20.h, width: double.infinity),
          Text(
            AppStrings.signUp,
            textAlign: TextAlign.center,
            style: AppTextTheme.headingLightBold,
          ),
          SizedBox(height: 8.h),
          appRichText(text1: AppStrings.support1, text2: AppStrings.support2),
      
          SizedBox(height: 30.h),
      
          MyTaskTextFields(controller: nameController),
          SizedBox(height: spaceBetweenFields),
      
          MyTaskTextFields(controller: emailController),
          SizedBox(height: spaceBetweenFields),
      
          MyTaskTextFields(controller: passwordController),
          SizedBox(height: 15.h),
      
         BlocConsumer<AuthCubit, AuthState>(
          listener: (BuildContext context, AuthState state) {
            // Handle state changes here
            if (state is SignupSuccess) {
              // Navigate to home or show success
            } else if (state is  SignupFailure) {
              // Show error message
              
            }
          },
          builder: (BuildContext context, AuthState state) {
            return AppButton(
              title:
                state is  SignupLoading ? loading() :
               AppStrings.signUp,
              onPressed: state is  SignupLoading 
                ? null 
                : () {
                    context.read<AuthCubit>().createUserWithEmailAndPassword(
                      emailController.text,
                      passwordController.text,
                      nameController.text,
                    );
                  },
            );
          }, 
        ),
          SizedBox(height: 18.h),
          AuthSeparator(),
          SizedBox(height: 25.h),
          AuthMethouds(),
          SizedBox(height: 45.h),
          appRichText(
            text1: AppStrings.signInQuetion,
            text2: AppStrings.signIn,
          ),
        ],
      ),
    );
  }
}
