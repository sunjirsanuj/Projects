import 'package:flutter/material.dart';
import 'package:login_page_1/pallete.dart';
//import 'package:login_page_1/test.dart';
import 'package:login_page_1/login_page.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Molish",
        scaffoldBackgroundColor: Pallete.backgroundColor,
      ),
      home: LoginPage(),
    );
  }
}