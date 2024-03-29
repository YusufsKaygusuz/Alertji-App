import 'package:alertji_app/view/authenticate/login/view/login_view.dart';
import 'package:alertji_app/view/home/profile/settings/view/settings_view.dart';
import 'package:alertji_app/view/home/profile/support/view/support_view.dart';
import 'package:flutter/material.dart';
import '../../../authenticate/login/service/auth.dart';
import 'profile_menu.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Map<String, dynamic>> get profileMenuItems => [
        {
          'text': 'My Account',
          'iconData': Icons.person,
          'route': () {},
        },
        {
          'text': 'Notifications',
          'iconData': Icons.notification_add,
          'route': () {},
        },
        {
          'text': 'Settings',
          'iconData': Icons.settings,
          'route': () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => SettingsPage()),
                (Route<dynamic> route) => false);
          },
        },
        {
          'text': 'Support',
          'iconData': Icons.help_center,
          'route': () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const SupportPage()),
                (Route<dynamic> route) => false);
          },
        },
        {
          'text': 'Log Out',
          'iconData': Icons.logout,
          'route': () {
            Auth().signOut();
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => LoginPage()),
                (Route<dynamic> route) => false);
          },
        },
      ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          const SizedBox(height: 20),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: profileMenuItems.length,
            itemBuilder: (context, index) {
              final menuItem = profileMenuItems[index];
              return ProfileMenu(
                text: menuItem['text'],
                iconData: menuItem['iconData'],
                press: menuItem['route'],
              );
            },
          ),
        ],
      ),
    );
  }
}
