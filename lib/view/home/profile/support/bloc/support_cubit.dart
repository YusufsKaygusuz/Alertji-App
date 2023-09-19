import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class SupportCubit extends Cubit<SupportState> {
  SupportCubit() : super(SupportInitial());
  final String supportEmail = 'alertjiapp@gmail.com';

  Future<void> sendEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: supportEmail,
    );

    // ignore: deprecated_member_use
    if (await canLaunch(emailUri.toString())) {
      // ignore: deprecated_member_use
      await launch(emailUri.toString());
    } else {
      throw 'Could not launch email';
    }
    emit(SupportSuccess());
  }
}

abstract class SupportState {}

class SupportInitial extends SupportState {}

class SupportSuccess extends SupportState {}
