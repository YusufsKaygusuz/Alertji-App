import 'package:alertji_app/view/home/navigationpage/viewmodel/navigation_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';

class NavigationView extends StatefulWidget {
  const NavigationView({super.key});

  @override
  State<NavigationView> createState() => _NavigationViewState();
}

class _NavigationViewState extends NavigationViewModel {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        bottomNavigationBar: MoltenBottomNavigationBar(
          domeCircleColor: const Color.fromARGB(255, 65, 200, 146),
          barColor: const Color.fromARGB(255, 71, 229, 166),
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
                color: Colors.white,
              ),
            ),
            MoltenTab(
                icon: const Icon(
              Icons.qr_code,
              color: Colors.white,
            )),
            MoltenTab(
              icon: const Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
          ],
        ),
        body: Center(
          child: screenList.elementAt(_selectedIndex),
        ),
      ),
    );
  }
}
