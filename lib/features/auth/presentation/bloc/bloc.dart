import 'package:five_line_task/features/auth/domain/repo/repo.dart';
import 'package:five_line_task/features/auth/domain/usecases/signin.dart';
import 'package:five_line_task/features/auth/domain/usecases/signup.dart';
import 'package:five_line_task/features/auth/presentation/bloc/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(SignupInitial());

  final AuthRepo authRepo;

  Future<void> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    emit(SignupLoading());

    final result = await CreateUserWithEmailAndPasswordUseCase(
      authRepo,
    ).call(email: email, password: password, name: name);
    result.fold(
      (failure) {
        print("------------------fail---------------------");

        emit(SignupFailure(message: "error occured: ${failure.toString()}"));
      },
      (userEntity) {
        print("------------------success---------------------");
        emit(SignupSuccess(userEntity: userEntity));
      },
    );
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    emit(SigninLoading());
    final result = await SignInWithEmailAndPasswordUseCase(authRepo).call
    (
      email: email,
      password: password,
    );
    result.fold(
      (failure) {
        print(
          "------------------fail  ${failure.toString()}---------------------",
        );

        emit(SigninFailure(message: "error occured: ${failure.toString()}"));
      },
      (userEntity) {
        print("------------------success---------------------");
        emit(SigninSuccess(userEntity: userEntity));
      },
    );
  }
}
