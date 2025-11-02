import 'package:five_line_task/common/helpers.dart/is_dark_mode.dart';
import 'package:five_line_task/common/widgets/logo.dart';
import 'package:five_line_task/core/constants/theme/app_colors.dart';
import 'package:flutter/material.dart';

class MyTaskAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final Widget? leading;
    final bool implyLeading;

   
  MyTaskAppBar({Key? key, this.title, this.leading,this.implyLeading=false}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: AppBar(
          backgroundColor: context.isDarkMode
              ? AppColors.darkBackground
              : AppColors.lightBackground,
          leading: leading,
          automaticallyImplyLeading: implyLeading,
          title: title ?? logo(width: 0.13),

          centerTitle: true,
        ),
      ),
    );
  }
}
