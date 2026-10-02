import 'package:food_app_clone/models/food_model.dart';

class FoodData {
  static final List<FoodModel> foods = [
    FoodModel(name: "Uramaki Sushi", image: "assets/images/sushi.jpg", price: 250, rating: "4.5k",),
    FoodModel(name: "Beef Burger", image: "assets/images/burger.jpg", price: 220, rating: "4.5k",),
    FoodModel(name: "Chicken Wing", image: "assets/images/chicken.jpg", price: 180, rating: "4.2k",),
    FoodModel(name: "Pepperoni Pizza", image: "assets/images/pizza.jpg", price: 320, rating: "4.8k",),
  ];
}