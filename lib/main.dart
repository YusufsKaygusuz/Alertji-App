import 'package:alertji_app/view/authenticate/login/view/login_view.dart';
import 'package:alertji_app/view/authenticate/onboard/bloc/onboard_cubit.dart';
import 'package:alertji_app/view/authenticate/onboard/view/onboarding_view.dart';
import 'package:alertji_app/view/home/navigationpage/view/navigation_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

int? initScreen;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  initScreen = await OnboardingCubit().checkOnboardingStatus();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<OnboardingCubit>(
          create: (context) => OnboardingCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Alertji-App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),

        initialRoute:
            FirebaseAuth.instance.currentUser != null ? 'home' : 'login',
        routes: {
          'login': (context) =>
              initScreen == 0 ? const OnboardingView() : LoginPage(),
          'home': (context) => NavigationView(),
        },
        //home: FirebaseAuth.instance.currentUser != null ? NavigationView() : LoginPage(),
      ),
    );
  }
}
