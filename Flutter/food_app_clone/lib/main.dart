import 'package:flutter/material.dart';
import 'package:food_app_clone/screens/home/home_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const FoodApp());
}

class FoodApp extends StatelessWidget {
  const FoodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Food App",
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xfffaf9f5),
        textTheme: GoogleFonts.poppinsTextTheme(),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xffffb000),),
        useMaterial3: true,
      ),

      home: const HomePage(),
    );
  }
}

