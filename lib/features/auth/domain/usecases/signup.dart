import 'package:dartz/dartz.dart';
import 'package:five_line_task/core/errors/failure.dart';
import 'package:five_line_task/features/auth/domain/entity/user.dart';
import 'package:five_line_task/features/auth/domain/repo/repo.dart';

class CreateUserWithEmailAndPasswordUseCase {
  final AuthRepo repo;

  CreateUserWithEmailAndPasswordUseCase(this.repo);

  Future<Either<Failure, UserEntity>> call({
    required String email,
    required String password,
    required String name,
  }) {
    return repo.createUserWithEmailAndPassword(
      email: email,
      password: password,
      name: name,
    );
  }
}
