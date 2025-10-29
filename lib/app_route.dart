
import 'package:five_line_task/features/welcome/presentation/screens/chooose_mode_screen.dart';
import 'package:five_line_task/features/welcome/presentation/screens/get_started_screen.dart';
import 'package:five_line_task/features/welcome/presentation/screens/splash_screen.dart';

class AppRoutes {
  static const String splash = '/splash';
  static const String getStarted = '/getStarted ';
  static const String chooseMode = '/chooseMode';
  static const String chooseSignMethodScreen = '/ChooseSignMethodScreen';
  // static const String signIn = '/SignIn';
  //   static const String signUp = '/SignUp';
}

var routes = {
  AppRoutes.splash: (context) => const SplashScreen(),
  AppRoutes.getStarted: (context) => const GetStartedScreen(),
  AppRoutes.chooseMode: (context) => const ChoooseModeScreen(),
  // AppRoutes.chooseSignMethodScreen: (context) => const ChooseSignMethodScreen(),
  // AppRoutes.signIn: (context) => const SignInScreen(),
  //   AppRoutes.signUp: (context) => const SignUpScreen(),
};
