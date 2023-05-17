import 'package:alertji_app/view/authenticate/onboard/viewModel/onboarding_viewmodel.dart';
import 'package:alertji_app/view/home/navigationpage/view/navigation_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
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
        home: const NavigationView(),
      ),
    );
  }
}
