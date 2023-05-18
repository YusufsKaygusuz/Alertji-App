import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);
  Widget _textFieldWidget(TextEditingController controller, String hintTitle) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 35),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintTitle,
          hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 12),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide:
                BorderSide(color: Colors.greenAccent.shade400, width: 1.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide:
                BorderSide(color: Colors.greenAccent.shade400, width: 1.0),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController mailController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Şifremi Unuttum"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _textFieldWidget(mailController, "E-mail"),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              ),
              ElevatedButton(
                onPressed: () => {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                child: const Text(
                  'Gönder',
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
