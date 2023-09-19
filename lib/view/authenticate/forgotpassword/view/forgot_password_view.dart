import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../product/widget/draw_clip.dart';
import '../../../../product/widget/login_appbar.dart';
import '../../../../product/widget/login_button.dart';
import '../bloc/forgot_password_cubit.dart';

class ForgotPasswordPage extends StatelessWidget {
  final TextEditingController mailController = TextEditingController();
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
      body: BlocProvider(
        create: (context) => ForgotPasswordCubit(),
        child: BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Stack(children: [
                    const SizedBox(height: 240, child: CustomGradientClip()),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 60.0, left: 20),
                            child: Text(
                              "Allertji App şifreni unuttuysan dert etme.",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ),
                          const Text(
                            "Sana yardımcı olacağız.",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          const SizedBox(
                            height: 110,
                          ),
                          const Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Text(
                              "E-mailinizi yazınız ve size şifrenizi sıfırlamanız için bir link gönderelim.",
                              style: TextStyle(fontSize: 16),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          _textFieldWidget(mailController, "E-mail"),
                          Container(
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 80.0),
                            child: GradientButton(
                              onPressed: () {
                                context
                                    .read<ForgotPasswordCubit>()
                                    .resetPassword(mailController.text.trim()
                                        as BuildContext);
                              },
                              text: "Gönder",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
