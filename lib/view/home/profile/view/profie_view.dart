import 'package:alertji_app/product/widget/draw_clip.dart';
import 'package:alertji_app/view/home/profile/viewmodel/body.dart';
import 'package:flutter/material.dart';

import '../../navigationpage/view/navigation_view.dart';

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
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 152, 236, 143),
                Color.fromARGB(255, 71, 229, 166),
                Color.fromARGB(255, 65, 200, 146),
              ],
              stops: [0.0, 0.5, 1.0],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              tileMode: TileMode.clamp,
            ),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const NavigationView()),
                (Route<dynamic> route) => false);
          },
        ),
        title: const Text("Hesabım"),
        backgroundColor: Colors.green,
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(height: 580, child: CustomGradientClip()),
                Body(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
