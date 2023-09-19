import 'package:flutter/material.dart';

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
