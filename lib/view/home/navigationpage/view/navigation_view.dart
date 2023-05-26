import 'package:alertji_app/core/constants/color_constant.dart';
import 'package:alertji_app/view/authenticate/login/view/login_view.dart';
import 'package:alertji_app/view/home/navigationpage/viewmodel/navigation_viewmodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';

class NavigationView extends StatefulWidget {
  const NavigationView({super.key});

  @override
  State<NavigationView> createState() => _NavigationViewState();
}

class _NavigationViewState extends NavigationViewModel {
  //bool isVerified = FirebaseAuth.instance.currentUser!.emailVerified;
  @override
  initState() {
    super.initState();
    if (FirebaseAuth.instance.currentUser!.emailVerified == false) {
      Future(() {
        FirebaseAuth.instance.signOut();
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const LoginPage()),
            (Route<dynamic> route) => false);
      });
    }
  }

  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorConst.primaryColor,
        onPressed: () {},
        child: const Icon(Icons.qr_code),
      ),
      bottomNavigationBar: MoltenBottomNavigationBar(
        domeCircleColor: ColorConst.primaryDarkColor,
        barColor: ColorConst.primaryColor,
        borderRaduis: const BorderRadius.only(
          topLeft: Radius.circular(0),
          topRight: Radius.circular(0),
        ),
        selectedIndex: _selectedIndex,
        onTabChange: (clickedIndex) {
          setState(() {
            _selectedIndex = clickedIndex;
          });
        },
        tabs: [
          MoltenTab(
            icon: const Icon(
              Icons.home,
              color: ColorConst.backgroundColor,
            ),
          ),
          MoltenTab(
              icon: const Icon(
            Icons.qr_code,
            color: ColorConst.backgroundColor,
          )),
          MoltenTab(
            icon: const Icon(
              Icons.person,
              color: ColorConst.backgroundColor,
            ),
          ),
        ],
      ),
      body: Center(
        child: screenList.elementAt(_selectedIndex),
      ),
    );
  }
}
