import 'package:five_line_task/common/helpers.dart/get_it.dart';
import 'package:five_line_task/common/widgets/appbar.dart';
import 'package:five_line_task/features/auth/domain/repo/repo.dart';
import 'package:five_line_task/features/auth/presentation/bloc/bloc.dart';
import 'package:five_line_task/features/auth/presentation/screens/sign_in_screen/sign_in_body.dart';
import 'package:flutter/material.dart' hide BackButton;
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(getIt<AuthRepo>()),
      child: Scaffold(appBar: MyTaskAppBar(), body: ForgetPasswordBody()),
    );
  }
}
