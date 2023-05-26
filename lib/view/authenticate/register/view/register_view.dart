import 'package:alertji_app/product/widget/login_button.dart';
import 'package:alertji_app/view/authenticate/verifyEmail/view/verify_email.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import '../../onboard/view/onboarding_view.dart';
// import '../../../home/homepage/view/homepage_view.dart';
// import '../../profie/view/profile_view.dart';
import '../../../../product/widget/draw_clip.dart';
import '../service/auth.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool seePassword = false;
  String? errorMessage = ''; // Hata mesajını tutacak değişken
  bool isLogin = false; // Giriş durumunu belirleyen değişken

  final TextEditingController _controllerEmail =
      TextEditingController(); // E-posta giriş alanı kontrolcüsü
  final TextEditingController _controllerPassword =
      TextEditingController(); // Şifre giriş alanı kontrolcüsü
  final TextEditingController _controllerName =
      TextEditingController(); // İsim giriş alanı kontrolcüsü
  final TextEditingController _controllerCheckPassword =
      TextEditingController(); // Şifre tekrarı alanı kontrolcüsü

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(
          name: _controllerName.text,
          email: _controllerEmail.text,
          password: _controllerPassword.text);
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

  Widget _textFieldWidget(
      TextEditingController controller, String hintTitle, bool password,
      {IconData? icon}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 30),
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
      appBar: AppBar(
        title: const Text("Kayıt Ol"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(children: [
            Stack(children: [
              const SizedBox(
                height: 180,
                child: CustomGradientClip(
                  isTopToBottom: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(children: [
                  const SizedBox(
                    height: 150,
                  ),
                  _textFieldWidget(_controllerName, "İsim", false,
                      icon: Icons.person),
                  _textFieldWidget(_controllerEmail, "E-mail", false,
                      icon: Icons.mail),
                  _textFieldWidget(_controllerPassword, "Şifre", true,
                      icon: Icons.lock),
                  _textFieldWidget(
                      _controllerCheckPassword, "Şifre Tekrarı", true,
                      icon: Icons.lock),
                  _errorMesage(), // Hata mesajını görüntüler veya boş bir metin döndürür
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60.0),
                    child: GradientButton(
                        onPressed: () {
                          if (_controllerName.text.isEmpty) {
                            AlertDialog alertName = AlertDialog(
                              title: const Text("Hata"),
                              content: const Text("İsim alanı boş bırakılamaz"),
                              actions: [
                                TextButton(
                                  child: const Text("Tamam"),
                                  onPressed: () {
                                    Navigator.pop(
                                        context); // AlertDialog'u kapat
                                  },
                                ),
                              ],
                            );
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return alertName;
                                });
                          } else {
                            if (Auth().validatePassword(
                                    _controllerPassword.text,
                                    _controllerCheckPassword.text) ==
                                true) {
                              createUserWithEmailAndPassword();
                              if (FirebaseAuth.instance.currentUser != null) {
                                Auth().verifyEmail();
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const VerifyEmailPage()),
                                    (route) => false);
                                _controllerCheckPassword.clear();
                                _controllerPassword.clear();
                                _controllerEmail.clear();
                                _controllerName.clear();
                              }
                            } else {
                              AlertDialog alertPassword = AlertDialog(
                                title: const Text("Hata"),
                                content: const Text(
                                    "Girdiğiniz şifreler uyuşmuyor veya şifre alanı boş bırakılamaz"),
                                actions: [
                                  TextButton(
                                    child: const Text("Tamam"),
                                    onPressed: () {
                                      Navigator.pop(
                                          context); // AlertDialog'u kapat
                                    },
                                  ),
                                ],
                              );
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return alertPassword;
                                  });
                            }
                          }
                        },
                        text: "Kayıt Ol"),
                  ),
                ]),
              ),
            ]),
          ]),
        ),
      ),
    );
  }
}
