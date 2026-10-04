import 'package:flutter/foundation.dart';
import 'package:shushi_restaurant_app/models/food.dart';

class Shop extends ChangeNotifier{
  // food menu
  final List<Food> _foodMenu = [
    // fish egg
    Food(
      name: "Fish Eggs",
      price: "30.0",
      imagePath: "lib/images/fish-eggs.png",
      rating: "5.9",
    ),

    // salmon sushi
    Food(
      name: "Salmon Sushi",
      price: "15.5",
      imagePath: "lib/images/salmon_sushi.png",
      rating: "4.6",
    ),

    // tuna
    Food(
      name: "Tuna",
      price: "25.0",
      imagePath: "lib/images/sashimi.png",
      rating: "4.9",
    ),
  ];

  // customer cart
  List<Food> _cart = [];

  // getter mathods
  List<Food> get foodMenu => _foodMenu;
  List<Food> get cart => _cart;

  // add to cart
  void addToCart(Food foodItem, int quantity){
    for (int i=0; i< quantity; i++){
      _cart.add(foodItem);
    }
    notifyListeners();
  }

  // remove from cart
  void removeFromCart(Food food){
    _cart.remove(food);
    notifyListeners();
  }
}