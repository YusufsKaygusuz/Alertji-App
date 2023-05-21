import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import '../service/auth.dart';

class ProfilePageTemp extends StatefulWidget {
  const ProfilePageTemp({super.key});

  @override
  State<ProfilePageTemp> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePageTemp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              height: 50,
              width: 15,
              color: Colors.red,
            ),
            Text(FirebaseAuth.instance.currentUser!.email!),
            Text(FirebaseAuth.instance.currentUser!.displayName ?? 'name'),
            ElevatedButton(
                onPressed: () {
                  Auth().signOut();
                  context.go('/'); // const eklendi.
                },
                child: const Text("Logout"))
          ],
        ),
      ),
    );
  }
}
