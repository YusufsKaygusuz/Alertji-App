import 'package:alertji_app/view/authenticate/onboard/bloc/onboard_state.dart';
import 'package:alertji_app/view/authenticate/onboard/onboard_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit()
      : super(OnboardingState(currentPage: 0, showOnboarding: true));
  final OnboardingRepository _repository = OnboardingRepository();
  final PageController pageController = PageController();
  void nextPage() {
    final newState = state.copyWith(currentPage: state.currentPage + 1);
    emit(newState);
    pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  void markAsCompleted() {
    final newState = state.copyWith(showOnboarding: false);
    emit(newState);
  }

  Future<int?> checkOnboardingStatus() async {
    return state.showOnboarding ? 0 : 1;
  }

  void previousPage() {
    if (state.currentPage > 0) {
      final newState = state.copyWith(currentPage: state.currentPage - 1);
      emit(newState);
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }

  int get currentPage => state.currentPage;

  List<PageViewModel> getOnboardingPages() {
    return _repository.getOnboardingItmes();
  }
}
