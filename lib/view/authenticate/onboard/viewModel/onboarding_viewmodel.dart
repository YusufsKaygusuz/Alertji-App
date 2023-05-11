import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboardingViewModel extends ChangeNotifier {
  final GlobalKey<IntroductionScreenState> introductionScreenKey =
      GlobalKey<IntroductionScreenState>();

  void onFinishButtonPressed(BuildContext context) {
    // Navigator.of(context).pushReplacementNamed('');
  }

  void onSkipButtonPressed(BuildContext context) {
    // Navigator.of(context).pushReplacementNamed('');
  }

  final List<PageViewModel> _pages = [
    PageViewModel(
      title: "",
      bodyWidget: Column(
        children: const [
          Image(
            image: AssetImage('assets/images/onboard1.jpg'),
          ),
          Padding(
            padding: EdgeInsets.only(top: 30),
            child: Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
      decoration: const PageDecoration(
          bodyAlignment: Alignment.center, titlePadding: EdgeInsets.all(30)),
    ),
    PageViewModel(
      title: "",
      bodyWidget: Column(
        children: const [
          Image(
            image: AssetImage('assets/images/onboard2.jpg'),
          ),
          Padding(
            padding: EdgeInsets.only(top: 30),
            child: Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
      decoration: const PageDecoration(
          bodyAlignment: Alignment.center, titlePadding: EdgeInsets.all(30)),
    ),
    PageViewModel(
      title: "",
      bodyWidget: Column(
        children: const [
          Image(
            image: AssetImage('assets/images/onboard3.jpg'),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
      decoration: const PageDecoration(
          bodyAlignment: Alignment.center, titlePadding: EdgeInsets.all(30)),
    ),
  ];
  List<PageViewModel> get pages => _pages;
}
