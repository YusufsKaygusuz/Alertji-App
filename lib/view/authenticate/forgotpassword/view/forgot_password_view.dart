// ignore_for_file: prefer_const_constructors

import 'package:alertji_app/view/authenticate/forgotpassword/bloc/forgot_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../product/widget/draw_clip.dart';
import '../../../../product/widget/login_appbar.dart';
import '../../../../product/widget/login_button.dart';
import '../bloc/forgot_password_cubit.dart';

class ForgotPasswordPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: ((context) => ForgotPasswordCubit()),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Reset Password'),
        ),
        body: BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
          listener: (context, state) {
            if (state is ForgotPasswordSuccess) {
              // Password sıfırlama işlemi başarılıysa yapılacak işlemler
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Şifre sıfırlama maili gönderildi.')),
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
            return Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(labelText: 'Email'),
                  ),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      final email = _emailController.text.trim();
                      if (email.isNotEmpty) {
                        // Cubit üzerinden password reset isteği gönder
                        context.read<ForgotPasswordCubit>().resetPassword(email);
                      }
                    },
                    child: Text('Şifreni Sıfırla'),
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








// class ForgotPasswordPage extends StatelessWidget {
//   final TextEditingController mailController = TextEditingController();
//   Widget _textFieldWidget(TextEditingController controller, String hintTitle) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 35),
//       child: TextField(
//         controller: controller,
//         decoration: InputDecoration(
//           hintText: hintTitle,
//           hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 12),
//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(20),
//             borderSide:
//                 BorderSide(color: Colors.greenAccent.shade400, width: 1.0),
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(20),
//             borderSide:
//                 BorderSide(color: Colors.greenAccent.shade400, width: 1.0),
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const LoginAppBar(
//         title: ("Şifremi Unuttum"),
//       ),
//       body: BlocProvider(
//         create: (context) => ForgotPasswordCubit(),
//         child: BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
//           builder: (context, state) {
//             return SingleChildScrollView(
//               child: Column(
//                 children: [
//                   Stack(children: [
//                     const SizedBox(height: 240, child: CustomGradientClip()),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 30),
//                       child: Column(
//                         children: [
//                           const Padding(
//                             padding: EdgeInsets.only(top: 60.0, left: 20),
//                             child: Text(
//                               "Allertji App şifreni unuttuysan dert etme.",
//                               style:
//                                   TextStyle(color: Colors.white, fontSize: 18),
//                             ),
//                           ),
//                           const Text(
//                             "Sana yardımcı olacağız.",
//                             style: TextStyle(color: Colors.white, fontSize: 18),
//                           ),
//                           const SizedBox(
//                             height: 110,
//                           ),
//                           const Padding(
//                             padding: EdgeInsets.all(20.0),
//                             child: Text(
//                               "E-mailinizi yazınız ve size şifrenizi sıfırlamanız için bir link gönderelim.",
//                               style: TextStyle(fontSize: 16),
//                               textAlign: TextAlign.center,
//                             ),
//                           ),
//                           _textFieldWidget(mailController, "E-mail"),
//                           Container(
//                             padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
//                           ),
//                           Padding(
//                             padding:
//                                 const EdgeInsets.symmetric(horizontal: 80.0),
//                             child: GradientButton(
//                               onPressed: () {
//                                 context
//                                     .read<ForgotPasswordCubit>()
//                                     .resetPassword(mailController.text.trim()
//                                         as BuildContext);
//                               },
//                               text: "Gönder",
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ]),
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
