import 'package:alertji_app/core/constants/color_constant.dart';
import 'package:alertji_app/view/home/allergenspage/view/allergens_view.dart';
import 'package:alertji_app/view/home/homepage/view/homepage_view.dart';
import 'package:alertji_app/view/home/navigationpage/bloc/navigation_cubit.dart';
import 'package:alertji_app/view/home/profile/view/profie_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';

// ignore: must_be_immutable
class NavigationView extends StatelessWidget {
  NavigationView({super.key});

  final List<Widget> _pages = [
    const HomePageView(),
    const AllergensView(),
    const ProfileView()
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigationCubit(),
      child: Scaffold(
        body: BlocBuilder<NavigationCubit, int>(
          builder: (context, selectedTab) {
            return _pages[selectedTab];
          },
        ),
        bottomNavigationBar: BlocBuilder<NavigationCubit, int>(
          builder: (context, selectedTab) {
            return MoltenBottomNavigationBar(
              domeCircleColor: ColorConst.primaryDarkColor,
              barColor: ColorConst.primaryColor,
              borderRaduis: const BorderRadius.only(
                topLeft: Radius.circular(0),
                topRight: Radius.circular(0),
              ),
              selectedIndex: selectedTab,
              onTabChange: (clickedIndex) {
                BlocProvider.of<NavigationCubit>(context)
                    .changeTab(clickedIndex);
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
            );
          },
        ),
      ),
    );
  }
}

/*
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
*/