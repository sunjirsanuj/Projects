import 'package:flutter/material.dart';
import 'package:login_page_1/pallete.dart';
import 'package:login_page_1/widgets/input_button.dart';
import 'package:login_page_1/widgets/input_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: Column(
                  children: [
                    const SizedBox(height: 140),

                    const Text(
                      "Log In",
                      style: TextStyle(
                        fontSize: 38,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 35),
                    InputField(hint: "Email"),
                    const SizedBox(height: 15),
                    InputField(hint: "Password", secureText: true),
                    const SizedBox(height: 15),
                    InputButton(
                      label: "LOG IN",
                      txtColor: Pallete.buttonColor_2,
                      bgColor: Pallete.buttonColor_1,
                    ),
                    const SizedBox(height: 5),
                    InputButton(
                      label: "SIGN UP",
                      txtColor: Pallete.buttonColor_2,
                      bgColor: Pallete.buttonColor_1,
                      hoPadding: 202,
                    ),
                  ],
                ),
              ),
            ),
          ),

          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              "assets/images/frame_1.png",
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
