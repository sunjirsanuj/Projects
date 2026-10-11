import 'package:authentication_provider_praction/providers/auth_provider.dart';
import 'package:authentication_provider_praction/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isVisible = false;

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _signup() {
    final auth = context.read<AuthProvider>();
    final error = auth.signup(
      fullName: _fullNameController.text,
      email: _emailController.text,
      password: _passwordController.text,
    );

    if (error != null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(error)));
      return;
    }

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Signup successful!')));

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Signup", style: TextStyle(fontWeight: FontWeight.bold)),
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
                  controller: _fullNameController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 10),
                      child: IconTheme(
                        data: IconThemeData(color: Colors.grey[800]),
                        child: Icon(Icons.perm_identity),
                      ),
                    ),
                    hintText: "Full name",

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
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 10),
                      child: IconTheme(
                        data: IconThemeData(color: Colors.grey[800]),
                        child: Icon(Icons.email_outlined),
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
                onTap: () => _signup(),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  width: double.infinity,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade800,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "Signup",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
