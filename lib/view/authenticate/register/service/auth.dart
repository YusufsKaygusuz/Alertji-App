import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore fireStore =
      FirebaseFirestore.instance; // _fireStore olarak kullanılabilir !!!

  // Mevcut kullanıcıyı döndüren getter
  User? get currentUser => _firebaseAuth.currentUser;

  // Oturum durumu değişikliklerini dinleyen bir akış döndüren getter
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  // E-posta ve şifre ile giriş yapmayı sağlayan işlev
  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  // E-posta ve şifre ile kullanıcı oluşturmayı sağlayan işlev
  Future<bool> createUserWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    //_fireStore.collection('Users').doc(currentUser!.uid).update();
    await currentUser!.updateDisplayName(name);
    return true;
  }

  // Kullanıcıyı oturumdan çıkarmayı sağlayan işlev
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  //Şifre doğrulama yapılıyor
  bool validatePassword(
      String passwordController, String confirmPasswordController) {
    String password = passwordController; //.text;
    String confirmPassword = confirmPasswordController; //.text;

    if (password.isEmpty || confirmPassword.isEmpty) {
      return false;
    } else if (password == confirmPassword) {
      return true;
    } else {
      return false;
    }
  }

  // Email onaylaması yapılıyor
  void verifyEmail() {
    User? user = FirebaseAuth.instance.currentUser;
    user!.sendEmailVerification();
  }
}
