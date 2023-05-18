import 'package:alertji_app/core/constants/color_constant.dart';
import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  final ValueChanged<String> onChanged;

  const SearchTextField({required this.onChanged, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.search,
          color: ColorConst.hintTextcolor,
          size: 26,
        ),
        labelText: "Search",
        labelStyle: const TextStyle(color: ColorConst.hintTextcolor),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
        ),
      ),
      onChanged: onChanged,
    );
  }
}
