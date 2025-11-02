
import 'package:five_line_task/common/widgets/app_button.dart';
import 'package:five_line_task/common/widgets/loading.dart';
import 'package:flutter/material.dart';
class AuthActionButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final bool isLoading;
  final bool isEnabled;

  const AuthActionButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
    required this.isLoading,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppButton(
      title: isLoading ? loading() : buttonText,
      onPressed: isLoading || !isEnabled ? null : onPressed,
    );
  }
}
