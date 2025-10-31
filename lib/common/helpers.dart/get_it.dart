import 'package:five_line_task/features/auth/data/repo/repo.dart';
import 'package:five_line_task/features/auth/data/source/auth_firebase_service.dart';
import 'package:five_line_task/features/auth/domain/repo/repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<AuthFirebaseService>(FirebaseAuthService());
  getIt.registerSingleton<AuthRepo>(AuthRepoImpl(
    firebaseAuthService: getIt<AuthFirebaseService>(),
  ));
}