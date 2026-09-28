import 'package:flutter/material.dart';
import 'package:random_signin_page/widget/gradiant_button.dart';
import 'package:random_signin_page/widget/login_field.dart';
import 'package:random_signin_page/widget/social_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Image.asset("assets/images/signin_balls.png"),
              Text(
                "Sign in.",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              const SizedBox(height: 50),
              SocialButton(icon: "assets/svgs/g_logo.svg", label: "Continue with Google",),
              const SizedBox(height: 15,),
              SocialButton(icon: "assets/svgs/f_logo.svg", label: "Continue with facebook", padding: 53,),
              const SizedBox(height: 20,),
              Text("or"),
              const SizedBox(height: 20,),
              LoginField(hintText: "Email",),
              const SizedBox(height: 15,),
              LoginField(hintText: "Password",),
              const SizedBox(height: 20,),
              GradiantButton(),
            ],
          ),
        ),
      ),
    );
  }
}
