abstract class LoginState {}

class LoginInitialState extends LoginState {
  LoginInitialState();
}

class LoginLoadingState extends LoginState {
  LoginLoadingState();
}

class LoginCompletedState extends LoginState {
  bool isLoggedin;
  LoginCompletedState(this.isLoggedin);
}

class LoginErrorState extends LoginState {
  final String errorMessage;
  LoginErrorState(this.errorMessage);
}
