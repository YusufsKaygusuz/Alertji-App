import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../service/auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? errorMessage = ''; // Hata mesajını tutacak değişken
  bool isLogin = true; // Giriş durumunu belirleyen değişken

  final TextEditingController _controllerEmail = TextEditingController(); // E-posta giriş alanı kontrolcüsü
  final TextEditingController _controllerPassword = TextEditingController(); // Şifre giriş alanı kontrolcüsü

  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
          email: _controllerEmail.text, password: _controllerPassword.text);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message; // Hata durumunda hatayı göstermek için errorMessage değişkenini günceller
      });
    }
  }

  Widget _entryField(
    String title,
    TextEditingController controller,
  ) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: title, // Alan etiketine başlık değerini atar
      ),
    );
  }

  Widget _errorMesage() {
    return Text(errorMessage == '' ? '' : 'Humm ? $errorMessage'); // Hata mesajını görüntüler veya boş bir metin döndürür
  }

  Widget _submitButton() {
    return ElevatedButton(
        onPressed: signInWithEmailAndPassword, // Butona tıklandığında signInWithEmailAndPassword fonksiyonunu çalıştırır
        child: Text( 'Login')); // Buton metni
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _entryField('email', _controllerEmail), // E-posta giriş alanını oluşturur
              _entryField('password', _controllerPassword), // Şifre giriş alanını oluşturur
              _errorMesage(), // Hata mesajını görüntüler veya boş bir metin döndürür
              _submitButton(), // Giriş butonunu oluşturur
            ]),
      ),
    );
  }
}
