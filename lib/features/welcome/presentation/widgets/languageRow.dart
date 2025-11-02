import 'package:easy_localization/easy_localization.dart';
import 'package:five_line_task/core/constants/app_strings.dart';
import 'package:five_line_task/core/constants/assets_path/app_images.dart';
import 'package:five_line_task/features/welcome/presentation/widgets/mood_vector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class LanguageRow extends StatelessWidget {
  const LanguageRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MoodVector(
          onTap: () {
            context.setLocale(const Locale("ar"));
          },
          title: AppStrings.arabic,
          imageName: AppImages.arabic,
        ),
        SizedBox(width: 35.w),
        MoodVector(
          onTap: () {
            context.setLocale(const Locale("en"));
          },
          title: AppStrings.english,
          imageName: AppImages.english,
        ),
      ],
    );
  }
}