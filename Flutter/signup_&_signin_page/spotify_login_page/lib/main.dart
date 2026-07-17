import 'package:flutter/material.dart';
import 'package:spotify_login_page/login_page.dart';

void main(){
    runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Spotify Login Page",
        theme: ThemeData(
            fontFamily: "Poppins"
        ),
        home: LoginPage(),
    );
  }
}