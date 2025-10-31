import 'package:firebase_auth/firebase_auth.dart';
import 'package:five_line_task/features/auth/domain/entity/user.dart';

class UserModel extends UserEntity {
  UserModel({required super.name, required super.email, required super.userId});

  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      name: user.displayName ?? '',
      email: user.email ?? '',
      userId: user.uid,
    );
  }
}