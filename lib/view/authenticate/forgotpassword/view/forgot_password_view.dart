// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../product/widget/draw_clip.dart';
import '../../../../product/widget/login_appbar.dart';
import '../../../../product/widget/login_button.dart';
import '../bloc/forgot_password_cubit.dart';
import '../bloc/forgot_password_state.dart';

class ForgotPasswordPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgotPasswordCubit(),
      child: Scaffold(
        appBar: LoginAppBar(
          title: "Forgot Password",
        ),
        body: BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
          listener: (context, state) {
            if (state is ForgotPasswordSuccess) {
              // Password sıfırlama işlemi başarılıysa yapılacak işlemler
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text('Password recovery mail has been sent.')),
              );
              Navigator.pop(context);
            } else if (state is ForgotPasswordFailure) {
              // Password sıfırlama işlemi başarısızsa yapılacak işlemler
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error)),
              );
            }
          },
          builder: (context, state) {
            if (state is ForgotPasswordLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 240, child: CustomGradientClip()),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 0.0, left: 20),
                          child: Text(
                            "If you forgot your Allertji App password, don't worry.",
                            style: TextStyle(color: Colors.green, fontSize: 16),
                          ),
                        ),
                        Text(
                          "We will help you.",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        _textFieldWidget(_emailController, "email"),
                        SizedBox(height: 30),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 80.0),
                          child: GradientButton(
                            onPressed: () {
                              context
                                  .read<ForgotPasswordCubit>()
                                  .resetPassword(_emailController.text.trim());
                            },
                            text: "Send",
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
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
