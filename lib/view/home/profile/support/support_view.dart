import 'package:alertji_app/product/widget/draw_clip.dart';
import 'package:alertji_app/product/widget/login_button.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../view/profie_view.dart';

class SupportPage extends StatelessWidget {
  final String supportEmail = 'alertjiapp@gmail.com';

  Future<void> _sendEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: supportEmail,
    );

    if (await canLaunch(emailUri.toString())) {
      await launch(emailUri.toString());
    } else {
      throw 'Could not launch email';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Destek'),
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const ProfileView()),
                (Route<dynamic> route) => false);
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              const CustomGradientClip(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40.0, vertical: 150),
                child: Column(
                  children: [
                    const Text(
                      'Bize Ulaşın',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16.0),
                    const Text(
                      'Herhangi bir soru, öneri veya geri bildiriminiz mi var? Bize e-posta gönderin.',
                      style: TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 100.0),
                    GradientButton(onPressed: _sendEmail, text: 'Bize Ulaşın')
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
