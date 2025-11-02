import 'dart:ui';

import 'package:five_line_task/common/helpers.dart/is_dark_mode.dart';
import 'package:five_line_task/core/constants/theme/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:svg_flutter/svg.dart';

class MoodVector extends StatelessWidget {
  final String? vectorName;
  final String? imageName;
  final String title;
  final VoidCallback? onTap;

  const MoodVector({
    super.key,
    this.vectorName,
    this.imageName,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: ClipOval(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  color: const Color(0xff30393C).withOpacity(0.7),
                  shape: BoxShape.circle,
                ),
                child: vectorName == null
                    ? Image.asset(
                        imageName!,
                        fit: BoxFit.contain,
                        width: 10,
                      )
                    : SvgPicture.asset(
                        vectorName!,
                        fit: BoxFit.none,
                      ),
              ),
            ),
          ),
        ),
        SizedBox(height: 10.h),
        Text(
          title,
          textAlign: TextAlign.center,
          style: context.isDarkMode
              ? AppTextTheme.headingMediumBold
              : AppTextTheme.headingLightBold,
        ),
      ],
    );
  }
}