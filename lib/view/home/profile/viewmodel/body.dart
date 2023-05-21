import 'dart:io';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../authenticate/login/service/auth.dart';
import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatefulWidget {
  const Body({Key? key});

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  File? _profileImage;

  void _updateProfileImage(File? newImage) {
    setState(() {
      _profileImage = newImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePic(
            onImageChanged: _updateProfileImage,
            initialImage: _profileImage,
          ),
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
            press: () {},
          ),
          ProfileMenu(
            text: "Destek",
            iconData: Icons.help_center,
            press: () {},
          ),
          ProfileMenu(
            text: "Çıkış Yap",
            iconData: Icons.logout,
            press: () {
              Auth().signOut();
                  context.go('/login');
            },
          ),
        ],
      ),
    );
  }
}
