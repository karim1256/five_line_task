
import 'package:dartz/dartz.dart';
import 'package:five_line_task/core/errors/failure.dart';
import 'package:five_line_task/features/auth/domain/entity/user.dart';

abstract class AuthRepo {

      // Future<Either<AuthFailure, Unit>> sendEmailVerification();
      //   Future<Either<AuthFailure, Unit>> sendPasswordResetEmail(String email);
          Future<Either<AuthFailure,UserEntity>> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  });
  
  Future<Either<AuthFailure, UserEntity>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });



}