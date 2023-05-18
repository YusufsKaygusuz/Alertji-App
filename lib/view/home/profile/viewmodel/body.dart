import 'package:flutter/material.dart';

import '../../../authenticate/login/service/auth.dart';
import '../../../authenticate/login/view/login_view.dart';
import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          const ProfilePic(),
          const SizedBox(height: 20),
          ProfileMenu(
            text: "Hesabım",
            icon: const Icon(Icons.person),
            press: () => {},
          ),
          ProfileMenu(
            text: "Bildirimler",
            icon: const Icon(Icons.notification_add),
            press: () {},
          ),
          ProfileMenu(
            text: "Ayarlar",
            icon: const Icon(Icons.settings),
            press: () {},
          ),
          ProfileMenu(
            text: "Destek",
            icon: const Icon(Icons.help_center),
            press: () {},
          ),
          ProfileMenu(
            text: "Çıkış Yap",
            icon: const Icon(Icons.logout),
            press: () {
              Auth().signOut();
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const LoginPage()));
            },
          ),
        ],
      ),
    );
  }
}
