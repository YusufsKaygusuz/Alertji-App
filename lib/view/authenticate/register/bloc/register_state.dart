abstract class RegisterState {}

class RegisterInitialState extends RegisterState {
  RegisterInitialState();
}

class RegisterLoadingState extends RegisterState {
  RegisterLoadingState();
}

class RegisterCompletedState extends RegisterState {
  bool isRegister;
  RegisterCompletedState(this.isRegister);
}

class RegisterErrorState extends RegisterState {
  final String errorMessage;
  RegisterErrorState(this.errorMessage);
}
