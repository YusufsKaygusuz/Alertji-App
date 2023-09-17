import 'package:alertji_app/view/home/profile/bloc/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitialState());

  Future<void> runPage() async {
    try {
      emit(ProfileLoadingState());
      emit(ProfileCompletedState());
    } catch (e) {
      emit(ProfileErrorState(e.toString()));
    }
  }
}
