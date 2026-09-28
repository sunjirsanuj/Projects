import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:random_signin_page/pallete.dart';

class SocialButton extends StatelessWidget {
  final String icon;
  final String label;
  final double padding;
  const SocialButton({super.key, required this.icon, required this.label, this.padding = 60});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {},
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 2, color: Pallete.borderColor),
          borderRadius: BorderRadius.circular(5),
        ),
        padding: EdgeInsets.symmetric(vertical: 25, horizontal: padding),
      ),
      icon: SvgPicture.asset(
        icon,
        height: 20,
        color: Pallete.whiteColor,
      ),
      label: Text(
        label,
        style: TextStyle(color: Pallete.whiteColor),
      ),
    );
  }
}
