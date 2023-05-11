import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

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
  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }
   // Kullanıcıyı oturumdan çıkarmayı sağlayan işlev
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
