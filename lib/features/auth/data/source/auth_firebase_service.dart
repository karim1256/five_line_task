import 'package:firebase_auth/firebase_auth.dart';
import 'package:five_line_task/core/errors/exception.dart';

abstract class AuthFirebaseService {
    Future<User?> createUserWithEmailAndPassword({
    required String email,
    required String password,
  });
    Future<User?> signInWithEmailAndPassword({
    required String email,
    required String password,
  });
}





class FirebaseAuthService extends AuthFirebaseService{
  Future<User?> createUserWithEmailAndPassword
  ({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      FirebaseAuth.instance.currentUser?.sendEmailVerification();
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw CustomException(message: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(
          message: 'The account already exists for that email.',
        );
      } else {
        throw CustomException(message: e.message ?? "Firebase Auth Exception");
      }
    } catch (e) {
      CustomException(message: "unkown error");
    }
    return null;
  }

 Future<User?> signInWithEmailAndPassword
 ({
    required String email,
    required String password,
  }) async {
    try {
  final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: email,
    password: password
  );
        return credential.user!;
} on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
    throw CustomException(message:'No user found for that email.');
  } else if (e.code == 'wrong-password') {
    throw CustomException(message:'Wrong password provided for that user.');
  } else{

  throw CustomException(message:e.message ?? "Firebase Auth Exception");



  }
}
  }





}
