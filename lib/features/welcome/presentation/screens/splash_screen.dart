import 'package:firebase_auth/firebase_auth.dart';
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
    navigateToNextScreen();
  }

  void navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 3));

    Navigator.pushReplacementNamed(
      context,
      isUserLoggedIn() ? AppRoutes.tasksPage : AppRoutes.getStarted,
    );
  }

  bool isUserLoggedIn() {
    final user = FirebaseAuth.instance.currentUser;
    return user != null;
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: logo(),
      ),
    );
  }
}