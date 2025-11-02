
import 'package:five_line_task/common/widgets/app_rich_text.dart';
import 'package:flutter/material.dart';
class AuthNavigationText extends StatelessWidget {
  final String questionText;
  final String actionText;
  final VoidCallback onPressed;

  const AuthNavigationText({
    super.key,
    required this.questionText,
    required this.actionText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: appRichText(
        text1: questionText,
        text2: actionText,
        context: context,
      ),
    );
  }
}