import 'package:bloc/bloc.dart';
import 'register_state.dart';
import 'package:alertji_app/view/authenticate/register/service/auth.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitialState());
  Auth auth = Auth();
  bool isRegister = false;

  Future<void> Register({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      //emit(LoginInitialState());
      emit(RegisterLoadingState());
      isRegister = await auth.createUserWithEmailAndPassword(
          name: name, email: email, password: password);
      emit(RegisterCompletedState(isRegister));
    } catch (e) {
      emit(RegisterErrorState("Error"));
    }
  }
}
