import 'package:flutter/material.dart';

class SignupButton extends StatelessWidget {
  const SignupButton({super.key});

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
                     backgroundColor: Color(0xFF00D361),
                      padding: EdgeInsetsGeometry.symmetric(horizontal: 25),
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                  
                        const Text("Sign up free",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),),
                      ],
                    ),
                  ),
                ),
              );
  }
}