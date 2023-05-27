import 'package:alertji_app/product/widget/login_appbar.dart';
import 'package:alertji_app/product/widget/login_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../product/widget/custom_appbar.dart';
import '../../../../product/widget/draw_clip.dart';

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({Key? key}) : super(key: key);

  TextEditingController mailController = TextEditingController();

  Future resetPassword(BuildContext context) async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: mailController.text.trim());
    } on FirebaseAuthException catch (e) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message.toString()),
            );
          });
    }
  }

  Widget _textFieldWidget(TextEditingController controller, String hintTitle) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 35),
      child: TextField(
        controller: controller,
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
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const LoginAppBar(
        title: ("Şifremi Unuttum"),
      ),
      body: Column(
        children: [
          Stack(children: [
            const SizedBox(height: 240, child: CustomGradientClip()),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  const SizedBox(
                    height: 200,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      "E-mailinizi yazınız ve size şifrenizi sıfırlamanız için bir link gönderelim.",
                      style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  _textFieldWidget(mailController, "E-mail"),
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 80.0),
                    child: GradientButton(
                        onPressed: () => {resetPassword(context)},
                        text: "Gönder"),
                  )
                ],
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
