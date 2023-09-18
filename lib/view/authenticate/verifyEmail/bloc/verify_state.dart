abstract class VerifyEmailState {}

class VerifyEmailInitialState extends VerifyEmailState {
  bool isVerified;
  VerifyEmailInitialState(this.isVerified);
}

// class VerifyEmailSuccessState extends VerifyEmailState {
//   final bool isVerified;

//   VerifyEmailSuccessState(this.isVerified);
// }

class VerifyEmailErrorState extends VerifyEmailState{
  String error;
  VerifyEmailErrorState(this.error);
}