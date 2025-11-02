import 'package:five_line_task/common/helpers.dart/is_dark_mode.dart';
import 'package:five_line_task/core/constants/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      
      padding: EdgeInsets.all(3.0.w),
      child: CircleAvatar(
        
        radius: 26.w,
        backgroundColor: AppColors.lightGreyButtonBG,
        child: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: context.isDarkMode?
             AppColors.darkBackground: AppColors.lightBackground
            ,
            size: 22.w,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
