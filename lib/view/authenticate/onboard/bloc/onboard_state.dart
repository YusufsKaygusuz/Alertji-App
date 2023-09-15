class OnboardingState {
  final int currentPage;
  final bool showOnboarding;
  OnboardingState({required this.currentPage, required this.showOnboarding});

  OnboardingState copyWith({
    int? currentPage,
    bool? showOnboarding,
  }) {
    return OnboardingState(
      currentPage: currentPage ?? this.currentPage,
      showOnboarding: showOnboarding ?? this.showOnboarding,
    );
  }
}
