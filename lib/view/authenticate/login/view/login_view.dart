import 'package:alertji_app/view/home/navigationpage/view/navigation_view.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import '../../forgotpassword/view/forgot_password_view.dart';
import '../../profie/view/profile_view.dart';
import '../../register/view/register_view.dart';
import '../service/auth.dart';
import '../service/auth_google.dart';
import '../viewmodel/drawclip.dart';

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

  Widget _button({
    required VoidCallback onTap,
    required String text,
    double borderRadius = 15.0,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: SizedBox(
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
              color: Colors.green,
            ),
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
        ),
      ),
    );
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
          "Hesabınız yok mu ?",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 14),
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
                color: Colors.green, fontWeight: FontWeight.bold, fontSize: 14),
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
                ClipPath(
                  clipper: DrawClip2(),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.5,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(255, 152, 236, 143),
                          Color.fromARGB(255, 71, 229, 166),
                          Color.fromARGB(255, 65, 200, 146),
                        ],
                        stops: [0.0, 0.5, 1.0], // Durakları ayarla
                        begin: Alignment.bottomCenter,
                        end: Alignment.bottomRight,
                        tileMode: TileMode.clamp,
                      ),
                    ),
                  ),
                ),
                ClipPath(
                  clipper: DrawClip(),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.45,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(255, 65, 200, 146),
                          Color.fromARGB(255, 71, 229, 166),
                          Color.fromARGB(255, 152, 236, 143),
                        ],
                        stops: [0.0, 0.5, 1.0], // Durakları ayarla
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        tileMode: TileMode.clamp,
                      ),
                    ),
                  ),
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
                                  builder: (context) =>
                                      const ForgotPasswordPage()),
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
                        padding: const EdgeInsets.only(top: 8.0),
                        child: _button(
                            onTap: () async {
                              await signInWithEmailAndPassword();
                              if (FirebaseAuth.instance.currentUser != null) {
                                _controllerEmail.clear();
                                _controllerPassword.clear();
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const NavigationView()),
                                    (Route<dynamic> route) => false);
                              }
                            },
                            text: 'Giriş Yap'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 90.0, top: 8),
                        child: _signUp(),
                      ),
                      const SizedBox(height: 20),
                      SignInButton(Buttons.Google, text: "Google ile giriş yap",
                          onPressed: () {
                        AuthGoogle().signInWithGoogle();
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                const ProfilePageTemp())); // const eklendi.
                      })
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
