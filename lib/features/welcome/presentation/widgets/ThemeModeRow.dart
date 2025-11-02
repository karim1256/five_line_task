import 'package:easy_localization/easy_localization.dart';
import 'package:five_line_task/core/constants/app_strings.dart';
import 'package:five_line_task/core/constants/assets_path/app_images.dart';
import 'package:five_line_task/core/constants/assets_path/app_vectors.dart';
import 'package:five_line_task/features/welcome/presentation/cubit/theme_cubit/theme_cubit.dart';
import 'package:five_line_task/features/welcome/presentation/widgets/mood_vector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ThemeModeRow extends StatelessWidget {
  const ThemeModeRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MoodVector(
          onTap: () {
            context.read<ThemeCubit>().updateTheme(ThemeMode.light);
          },
          title: AppStrings.lightMood.tr(),
          vectorName: AppVectors.sun,
        ),
        SizedBox(width: 20.w),
        MoodVector(
          onTap: () {
            context.read<ThemeCubit>().updateTheme(ThemeMode.dark);
          },
          title: AppStrings.darkMood.tr(),
          vectorName: AppVectors.moon,
        ),
      ],
    );
  }
}

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
          title: AppStrings.arabic.tr(),
          imageName: AppImages.arabic,
        ),
        SizedBox(width: 20.w),
        MoodVector(
          onTap: () {
            context.setLocale(const Locale("en"));
          },
          title: AppStrings.english.tr(),
          imageName: AppImages.english,
        ),
      ],
    );
  }
}