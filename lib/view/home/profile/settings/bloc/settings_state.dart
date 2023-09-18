abstract class SettingsState {}

class SettingsLoadedState extends SettingsState {
  final bool isDarkModeEnabled;
  final String selectedLanguage;

  SettingsLoadedState({
    required this.isDarkModeEnabled,
    required this.selectedLanguage,
  });
}

class SettingsLoadingState extends SettingsState {}

class SettingsErrorState extends SettingsState {
  final String errorMessage;

  SettingsErrorState({required this.errorMessage});
}
