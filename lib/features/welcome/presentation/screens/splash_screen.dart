import 'package:five_line_task/app_route.dart';
import 'package:five_line_task/common/widgets/logo.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  void _navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 2));

    Navigator.pushReplacementNamed(context, AppRoutes.getStarted);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: spotifyLogo()));
  }
}
