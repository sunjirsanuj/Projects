import 'package:authentication_provider_praction/providers/auth_provider.dart';
import 'package:authentication_provider_praction/screens/home_screen.dart';
import 'package:authentication_provider_praction/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isVisible = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    final auth = context.read<AuthProvider>();

    final error = auth.login(
      email: _emailController.text,
      password: _passwordController.text,
    );

    if (error != null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(error)));
      return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(
                height: 70,
                child: TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 10),
                      child: IconTheme(
                        data: IconThemeData(color: Colors.grey[800]),
                        child: Icon(Icons.perm_identity),
                      ),
                    ),
                    hintText: "Email",

                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 20,
                    ),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: Color(0xFFE5ECF2),
                        width: 1,
                      ),
                    ),

                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: Color(0xFFE5ECF2),
                        width: 1,
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 70,
                child: TextField(
                  controller: _passwordController,
                  obscureText: !isVisible,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 10),
                      child: IconTheme(
                        data: IconThemeData(color: Colors.grey[800]),
                        child: Icon(Icons.lock_outline),
                      ),
                    ),
                    hintText: "Password",

                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            isVisible = !isVisible;
                          });
                        },
                        color: Colors.grey[800],
                        icon: isVisible
                            ? Icon(Icons.visibility_off)
                            : Icon(Icons.visibility),
                      ),
                    ),

                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 20,
                    ),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: Color(0xFFE5ECF2),
                        width: 1,
                      ),
                    ),

                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: Color(0xFFE5ECF2),
                        width: 1,
                      ),
                    ),
                  ),
                ),
              ),

              GestureDetector(
                onTap: () => _login(),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  width: double.infinity,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade800,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20,),

              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const SignupScreen()),
                  );
                },
                child: Text("Create a new account."),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
