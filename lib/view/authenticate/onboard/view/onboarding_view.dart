import 'package:alertji_app/core/constants/color_constant.dart';
import 'package:alertji_app/product/widget/primary_button.dart';
import 'package:alertji_app/view/authenticate/login/view/login_view.dart';
import 'package:alertji_app/view/authenticate/onboard/bloc/onboard_cubit.dart';
import 'package:alertji_app/view/authenticate/onboard/bloc/onboard_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    final onboardingCubit = context.read<OnboardingCubit>();
    final List<PageViewModel> items = onboardingCubit.getOnboardingPages();

    return BlocBuilder<OnboardingCubit, OnboardingState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Column(
              children: [
                Align(
                    alignment: Alignment.topRight,
                    child: PrimaryButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()));
                        },
                        buttonText: "Atla")),
                const SizedBox(height: 20),
                Expanded(
                  child: PageView.builder(
                    itemCount: items.length,
                    controller: onboardingCubit.pageController,
                    onPageChanged: (index) {
                      if (index > onboardingCubit.currentPage) {
                        onboardingCubit.nextPage();
                      } else if (index < onboardingCubit.currentPage) {
                        onboardingCubit.previousPage();
                      }
                    },
                    itemBuilder: (context, index) {
                      return IntroductionScreen(
                        pages: items,
                        onDone: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>  LoginPage())),
                        onSkip: () => onboardingCubit.nextPage(),
                        isBottomSafeArea: false,
                        globalBackgroundColor: Colors.white,
                        next: Container(
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                            color: ColorConst.primaryDarkColor,
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(25.0)),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
