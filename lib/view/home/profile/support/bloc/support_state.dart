abstract class SupportState {}

class SupportInitialState extends SupportState {
  SupportInitialState();
}

class SupportLoadingState extends SupportState {
  SupportLoadingState();
}

class SupportCompeletedState extends SupportState {
  bool isSent;
  SupportCompeletedState(this.isSent);
}

class SupportErrorState extends SupportState {
  final String errorMessage;
  SupportErrorState(this.errorMessage);
}
