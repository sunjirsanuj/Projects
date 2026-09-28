import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shushi_restaurant_app/componentes/button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 138, 60, 55),

      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            const SizedBox(height: 25),

            // shop name
            Text(
              "SUSHI MAN",
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 28,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 25),

            // icon
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
                bottom: 20,
                left: 120,
                right: 120,
              ),
              child: Image.asset("lib/images/salmon_eggs.png"),
            ),
            const SizedBox(height: 25),

            // title
            Text(
              "THE TASTE OF THE JAPANESE FOOD",
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 44,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 25),

            // subtitle
            Text(
              "Feel the taste of the most popular Japanese food from anywhere and anytime",
              style: TextStyle(color: Colors.grey[300], height: 2),
            ),
            const SizedBox(height: 25),

            // get started button
            MyButton(text: "Get Started"),
          ],
        ),
      ),
    );
  }
}
