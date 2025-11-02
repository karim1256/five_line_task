import 'package:easy_localization/easy_localization.dart';
import 'package:five_line_task/core/constants/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyTaskTextFields extends StatefulWidget {
  final TextEditingController? controller;
  final String hintText;
  final TextInputType keyboardType;
  final bool isPassword;
  
  const MyTaskTextFields({
    super.key,
     this.controller,
    this.hintText = 'Enter Username Or Email',
    this.keyboardType = TextInputType.emailAddress,
    this.isPassword = false,
  });

  @override
  State<MyTaskTextFields> createState() => _MyTaskTextFieldsState();
}

class _MyTaskTextFieldsState extends State<MyTaskTextFields> {
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 0.9.sw,
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.isPassword && !isPasswordVisible,
        decoration: InputDecoration(
          hintText: widget.hintText.tr(),
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
          // Add suffix icon for password field
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(
                    isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    color: AppColors.textForm,
                  ),
                  onPressed: () {
                    setState(() {
                      isPasswordVisible = !isPasswordVisible;
                    });
                  },
                )
              : null,
        ),
        keyboardType: widget.keyboardType,
      ),
    );
  }
}