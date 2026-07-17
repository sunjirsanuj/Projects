import 'package:flutter/material.dart';
import 'package:random_signin_page/pallete.dart';

class LoginField extends StatelessWidget {
  final String hintText;
  const LoginField({super.key, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 285),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(18),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Pallete.borderColor, width: 2),
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Pallete.borderColor, width: 2),
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          hint: Text(hintText, style: TextStyle(color: Colors.white30)),
        ),
      ),
    );
  }
}
