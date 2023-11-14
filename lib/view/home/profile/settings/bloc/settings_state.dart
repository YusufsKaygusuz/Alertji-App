abstract class SettingsState {}

class SettingsInitialState extends SettingsState{}

class SettingsLoadingState extends SettingsState {}

class SettingsErrorState extends SettingsState {
  final String errorMessage;

  SettingsErrorState({required this.errorMessage});
}
