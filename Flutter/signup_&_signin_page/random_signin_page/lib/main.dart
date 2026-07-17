import 'package:flutter/material.dart';
import 'package:random_signin_page/login_page.dart';
import 'package:random_signin_page/pallete.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Login Page",
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Pallete.backgroundColor,
      ),

      home: LoginPage(),
    );
  }
}