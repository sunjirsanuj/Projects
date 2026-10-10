import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice/counter_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CounterProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(textTheme: GoogleFonts.poppinsTextTheme()),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Provider Practice",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),

        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  context.read<CounterProvider>().decrement();
                },
                child: Container(
                  padding: const EdgeInsets.all(15),
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red.shade200,
                  ),
                  child: Icon(
                    Icons.remove,
                    size: 30,
                    color: Colors.grey.shade900,
                  ),
                ),
              ),
              Container(
                width: 40,
                alignment: Alignment.center,
                child: Consumer<CounterProvider>(
                  builder: (context, provider, child) {
                    return Text(
                      provider.count.toString(),
                      style: TextStyle(fontSize: 30),
                    );
                  },
                ),
              ),
              GestureDetector(
                onTap: () {
                  context.read<CounterProvider>().increment();
                },
                child: Container(
                  padding: const EdgeInsets.all(15),
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green.shade200,
                  ),
                  child: Icon(Icons.add, size: 30, color: Colors.grey.shade900),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
