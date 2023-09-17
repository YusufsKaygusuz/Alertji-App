abstract class ProfileState {}

class ProfileInitialState extends ProfileState{
  ProfileInitialState();
}

class ProfileLoadingState extends ProfileState{
  ProfileLoadingState();
}

class ProfileCompletedState extends ProfileState{
  ProfileCompletedState();
}

class ProfileErrorState extends ProfileState{
  String error;
  ProfileErrorState(this.error);
}