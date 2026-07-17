import 'package:flutter/material.dart';
import 'package:spotify_login_page/signup_button.dart';

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
              
              Padding(
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
                          child: Image.asset(
                            "assets/images/phone_icon.png",
                            height: 20,
                          ),
                        ),
                        const Text("Continue with phone number",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
          
              Padding(
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
                      padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Image.asset(
                            "assets/images/google.png",
                            height: 23,
                          ),
                        ),
                        const Text("Continue with Google",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
          
              Padding(
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
                      padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Image.asset(
                            "assets/images/facebook.png",
                            height: 25,
                          ),
                        ),
                        const Text("Continue with facebook",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
          
              TextButton(onPressed: (){}, child: Text("Log in",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),))
            ],
          ),
        ),
      ),
    );
  }
}
