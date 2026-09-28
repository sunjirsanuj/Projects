import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_shop_app/pages/home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 100,
              left: 150,
              right: 150,
              bottom: 50,
            ),
            child: Image.asset("lib/images/avocado.png"),
          ),

          Padding(
            padding: const EdgeInsets.all(24),
            child: Text(
              "We deliver groceries at your doorstep",

              textAlign: TextAlign.center,
              style: GoogleFonts.notoSerif(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 20,),

          const Text(
            "Fresh Item Everyday",
            style: TextStyle(color: Colors.grey),
          ),

          const Spacer(),

          GestureDetector(
            onTap: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const HomePage();
                },
              ),
            ),

            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(12),
              ),

              child: const Text(
                "Get Started",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),

          const Spacer(),
        ],
      ),
    );
  }
}
