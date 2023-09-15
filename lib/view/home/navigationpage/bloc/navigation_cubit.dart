import 'package:alertji_app/view/authenticate/login/view/login_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationCubit extends Cubit<int> {
  NavigationCubit() : super(0);

  void selectTab(int tab) {
    emit(tab);
  }

  void changeTab(int newIndex) => emit(newIndex);

  Future<void> verifyEmailAndSignOut(BuildContext context) async {
    if (FirebaseAuth.instance.currentUser!.emailVerified == false) {
      FirebaseAuth.instance.signOut();
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) =>  LoginPage()),
        (Route<dynamic> route) => false,
      );
    }
  }
}
