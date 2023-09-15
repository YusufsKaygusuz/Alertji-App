import 'package:alertji_app/core/constants/color_constant.dart';
import 'package:alertji_app/view/authenticate/register/view/register_view.dart';
import 'package:flutter/material.dart';

class SignUpWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          "Hesabınız yok mu? ",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black54, fontSize: 14),
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
                color: ColorConst.primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 14),
          ),
        ),
      ],
    );
  }

}