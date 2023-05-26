import 'package:alertji_app/view/authenticate/onboard/view/onboarding_view.dart';
import 'package:alertji_app/view/authenticate/onboard/viewModel/onboarding_viewmodel.dart';
import 'package:alertji_app/view/authenticate/verifyEmail/view/verify_email.dart';
import 'package:alertji_app/view/home/navigationpage/view/navigation_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:alertji_app/view/home/navigationpage/view/navigation_view.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => OnboardingViewModel()),
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
          'login': (context) => const OnboardingView(),
          'home': (context) => const NavigationView(),
        },
        //home: FirebaseAuth.instance.currentUser != null ? NavigationView() : LoginPage(),
      ),
    );
  }
}
