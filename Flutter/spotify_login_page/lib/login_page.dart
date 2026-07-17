import 'package:flutter/material.dart';
import 'package:spotify_login_page/signup_button.dart';
import 'package:spotify_login_page/social_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121212),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            alignment: Alignment.topCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 150),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,

            children: [
              Image.asset("assets/images/spotify_icon.png", height: 60),
              const SizedBox(height: 20),
              Text(
                "Millions of songs.",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Free on Spotify.",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 70),
              SignupButton(),
              const SizedBox(height: 10),

              SocialButton(
                icon: "assets/images/phone_icon.png",
                label: "Continue with phone number",
              ),
              const SizedBox(height: 10),

              SocialButton(
                icon: "assets/images/google.png",
                label: "Continue with Google",
              ),
              const SizedBox(height: 10),

              SocialButton(
                icon: "assets/images/facebook.png",
                label: "Continue with facebook",
              ),
              const SizedBox(height: 10),

              TextButton(
                onPressed: () {},
                child: Text(
                  "Log in",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
