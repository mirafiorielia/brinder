import 'package:firebase_auth/firebase_auth.dart';

class FirebaseApi {
  static Future<void> createUser(
    String email,
    String password,
  ) async {
    FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
