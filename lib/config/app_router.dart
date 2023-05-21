import 'package:alertji_app/view/authenticate/login/view/login_view.dart';
import 'package:alertji_app/view/authenticate/onboard/view/onboarding_view.dart';
import 'package:alertji_app/view/authenticate/register/view/register_view.dart';
import 'package:alertji_app/view/home/navigationpage/view/navigation_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  //initialExtra: '/',
  initialLocation: FirebaseAuth.instance.currentUser != null ? "/home" : "/onboarding",
  routes: [
    GoRoute(
      path: "/login",
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: "/home",
      builder: (context, state) => const NavigationView(),
    ),
    GoRoute(
      path: "/register",
      builder: (context, state) => const RegisterPage(),
    ),
    GoRoute(
      path: "/onboarding",
      builder: (context, state) => const OnboardingView(),
    ),
  ],
);
