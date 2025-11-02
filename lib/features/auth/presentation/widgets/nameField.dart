
import 'package:easy_localization/easy_localization.dart';
import 'package:five_line_task/common/widgets/app_text_form_field.dart';
import 'package:five_line_task/core/constants/app_strings.dart';
import 'package:flutter/material.dart';
class NameField extends StatelessWidget {
  final TextEditingController controller;

  const NameField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return MyTaskTextFields(
      controller: controller,
      hintText: AppStrings.typeName.tr(),
    );
  }
}