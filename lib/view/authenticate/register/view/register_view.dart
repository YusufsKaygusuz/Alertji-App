import 'package:alertji_app/view/home/navigationpage/view/navigation_view.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import '../../onboard/view/onboarding_view.dart';
// import '../../../home/homepage/view/homepage_view.dart';
// import '../../profie/view/profile_view.dart';
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
  /* 
  final TextEditingController _controllerSurname =
      TextEditingController(); // Soyisim giriş alanı kontrolcüsü
  */

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

  Widget _button({
    required VoidCallback onTap,
    required String text,
    double borderRadius = 15.0,
  }) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      height: MediaQuery.of(context).size.height * 0.08,
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
                fontSize: 16.0,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _appIcon() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      height: MediaQuery.of(context).size.height * 0.3,
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
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 35),
        child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _appIcon(),
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
                _button(
                    onTap: () {
                      if (_controllerName.text.isEmpty) {
                        AlertDialog alertName = AlertDialog(
                          title: const Text("Hata"),
                          content: const Text("İsim alanı boş bırakılamaz"),
                          actions: [
                            TextButton(
                              child: const Text("Tamam"),
                              onPressed: () {
                                Navigator.pop(context); // AlertDialog'u kapat
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
                        if (Auth().validatePassword(_controllerPassword.text,
                                _controllerCheckPassword.text) ==
                            true) {
                          createUserWithEmailAndPassword();
                          if (FirebaseAuth.instance.currentUser != null) {
                            // Navigator.of(context).push(MaterialPageRoute(
                            //     builder: (context) =>
                            //         const NavigationView())); // const eklendi.
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const NavigationView()),
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
                                  Navigator.pop(context); // AlertDialog'u kapat
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
              ]),
        ),
      ),
    );
  }
}
