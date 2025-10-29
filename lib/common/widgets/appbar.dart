import 'package:five_line_task/common/widgets/back_button.dart';
import 'package:five_line_task/common/widgets/logo.dart';
import 'package:flutter/material.dart';

class SpotifyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final Widget leading;
  final List<Widget>? actions;

  SpotifyAppBar({
    Key? key,
    this.title,
    this.leading = const AppBackButton(),
    this.actions,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // Changed from SpotifyAppBar to AppBar
      leading: leading,
      title: title ?? logo(width: 0.32),
      actions: actions,
      centerTitle: true,
      // Add any additional AppBar properties you need
      // Remove shadow
    );
  }
}
