import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../login/service/auth_google.dart';
import '../service/auth.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool seePassword=false;
  String? errorMessage = ''; // Hata mesajını tutacak değişken
  bool isLogin = true; // Giriş durumunu belirleyen değişken

  final TextEditingController _controllerEmail = TextEditingController(); // E-posta giriş alanı kontrolcüsü
  final TextEditingController _controllerPassword = TextEditingController(); // Şifre giriş alanı kontrolcüsü

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(
          email: _controllerEmail.text, password: _controllerPassword.text);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message; // Hata durumunda hatayı göstermek için errorMessage değişkenini günceller
      });
    }
  }

  Widget _errorMesage() {
    return Text(errorMessage == '' ? '' : 'Humm ? $errorMessage'); // Hata mesajını görüntüler veya boş bir metin döndürür
  }

  Widget _submitButton() {
    return ElevatedButton(
        onPressed: createUserWithEmailAndPassword, // Butona tıklandığında createUserWithEmailAndPassword fonksiyonunu çalıştırır
        child: const Text('Register')); // Buton metni
  }
  Widget _submitGoogleButton() {
    return ElevatedButton(
        onPressed:() {
          AuthGoogle().signInWithGoogle();
        },
        child: const Text('SignIn With Google')); // Buton metni
  }
  Widget _textFieldWidget(
      TextEditingController controller, String hintTitle, bool password) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextField(
        obscureText: password ? !seePassword : false,
        controller: controller,
        keyboardType: password
            ? TextInputType.visiblePassword
            : TextInputType.emailAddress,
        decoration: InputDecoration(
            hintText: hintTitle,
            hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 12),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.grey.shade400, width: 1.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.grey.shade300, width: 1.0),
            ),
            suffixIcon: password
                ? IconButton(
                    onPressed: () => _seePasswordStatus(),
                    icon: Icon(
                      seePassword
                          ? Icons.remove_red_eye
                          : Icons.remove_red_eye_outlined,
                      color: Colors.grey,
                    ))
                : null),
      ),
    );
  }
  
  _seePasswordStatus() {
    setState(() {
      seePassword = !seePassword;
    });
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
              _textFieldWidget(_controllerEmail, "E-mail", false),
              _textFieldWidget(_controllerPassword, "Şifre", true),
              _errorMesage(), // Hata mesajını görüntüler veya boş bir metin döndürür
              _submitButton(), // Kayıt ol butonunu oluşturur
              _submitGoogleButton(), // Google ile giriş yap
            ]),
      ),
    );
  }
}