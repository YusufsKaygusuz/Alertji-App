import 'package:alertji_app/view/authenticate/forgotpassword/bloc/forgot_password_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit() : super(ForgotPasswordInitial());

  void resetPassword(String email) async {
    try {
      emit(ForgotPasswordLoading());
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      emit(ForgotPasswordSuccess());
    } catch (error) {
      emit(ForgotPasswordFailure(error.toString()));
    }
  }
}

