import 'package:dartz/dartz.dart';
import 'package:five_line_task/core/errors/exception.dart';
import 'package:five_line_task/core/errors/failure.dart';
import 'package:five_line_task/core/servicee/firebase_auth_service.dart';
import 'package:five_line_task/features/auth/data/model/create_user.dart';
import 'package:five_line_task/features/auth/domain/entity/user.dart';
import 'package:five_line_task/features/auth/domain/repo/repo.dart';

class AuthRepoImpl implements AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  AuthRepoImpl({required this.firebaseAuthService});
  @override
Future<Either<AuthFailure, UserEntity>> createUserWithEmailAndPassword({
    required String email, required String password, required String name}) async {
  try {
    var user = await firebaseAuthService.createUserWithEmailAndPassword(
      email: email, 
      password: password
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
  Future<Either<AuthFailure, UserEntity>> signInWithEmailAndPassword({
    required String email, required String password}) async {
  try {
    var user = await firebaseAuthService.signInWithEmailAndPassword(
      email: email, 
      password: password
    );
    return right(UserModel.fromFirebaseUser(user!));
  } on CustomException catch (e) {
    print("------------------repo catch ${e.message}---------------------");
    return left(ServerFailure(e.message));
  } catch (e) {
        print("------------------repo catch ${e.toString()}---------------------");

    return left(ServerFailure(e.toString()));
  }
}




}
