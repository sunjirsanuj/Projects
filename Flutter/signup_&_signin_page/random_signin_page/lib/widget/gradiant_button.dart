import 'package:flutter/material.dart';
import 'package:random_signin_page/pallete.dart';

class GradiantButton extends StatelessWidget {
  const GradiantButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Pallete.gradient1, Pallete.gradient2, Pallete.gradient3],
        begin: Alignment.bottomLeft,
        end: Alignment.topRight),
        borderRadius: BorderRadius.circular(5),
      ),
      child: ElevatedButton(onPressed: (){},
      style: ElevatedButton.styleFrom(
        fixedSize: Size(285, 50),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      child: Text("Sign in",
      style: TextStyle(
        color: Pallete.whiteColor,
      ),)),
    );
  }
}