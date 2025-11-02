import 'package:dartz/dartz.dart';
import 'package:five_line_task/core/errors/exception.dart';
import 'package:five_line_task/core/errors/failure.dart';
import 'package:five_line_task/features/auth/data/model/create_user.dart';
import 'package:five_line_task/features/auth/data/source/auth_firebase_service.dart';
import 'package:five_line_task/features/auth/domain/entity/user.dart';
import 'package:five_line_task/features/auth/domain/repo/repo.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthFirebaseService firebaseAuthService;
  AuthRepoImpl({required this.firebaseAuthService});
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      var user = await firebaseAuthService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await user?.sendEmailVerification();
      return right(UserModel.fromFirebaseUser(user!));
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      var user = await firebaseAuthService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(UserModel.fromFirebaseUser(user!));
    } on CustomException catch (e) {
      print("------------------repo catch ${e.message}---------------------");
      return left(ServerFailure(e.message));
    } catch (e) {
      print(
        "------------------repo catch ${e.toString()}---------------------",
      );

      return left(ServerFailure(e.toString()));
    }
  }

   Future<Either<Failure, Unit>> sendPasswordResetEmail({
    required String email,
  }) async {
    try {
      await firebaseAuthService.sendPasswordResetEmail(email: email);
      return right(unit);
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
