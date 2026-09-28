import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier{
  final List _shopItems = [
    ["Avocado", "4.00", "lib/images/avocado.png", Colors.green],
    ["Banana", "2.50", "lib/images/banana.png", Colors.yellow],
    ["Chicken", "12.08", "lib/images/chicken-leg.png", Colors.brown],
    ["Water", "1.00", "lib/images/plastic-bottle.png", Colors.blue],
  ];

  get shopItems => _shopItems;
}