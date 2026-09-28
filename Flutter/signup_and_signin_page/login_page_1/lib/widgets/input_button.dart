import 'package:flutter/material.dart';

class InputButton extends StatelessWidget {
  final String label;
  final Color bgColor;
  final Color txtColor;
  final double hoPadding;
  const InputButton({super.key, required this.label, required this.bgColor, required this.txtColor, this.hoPadding=208});

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: () {},
    style: TextButton.styleFrom(
      padding: EdgeInsets.symmetric(vertical: 26, horizontal: hoPadding),
      backgroundColor: bgColor,
    ),
    child: Text(label,
    style: TextStyle(
      color: txtColor,
      fontSize: 16,
    ),));
  }
}
