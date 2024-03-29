// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:alertji_app/core/constants/color_constant.dart';
import 'package:alertji_app/product/widget/draw_clip.dart';
import 'package:alertji_app/product/widget/login_button.dart';
import 'package:alertji_app/view/authenticate/forgotpassword/view/forgot_password_view.dart';
import 'package:alertji_app/view/authenticate/login/bloc/login_cubit.dart';
import 'package:alertji_app/view/authenticate/login/bloc/login_state.dart';
import 'package:alertji_app/view/authenticate/verifyEmail/view/verify_email.dart';
import 'package:alertji_app/view/home/navigationpage/view/navigation_view.dart';
import 'package:alertji_app/widgets/auth/appIcon_widget.dart';
import 'package:alertji_app/widgets/auth/signUp_widget.dart';
import 'package:alertji_app/widgets/auth/textField_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../service/auth.dart';

class LoginPage extends StatelessWidget {
  String? errorMessage = ''; // Hata mesajını tutacak değişken
  bool isLogin = true; // Giriş durumunu belirleyen değişken

  final TextEditingController _controllerEmail =
      TextEditingController(); // E-posta giriş alanı kontrolcüsü
  final TextEditingController _controllerPassword =
      TextEditingController(); // Şifre giriş alanı kontrolcüsü

  LoginPage({super.key});

  // Future<void> signInWithEmailAndPassword() async {
  //   try {
  //     await Auth().signInWithEmailAndPassword(
  //         email: _controllerEmail.text, password: _controllerPassword.text);
  //   } on FirebaseAuthException catch (e) {
  //     // setState(() {
  //     //   errorMessage = e
  //     //       .message; // Hata durumunda hatayı göstermek için errorMessage değişkenini günceller
  //     // });
  //   }
  // }

  Widget _errorMesage() {
    return Text(errorMessage == ''
        ? ''
        : '$errorMessage'); // Hata mesajını görüntüler veya boş bir metin döndürür
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
          body: BlocConsumer<LoginCubit, LoginState>(
        listener: ((context, state) {}),
        builder: (context, state) {
          if (state is LoginInitialState) {
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
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Column(
                            children: [
                              const AppIconWidget(),
                              TextFieldWidget(_controllerEmail, "E-mail", false,
                                  Icons.email),
                              TextFieldWidget(_controllerPassword, "Password",
                                  true, Icons.lock),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 180.0, top: 5),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ForgotPasswordPage()),
                                    );
                                  },
                                  child: const Text(
                                    "Forgot Password",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        decoration: TextDecoration.underline),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: _errorMesage(),
                              ), // Hata mesajını görüntüler veya boş bir metin döndürür
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 50.0,
                                ),
                                child: GradientButton(
                                    onPressed: () async {
                                      context.read<LoginCubit>().logIn(
                                            email: _controllerEmail.text,
                                            password: _controllerPassword.text,
                                          );
                                    },
                                    text: 'Log In'),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 90.0, top: 8),
                                child: SignUpWidget(),
                              ),
                              const SizedBox(height: 20),
                              // InkWell(
                              //   child: Container(
                              //     decoration: BoxDecoration(
                              //       border: Border.all(
                              //           width: 3.5,
                              //           color: ColorConst.primaryColor),
                              //       borderRadius: BorderRadius.circular(6),
                              //     ),
                              //     child: Image.network(
                              //       "https://pbs.twimg.com/profile_images/1511043794937991169/3B5fpOw8_400x400.png",
                              //       height: 50,
                              //       width: 50,
                              //     ),
                              //   ),
                              //   onTap: () async {
                              //     AuthGoogle authGoogle = AuthGoogle();
                              //     try {
                              //       UserCredential? userCredential =
                              //           await authGoogle.signInWithGoogle();
                              //       if (userCredential != null) {
                              //         Navigator.pushReplacement(
                              //           context,
                              //           MaterialPageRoute(
                              //               builder: (context) =>
                              //                   HomePageView()),
                              //         );
                              //       } else {
                              //         print("Google ile giriş yapılamadı.");
                              //         // Gerekli hata işlemlerini yapabilirsiniz
                              //       }
                              //     } catch (e) {
                              //       print(
                              //           "Google ile oturum açma başarısız oldu: $e");
                              //       // Hata durumunda yapılacak işlemler buraya gelebilir
                              //     }
                              //   },
                              // ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ]),
                ),
              ),
            );
          } else if (state is LoginLoadingState) {
            return const Center(
                child:
                    CircularProgressIndicator(color: ColorConst.primaryColor));
          } else if (state is LoginCompletedState) {
            if (state.isLoggedin == true) {
              if (Auth().verifyEmail() == true) {
                Future.delayed(const Duration(milliseconds: 400), () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NavigationView()),
                  );
                });
                return const Scaffold(
                  body: Center(child: Text("")),
                );
              } else {
                Future.delayed(const Duration(milliseconds: 400), () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const VerifyEmailPage()),
                  );
                });
                return const Scaffold(
                  body: Center(child: Text("")),
                );
              }
            } else {
              Future.delayed(const Duration(milliseconds: 400), () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              });
              return const Scaffold(
                body: Center(child: Text("Your e-mail or password is wrong.")),
              );
            }
          } else {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => LoginPage()),
                (Route<dynamic> route) => false);
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      )),
    );
  }
}
