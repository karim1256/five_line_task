import 'package:five_line_task/common/helpers.dart/get_it.dart';
import 'package:five_line_task/common/widgets/appbar.dart';
import 'package:five_line_task/features/auth/domain/repo/repo.dart';
import 'package:five_line_task/features/auth/presentation/bloc/bloc.dart';
import 'package:five_line_task/features/auth/presentation/screens/forget_password.dart/forget_password_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(getIt<AuthRepo>()),
      child: Scaffold(
        appBar: MyTaskAppBar(),
        body: const ForgetPasswordBody(),
      ),
    );
  }
}