import 'package:alertji_app/view/home/profile/viewmodel/body.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hesabım"),
        backgroundColor: Colors.green,
      ),
      body: const Body(),
    );
  }
}
