import 'dart:async';

import 'package:alertji_app/view/authenticate/verifyEmail/bloc/verify_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyEmailCubit extends Cubit<VerifyEmailState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Timer? timer;
  VerifyEmailCubit() : super(VerifyEmailInitialState(false));

  Future<void> runPage() async {
    await checkEmailVerified();
  }

  Future<void> checkEmailVerified() async {
    final currentUser = _auth.currentUser;
    if (currentUser != null) {
      await currentUser.reload();
      final isVerified = currentUser.emailVerified;
      //await Future.delayed(const Duration(seconds: 10));
      //emit(VerifyEmailSuccessState(isVerified));
      emit(VerifyEmailInitialState(isVerified));
    }
  }

  Future<void> sendEmailVerificationAgain()async{
    await _auth.currentUser?.sendEmailVerification();
  }
}