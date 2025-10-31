import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthFirebaseService {
    Future<void> signup();
    Future<void> signin();
}


class AuthFirebaseServiceImpl extends AuthFirebaseService {

    @override
    Future<void> signin() {
        // TODO: implement signin    TODO: implement signin
        throw UnimplementedError();
    }

    @override
    Future<void> signup() async {
        try {
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
                email: '',    // Error: Undefined name 'email'
                password: ''    // Error: Undefined name 'password'
            );
        }
        on FirebaseAuthException catch(e) {    // Warning: The exception variable 'e' isn't used
            // Missing implementation
        }
    }
}