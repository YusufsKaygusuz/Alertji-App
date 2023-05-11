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
  bool seePassword = false;
  String? errorMessage = ''; // Hata mesajını tutacak değişken
  bool isLogin = true; // Giriş durumunu belirleyen değişken

  final TextEditingController _controllerEmail =
      TextEditingController(); // E-posta giriş alanı kontrolcüsü
  final TextEditingController _controllerPassword =
      TextEditingController(); // Şifre giriş alanı kontrolcüsü
  final TextEditingController _controllerName =
      TextEditingController(); // İsim giriş alanı kontrolcüsü
  final TextEditingController _controllerSurname =
      TextEditingController(); // Soyisim giriş alanı kontrolcüsü
  final TextEditingController _controllerCheckPassword =
      TextEditingController(); // Şifre tekrarı alanı kontrolcüsü

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(
          email: _controllerEmail.text, password: _controllerPassword.text);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e
            .message; // Hata durumunda hatayı göstermek için errorMessage değişkenini günceller
      });
    }
  }

  Widget _errorMesage() {
    return Text(errorMessage == ''
        ? ''
        : 'Humm ? $errorMessage'); // Hata mesajını görüntüler veya boş bir metin döndürür
  }

  Widget _submitButton() {
    return ElevatedButton(
      onPressed: createUserWithEmailAndPassword,
      style: ElevatedButton.styleFrom(
        primary: Colors.green, // Yeşil renk
        minimumSize: const Size(200, 50), // Minimum boyut
      ),
      child:
          const Text('Kayıt Ol', style: TextStyle(fontSize: 16)), // Buton metni
    );
  }

  Widget _submitGoogleButton() {
    return ElevatedButton(
      onPressed: () {
        AuthGoogle().signInWithGoogle();
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.green, // Yeşil renk
        minimumSize: const Size(200, 50), // Minimum boyut
      ),
      child: const Text('Google ile Giriş',
          style: TextStyle(fontSize: 16)), // Buton metni
    );
  }

  Widget _appIcon() {
    return Container(
      height: 120.0,
      width: 120.0,
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage(
            'assets/images/onboard2.jpg',
          ),
          fit: BoxFit.contain,
        ),
        shape: BoxShape.circle,
        border: Border.all(color: Colors.greenAccent, width: 1),
      ),
    );
  }

  Widget _textFieldWidget(
      TextEditingController controller, String hintTitle, bool password,
      {IconData? icon}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
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
            borderSide:
                BorderSide(color: Colors.greenAccent.shade400, width: 1.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide:
                BorderSide(color: Colors.greenAccent.shade400, width: 1.0),
          ),
          prefixIcon: icon != null
              ? Icon(icon, color: Colors.greenAccent.shade400)
              : null,
          suffixIcon: password
              ? IconButton(
                  onPressed: () => _seePasswordStatus(),
                  icon: Icon(
                    seePassword
                        ? Icons.remove_red_eye
                        : Icons.remove_red_eye_outlined,
                    color: Colors.greenAccent.shade400,
                  ),
                )
              : null,
        ),
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
              _appIcon(),
              const SizedBox(
                height: 18,
              ),
              _textFieldWidget(_controllerEmail, "İsim", false,
                  icon: Icons.person),
              _textFieldWidget(_controllerEmail, "Soyisim", false,
                  icon: Icons.person),
              _textFieldWidget(_controllerEmail, "E-mail", false,
                  icon: Icons.mail),
              _textFieldWidget(_controllerPassword, "Şifre", true,
                  icon: Icons.lock),
              _textFieldWidget(_controllerPassword, "Şifre Tekrarı", true,
                  icon: Icons.lock),
              _errorMesage(), // Hata mesajını görüntüler veya boş bir metin döndürür
              _submitButton(), // Kayıt ol butonunu oluşturur
            ]),
      ),
    );
  }
}
