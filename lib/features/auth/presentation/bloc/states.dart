
import 'package:five_line_task/features/auth/domain/entity/user.dart';

sealed class AuthState {}

final class SignupInitial extends AuthState {}

final class SignupLoading extends AuthState {}

final class SignupSuccess extends AuthState {
  final UserEntity userEntity;

  SignupSuccess({required this.userEntity});
}

final class SignupFailure extends AuthState {
  final String message;
  SignupFailure({required this.message});
}





final class SigninInitial extends AuthState {}

final class  SigninLoading extends AuthState {}

final class  SigninSuccess extends AuthState {
  final UserEntity userEntity;

   SigninSuccess({required this.userEntity});
}

final class  SigninFailure extends AuthState {
  final String message;
   SigninFailure({required this.message});
}


final class ForgetPasswordInitial extends AuthState {}

final class ForgetPasswordLoading extends AuthState {}

final class ForgetPasswordSuccess extends AuthState {
  final String message;
  ForgetPasswordSuccess({required this.message});
}

final class ForgetPasswordFailure extends AuthState {
  final String message;
  ForgetPasswordFailure({required this.message});
}