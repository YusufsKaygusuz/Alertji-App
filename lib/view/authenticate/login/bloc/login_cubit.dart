// ignore_for_file: use_build_context_synchronously

import 'package:alertji_app/view/authenticate/login/bloc/login_state.dart';
import 'package:alertji_app/view/authenticate/login/service/auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());
  Auth auth = Auth();
  bool isLoggedIn = false;

  Future<void> logIn({
    required String email,
    required String password,
  }) async {
    try {
      //emit(LoginInitialState());
      emit(LoginLoadingState());
      isLoggedIn = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      emit(LoginCompletedState(isLoggedIn));
    } catch (e) {
      emit(LoginErrorState("HATA! Cubit sınıfı error"));
    }
  }
}
