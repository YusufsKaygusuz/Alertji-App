import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../login/view/login_view.dart';
import '../service/auth.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(height: 50, width: 15,color: Colors.red,),
            Text(FirebaseAuth.instance.currentUser!.email!),
            Text(FirebaseAuth.instance.currentUser!.displayName?? 'name'),
            ElevatedButton(
              onPressed: (){
                Auth().signOut();
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPage()));
              },
               child: Text("Logout"))
          ],
        ),
      ),
    );
  }
}