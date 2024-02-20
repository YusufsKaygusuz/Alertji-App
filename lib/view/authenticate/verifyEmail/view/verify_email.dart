import 'package:alertji_app/product/widget/draw_clip.dart';
import 'package:alertji_app/product/widget/login_button.dart';
import 'package:alertji_app/view/authenticate/login/service/auth.dart';
import 'package:alertji_app/view/authenticate/login/view/login_view.dart';
import 'package:alertji_app/view/authenticate/verifyEmail/bloc/verify_cubit.dart';
import 'package:alertji_app/view/authenticate/verifyEmail/bloc/verify_state.dart';
import 'package:alertji_app/view/home/navigationpage/view/navigation_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyEmailPage extends StatelessWidget {
  const VerifyEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isProceed = true;
    return BlocProvider(
      create: (context) => VerifyEmailCubit(),
      child: Scaffold(
          body: BlocConsumer<VerifyEmailCubit, VerifyEmailState>(
        listener: (context, state) {
          if (state is VerifyEmailInitialState) {
            if (state.isVerified == true && isProceed == true) {
              isProceed = false;
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => NavigationView()),
                (Route<dynamic> route) => false,
              );
            } else {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => VerifyEmailPage()),
              // );
            }
          }
        },
        builder: (context, state) {
          if (state is VerifyEmailInitialState) {
            context.watch<VerifyEmailCubit>().runPage();
            return Column(
              children: [
                Stack(
                  children: [
                    const CustomGradientClip(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 150),
                      child: Column(
                        children: [
                          const Text(
                            "The e-mail verification link has been sent to your account.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(height: 100),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              children: [
                                GradientButton(
                                  onPressed: () {
                                    //sendAgain();
                                    context
                                        .read<VerifyEmailCubit>()
                                        .sendEmailVerificationAgain();
                                  },
                                  text: "Resend Verification Link",
                                ),
                                const SizedBox(height: 12),
                                GradientButton(
                                  onPressed: () {
                                    Auth().signOut();
                                    Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: (context) => LoginPage()),
                                      (Route<dynamic> route) => false,
                                    );
                                  },
                                  text: "Return and Sign Out",
                                ),
                                // GradientButton(
                                //   onPressed: () {
                                //     Navigator.of(context).pushAndRemoveUntil(
                                //       MaterialPageRoute(
                                //           builder: (context) => VerifyEmailPage()),
                                //       (Route<dynamic> route) => false,
                                //     );
                                //   },
                                //   text: "E-mail Adresimi Doğruladım",
                                // ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            );
          }
          // else if (state is VerifyEmailSuccessState) {
          //   if (state.isVerified == true) {
          //     return const Center(
          //         child: CircularProgressIndicator(color: Colors.red));
          //   } else {
          //     return const Center(
          //         child: CircularProgressIndicator(color: Colors.blue));
          //   }
          // }
          else {
            return const Center(
              child: Text("Installation Failed"),
            );
          }
        },
      )),
    );
  }
}

// class VerifyEmailPage extends StatefulWidget {
//   const VerifyEmailPage({super.key});

//   @override
//   State<VerifyEmailPage> createState() => _VerifyEmailPageState();
// }

// class _VerifyEmailPageState extends State<VerifyEmailPage> {
//   bool isVerified = false;
//   bool onPressedValue = true;
//   Timer? timer;
//   @override
//   void initState() {
//     super.initState();
//     isVerified = FirebaseAuth.instance.currentUser!.emailVerified;
//     if (!isVerified) {
//       timer = Timer.periodic(
//         const Duration(seconds: 3),
//         (_) => checkEmailVerified(),
//       );
//     }
//   }

//   @override
//   void dispose() {
//     timer?.cancel();
//     super.dispose();
//   }

//   Future<void> sendAgain() async {
//     User? currentUser = FirebaseAuth.instance.currentUser;
//     if (currentUser != null) {
//       await currentUser.reload();
//     }
//   }

//   Future<void> checkEmailVerified() async {
//     User? currentUser = FirebaseAuth.instance.currentUser;
//     if (currentUser != null) {
//       await currentUser.reload();
//       bool isVerified = currentUser.emailVerified;
//       setState(() {
//         isVerified = isVerified;
//       });
//       if (isVerified) {
//         timer?.cancel();
//         // ignore: use_build_context_synchronously
//         Navigator.pushAndRemoveUntil(
//           context,
//           MaterialPageRoute(builder: (context) => NavigationView()),
//           (Route<dynamic> route) => false,
//         );
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Stack(
//             children: [
//               const CustomGradientClip(),
//               Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 50, vertical: 150),
//                 child: Column(
//                   children: [
//                     const Text(
//                       "Email doğrulaması e-mail hesabınıza gönderilmiştir. Lütfen e-mail doğrulamanızı yapınız.",
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontSize: 18,
//                         color: Colors.white,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                     const SizedBox(height: 100),
//                     Padding(
//                       padding: const EdgeInsets.all(12.0),
//                       child: Column(
//                         children: [
//                           GradientButton(
//                             onPressed: () {
//                               sendAgain();
//                             },
//                             text: "Tekrar e-mail gönder",
//                           ),
//                           const SizedBox(height: 12),
//                           GradientButton(
//                             onPressed: () {
//                               Auth().signOut();
//                               Navigator.of(context).pushAndRemoveUntil(
//                                 MaterialPageRoute(
//                                     builder: (context) =>  LoginPage()),
//                                 (Route<dynamic> route) => false,
//                               );
//                             },
//                             text: "Geri dön ve çıkış yap",
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
