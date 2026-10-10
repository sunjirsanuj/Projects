import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice_2/cart_provider.dart';
import 'package:provider_practice_2/dummy_data.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(textTheme: GoogleFonts.poppinsTextTheme()),

      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "My Shopping Cart",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];

                  return ListTile(
                    title: Text(
                      item.name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text("\$" + item.price.toString()),
                    trailing: Container(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GestureDetector(
                            onTap: () {
                              context.read<CartProvider>().removeFromCart(item);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              margin: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Colors.red.shade200,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(Icons.remove, size: 20),
                            ),
                          ),

                          Consumer<CartProvider>(
                            builder: ((context, value, child) {
                              return Container(
                                width: 20,
                                alignment: Alignment.center,
                                child: Text(
                                  value.quantityOf(item).toString(),
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              );
                            }),
                          ),

                          GestureDetector(
                            onTap: () {
                              context.read<CartProvider>().addToCart(item);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              margin: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Colors.green.shade200,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(Icons.add, size: 20),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            Consumer<CartProvider>(
              builder: (context, value, child) {
                return Container(
                  padding: const EdgeInsets.all(30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Cart items"),
                          Text(
                            value.totalItem.toString(),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Total"),
                          Text(
                            "\$" + value.totalPrice.toString(),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
