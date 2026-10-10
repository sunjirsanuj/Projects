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

        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
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
                  child: CounterDisplay(),
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
            const SizedBox(height: 20,),
        
            GestureDetector(
              onTap: (){
                context.read<CounterProvider>().reset();
              },
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.circle
                ),
                child: Icon(Icons.refresh,
                size: 30,
                ),
              ),
            ),
          ]
        ),
      ),
    );
  }
}


class CounterDisplay extends StatelessWidget {
  const CounterDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = context.watch<CounterProvider>();
    return Text(
      counter.count.toString(),
      style: TextStyle(
        fontSize: 30,
      ),
    );
  }
}