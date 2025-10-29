import 'dart:ui';

import 'package:five_line_task/common/helpers.dart/is_dark_mode.dart';
import 'package:five_line_task/core/constants/theme/app_text.dart';
import 'package:five_line_task/features/welcome/presentation/cubit/theme_cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:svg_flutter/svg.dart';

class MoodVector extends StatelessWidget {
  String vectorName;
  String title;
  ThemeMode themeMode;

  MoodVector({
    required this.themeMode,
    required this.vectorName,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            context.read<ThemeCubit>().updateTheme(themeMode);
          },
          child: ClipOval(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  color: Color(0xff30393C).withOpacity(0.7),
                  shape: BoxShape.circle,
                ), // BoxDecoration
                child: SvgPicture.asset(
                  vectorName,
                  fit: BoxFit.none,
                ), // SvgPicture.asset
              ), // Container
            ), // BackdropFilter
          ),
        ),
        SizedBox(height: 10.h),
        Text(
          title,
          textAlign: TextAlign.center,
          style: 
          context.isDarkMode
                      ? AppTextTheme.headingMediumBold
                      : AppTextTheme.headingLightBold,
        ),
      ],
    ); // ClipOval;
  }
}
