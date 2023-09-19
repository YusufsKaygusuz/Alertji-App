abstract class ForgotPasswordState {}

class ForgotPasswordInitialState extends ForgotPasswordState {
  ForgotPasswordInitialState();
}

class ForgotPasswordLoadingState extends ForgotPasswordState {
  ForgotPasswordLoadingState();
}

class ForgotPasswordCompeletedState extends ForgotPasswordState {
  bool isSent;
  ForgotPasswordCompeletedState(this.isSent);
}

class ForgotPasswordErrorState extends ForgotPasswordState {
  final String errorMessage;
  ForgotPasswordErrorState(this.errorMessage);
}
