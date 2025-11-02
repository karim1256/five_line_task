import 'package:dartz/dartz.dart';
import 'package:five_line_task/core/errors/failure.dart';
import 'package:five_line_task/features/auth/domain/repo/repo.dart';

class SendPasswordResetEmailUseCase {
  final AuthRepo repo;

  SendPasswordResetEmailUseCase(this.repo);

  Future<Either<Failure, Unit>> call({
    required String email,
  }) {
    return repo.sendPasswordResetEmail(email: email);
  }
}