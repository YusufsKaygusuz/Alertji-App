import 'package:alertji_app/view/authenticate/login/view/login_view.dart';
import 'package:alertji_app/view/authenticate/onboard/view/onboarding_view.dart';
import 'package:alertji_app/view/authenticate/onboard/viewModel/onboarding_viewmodel.dart';
// import 'package:alertji_app/view/home/navigationpage/view/navigation_view.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

int? initScreen;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //isViewed = prefs.getInt('onBoard');
  initScreen = await prefs.getInt("initScreen");
  await prefs.setInt('initScreen', 1);
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
        initialRoute: initScreen == 0 || initScreen == null ? "first" : "/",
        routes: {
          '/': (context) => const LoginPage(),
          "first": (context) => const OnboardingView(),
        },
        //home: FirebaseAuth.instance.currentUser != null ? NavigationView() : LoginPage(),
      ),
    );
  }
}
