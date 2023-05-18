import 'package:flutter/material.dart';

import '../../../authenticate/login/view/login_view.dart';
import '../service/auth.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Center(
          child: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                Auth().signOut();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const LoginPage()));
              },
              child: const Text("Logout")),
        ],
      )),
    );
  }
}
