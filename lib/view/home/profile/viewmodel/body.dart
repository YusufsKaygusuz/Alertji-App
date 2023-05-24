import 'dart:io';
import 'package:alertji_app/view/authenticate/login/view/login_view.dart';
import 'package:alertji_app/view/home/profile/settings/view/settings_view.dart';
import 'package:alertji_app/view/home/profile/support/support_view.dart';
import 'package:flutter/material.dart';
import '../../../authenticate/login/service/auth.dart';
import 'profile_menu.dart';

class Body extends StatefulWidget {
  const Body({Key? key});

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          const SizedBox(height: 20),
          ProfileMenu(
            text: "Hesabım",
            iconData: Icons.person,
            press: () {},
          ),
          ProfileMenu(
            text: "Bildirimler",
            iconData: Icons.notification_add,
            press: () {},
          ),
          ProfileMenu(
            text: "Ayarlar",
            iconData: Icons.settings,
            press: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => SettingsPage()),
                  (Route<dynamic> route) => false);
            },
          ),
          ProfileMenu(
            text: "Destek",
            iconData: Icons.help_center,
            press: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => SupportPage()),
                  (Route<dynamic> route) => false);
            },
          ),
          ProfileMenu(
            text: "Çıkış Yap",
            iconData: Icons.logout,
            press: () {
              Auth().signOut();
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                  (Route<dynamic> route) => false);
            },
          ),
        ],
      ),
    );
  }
}
