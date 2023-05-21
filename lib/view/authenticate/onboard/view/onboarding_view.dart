import 'package:alertji_app/core/constants/color_constant.dart';
import 'package:alertji_app/view/authenticate/login/view/login_view.dart';
import 'package:alertji_app/view/authenticate/onboard/viewModel/onboarding_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  _storeOnBoardInfo() async {}
  bool isFirstTime = true;

  @override
  void initState() {
    super.initState();
    checkFirstTime();
  }

  Future<void> checkFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstTime = prefs.getBool('isFirstTime') ?? true;
    if (isFirstTime) {
      setState(() {
        this.isFirstTime = true;
      });
      await prefs.setBool('isFirstTime', false);
    } else {
      setState(() {
        this.isFirstTime = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isFirstTime) {
      return Scaffold(
        body: Container(
          color: Colors.white,
          child: ChangeNotifierProvider(
            create: (_) => OnboardingViewModel(),
            child: IntroductionScreen(
              key: Provider.of<OnboardingViewModel>(context)
                  .introductionScreenKey,
              pages: Provider.of<OnboardingViewModel>(context).pages,
              onDone: () =>
                  Provider.of<OnboardingViewModel>(context, listen: false)
                      .onFinishButtonPressed(context),
              onSkip: () =>
                  Provider.of<OnboardingViewModel>(context, listen: false)
                      .onFinishButtonPressed(context),
              isBottomSafeArea: false,
              globalBackgroundColor: Colors.white,
              skip: const Text('Skip',
                  style: TextStyle(color: ColorConst.primaryDarkColor)),
              showSkipButton: true,
              next: Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  color: ColorConst.primaryColor,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                ),
              ),
              done: Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  color: ColorConst.primaryDarkColor,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.done,
                  color: Colors.white,
                ),
              ),
              dotsDecorator: const DotsDecorator(
                color: ColorConst.primaryColor,
                activeColor: ColorConst.primaryDarkColor,
                size: Size(10.0, 10.0),
                activeSize: Size(22.0, 10.0),
                spacing: EdgeInsets.symmetric(horizontal: 3.0),
                activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
              ),
            ),
          ),
        ),
      );
    } else {
      return LoginPage();
    }
  }
}
