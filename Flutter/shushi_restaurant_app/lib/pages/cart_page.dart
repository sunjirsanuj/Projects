import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shushi_restaurant_app/models/food.dart';
import 'package:shushi_restaurant_app/models/shop.dart';
import 'package:shushi_restaurant_app/themes/colors.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  // remove from cart
  void removeFromCart(){}

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          title: const Text("My Cart"),
          backgroundColor: primaryColor,
        ),
        body: ListView.builder(
          itemCount: value.cart.length,
          itemBuilder: 
        (context, index){
          // get food from cart
          final Food food = value.cart[index];

          // get food name
          final String foodName = food.name;

          // get food price
          final String foodPrice = food.price;

          // return list tile
          return ListTile(
            title: Text(foodName),
            subtitle: Text(foodPrice),
            trailing: IconButton(onPressed: removeFromCart, icon: Icon(Icons.delete)),
          );
        }),
      )
      );
  }
}