import 'package:flutter/material.dart';
import 'package:login_page_1/pallete.dart';

class InputField extends StatelessWidget {
  final String hint;
  final bool secureText;
  const InputField({super.key, required this.hint, this.secureText = false});

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: secureText,
      decoration: InputDecoration(
        filled: true,
        fillColor: Pallete.textField,
        contentPadding: EdgeInsets.all(20),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(style: BorderStyle.none),
          borderRadius: BorderRadius.circular(30),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(style: BorderStyle.none),
          borderRadius: BorderRadius.circular(30),
        ),
        hint: Text(hint, style: TextStyle(color: Colors.black)),
      ),
    );
  }
}
