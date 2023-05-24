import 'package:alertji_app/core/constants/color_constant.dart';
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
            Icons.checklist_rtl_sharp,
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
