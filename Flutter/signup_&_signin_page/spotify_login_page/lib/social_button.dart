import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  final String icon;
  final String label;
  const SocialButton({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: SizedBox(
        width: double.infinity,
        height: 45,
        child: TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(30),
              side: const BorderSide(color: Colors.white24),
            ),
            padding: EdgeInsetsGeometry.symmetric(horizontal: 25),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Image.asset(icon, height: 20),
              ),
              Text(
                label,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
