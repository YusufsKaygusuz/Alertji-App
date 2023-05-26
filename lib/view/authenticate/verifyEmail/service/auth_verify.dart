import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
