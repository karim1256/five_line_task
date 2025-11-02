import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthFormFields extends StatelessWidget {
  final List<Widget> children;

  const AuthFormFields({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: children
          .expand((widget) => [widget, SizedBox(height: 10.h)])
          .toList()
        ..removeLast(), // Remove last SizedBox
    );
  }
}