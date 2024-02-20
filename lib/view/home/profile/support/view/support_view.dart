import 'package:alertji_app/product/widget/draw_clip.dart';
import 'package:alertji_app/product/widget/login_button.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../view/profie_view.dart';

class SupportPage extends StatelessWidget {
  final String supportEmail = 'alertjiapp@gmail.com';

  const SupportPage({super.key});

  Future<void> _sendEmail() async {
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Destek"),
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 152, 236, 143),
                Color.fromARGB(255, 71, 229, 166),
                Color.fromARGB(255, 65, 200, 146),
              ],
              stops: [0.0, 0.5, 1.0],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              tileMode: TileMode.clamp,
            ),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const ProfileView()),
              (Route<dynamic> route) => false,
            );
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
                    const EdgeInsets.symmetric(horizontal: 40.0, vertical: 100),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    children: [
                      const Text(
                        'Contact Us',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      const Text(
                        'Have any questions, suggestions or feedback? Email us.',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      const SizedBox(height: 140.0),
                      GradientButton(
                        onPressed: _sendEmail,
                        text: 'Contact Us',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
