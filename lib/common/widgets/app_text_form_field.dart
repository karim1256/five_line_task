import 'package:five_line_task/core/constants/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpotifyTextFields extends StatefulWidget {
  const SpotifyTextFields({super.key});

  @override
  State<SpotifyTextFields> createState() => _SpotifyTextFieldsState();
}

class _SpotifyTextFieldsState extends State<SpotifyTextFields> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 0.9.sw,
      child: TextFormField(
        controller: usernameController,
        decoration: InputDecoration(
          hintText: 'Enter Username Or Email',
          hintStyle: TextStyle(color: AppColors.textForm),
          filled: true,
          fillColor: AppColors.lightBackground,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 28,
            horizontal: 20,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(26),
            borderSide: BorderSide(color: AppColors.textForm, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(26),
            borderSide: BorderSide(color: AppColors.textForm, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(26),
            borderSide: BorderSide(color: AppColors.textForm, width: 1),
          ),
        ),
        keyboardType: TextInputType.emailAddress,
      ),
    );
  }
}
