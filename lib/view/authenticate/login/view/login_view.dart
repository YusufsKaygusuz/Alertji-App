import 'package:alertji_app/core/constants/color_constant.dart';
import 'package:alertji_app/product/widget/draw_clip.dart';
import 'package:alertji_app/product/widget/login_button.dart';
import 'package:alertji_app/view/authenticate/verifyEmail/view/verify_email.dart';
import 'package:alertji_app/view/home/navigationpage/view/navigation_view.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../forgotpassword/view/forgot_password_view.dart';
import '../../register/view/register_view.dart';
import '../service/auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? errorMessage = ''; // Hata mesajını tutacak değişken
  bool isLogin = true; // Giriş durumunu belirleyen değişken
  bool seePassword = false;

  final TextEditingController _controllerEmail =
      TextEditingController(); // E-posta giriş alanı kontrolcüsü
  final TextEditingController _controllerPassword =
      TextEditingController(); // Şifre giriş alanı kontrolcüsü

  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
          email: _controllerEmail.text, password: _controllerPassword.text);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e
            .message; // Hata durumunda hatayı göstermek için errorMessage değişkenini günceller
      });
    }
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
                    color: const Color.fromARGB(255, 12, 109, 62),
                  ),
                )
              : null,
        ),
      ),
    );
  }

  Widget _errorMesage() {
    return Text(errorMessage == ''
        ? ''
        : '$errorMessage'); // Hata mesajını görüntüler veya boş bir metin döndürür
  }

  Widget _signUp() {
    return Row(
      children: [
        const Text(
          "Hesabınız yok mu? ",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black54, fontSize: 14),
        ),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const RegisterPage()),
            );
          },
          child: const Text(
            "Kayıt ol",
            style: TextStyle(
                color: ColorConst.primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 14),
          ),
        ),
      ],
    );
  }

  Widget _appIcon() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.45,
      height: MediaQuery.of(context).size.height * 0.45,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/images/logo.png',
          ),
          fit: BoxFit.contain,
        ),
        shape: BoxShape.circle,
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
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(children: [
            Stack(
              children: [
                const CustomGradientClip(
                  isTopToBottom: true,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    children: [
                      _appIcon(),
                      _textFieldWidget(_controllerEmail, "E-mail", false,
                          icon: Icons.mail),
                      _textFieldWidget(_controllerPassword, "Şifre", true,
                          icon: Icons.lock),

                      Padding(
                        padding: const EdgeInsets.only(left: 180.0, top: 5),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ForgotPasswordPage()),
                            );
                          },
                          child: const Text(
                            "Şifremi Unuttum",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                decoration: TextDecoration.underline),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: _errorMesage(),
                      ), // Hata mesajını görüntüler veya boş bir metin döndürür
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 50.0,
                        ),
                        child: GradientButton(
                            onPressed: () async {
                              await signInWithEmailAndPassword();
                              if (FirebaseAuth.instance.currentUser != null) {
                                _controllerEmail.clear();
                                _controllerPassword.clear();
                                if (Auth().verifyEmail() == true) {
                                  // ignore: use_build_context_synchronously
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const NavigationView()),
                                      (Route<dynamic> route) => false);
                                } else {
                                  // ignore: use_build_context_synchronously
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const VerifyEmailPage()),
                                      (Route<dynamic> route) => false);
                                }
                              }
                            },
                            text: 'Giriş Yap'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 90.0, top: 8),
                        child: _signUp(),
                      ),
                      const SizedBox(height: 20),
                      InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 3.5, color: ColorConst.primaryColor),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Image.network(
                            "https://pbs.twimg.com/profile_images/1511043794937991169/3B5fpOw8_400x400.png",
                            height: 50,
                            width: 50,
                          ),
                        ),
                        onTap: () {
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
