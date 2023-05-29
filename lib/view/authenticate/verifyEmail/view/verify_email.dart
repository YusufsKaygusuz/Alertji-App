import 'dart:async';
import 'package:alertji_app/product/widget/draw_clip.dart';
import 'package:alertji_app/product/widget/login_button.dart';
import 'package:alertji_app/view/authenticate/login/view/login_view.dart';
import 'package:alertji_app/view/authenticate/verifyEmail/service/auth_verify.dart';
import 'package:alertji_app/view/home/navigationpage/view/navigation_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class VerifyEmailPage extends StatefulWidget {
  const VerifyEmailPage({super.key});

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  bool isVerified = false;
  bool onPressedValue = true;
  Timer? timer;
  @override
  void initState() {
    super.initState();
    isVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    if (!isVerified) {
      timer = Timer.periodic(
        const Duration(seconds: 3),
        (_) => checkEmailVerified(),
      );
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future<void> sendAgain() async {
  User? user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    await user.sendEmailVerification();
  }
}

  Future checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      isVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });
    if (isVerified) {
      timer?.cancel();
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const NavigationView()),
          (Route<dynamic> route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              const CustomGradientClip(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 150),
                child: Column(children: [
                  const Text(
                    "Email doğrulaması e-mail hesabınıza gönderilmiştir. Lütfen e-mail doğrulamanızı yapınız.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 100),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: GradientButton(
                        onPressed: () {
                          sendAgain();
                        },
                        text: "Tekrar e-mail gönder"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: GradientButton(
                      onPressed: () {
                        Auth().signOut();
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()),
                            (Route<dynamic> route) => false);
                      },
                      text: "Geri dön ve çıkış yap",
                    ),
                  )
                ]),
              )
            ],
          ),
        ],
      ),
    );
  }
}
