import 'package:alertji_app/view/home/allergenspage/view/allergens_view.dart';
import 'package:alertji_app/view/home/homepage/view/homepage_view.dart';
import 'package:alertji_app/view/home/navigationpage/view/navigation_view.dart';
import 'package:alertji_app/view/home/profile/view/profie_view.dart';
import 'package:flutter/material.dart';

abstract class NavigationViewModel extends State<NavigationView> {
  List<Widget> screenList = [
    const HomePageView(),
    const AllergensView(),
    const ProfileView()
  ];
}
