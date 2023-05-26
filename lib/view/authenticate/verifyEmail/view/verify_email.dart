import 'dart:async';

import 'package:alertji_app/product/widget/primary_button.dart';
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

  Future checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      isVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });
    if (isVerified) {
      timer?.cancel();
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const NavigationView()),
          (Route<dynamic> route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        children: [
          const Text("Email verification has been sent to your email."),
          PrimaryButton(
            buttonText: 'Resent Email',
            onPressed: () {
              FirebaseAuth.instance.currentUser!.sendEmailVerification();
            },
          ),
          PrimaryButton(
            buttonText: 'Go back and logout',
            onPressed: () {
              Auth().signOut();
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                  (Route<dynamic> route) => false);
            },
          ),
        ],
      ),
    ));
  }
}
