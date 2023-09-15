import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboardingRepository {
  List<PageViewModel> getOnboardingItmes() {
    return [
      PageViewModel(
        title: "",
        bodyWidget: const Column(
          children: [
            Image(
              image: AssetImage('assets/images/onboard1.jpg'),
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
      PageViewModel(
        title: "",
        bodyWidget: const Column(
          children: [
            Image(
              image: AssetImage('assets/images/onboard2.jpg'),
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
      PageViewModel(
        title: "",
        bodyWidget: const Column(
          children: [
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
  }
}
