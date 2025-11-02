import 'package:dartz/dartz.dart';
import 'package:five_line_task/core/errors/failure.dart';
import 'package:five_line_task/features/auth/domain/entity/user.dart';
import 'package:five_line_task/features/auth/domain/repo/repo.dart';

class SignInWithEmailAndPasswordUseCase {
  final AuthRepo repo;

  SignInWithEmailAndPasswordUseCase(this.repo);

  Future<Either<Failure, UserEntity>> call({
    required String email,
    required String password,
  }) {
    return repo.signInWithEmailAndPassword(email: email, password: password);
  }
}
