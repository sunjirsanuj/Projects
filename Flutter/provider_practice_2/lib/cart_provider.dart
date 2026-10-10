import 'package:flutter/material.dart';
import 'package:provider_practice_2/item.dart';

class CartProvider extends ChangeNotifier {
  final Map<Item, int> cartItems = {};

  int get totalItem {
    return cartItems.values.fold(0, (sum, quantity) => sum + quantity);
  }

  int get totalPrice {
    return cartItems.entries.fold(
      0,
      (sum, entry) => sum + (entry.key.price * entry.value),
    );
  }

  int quantityOf(Item item) {
    return cartItems[item] ?? 0;
  }

  void addToCart(Item item) {
    cartItems[item] = (cartItems[item] ?? 0) + 1;
    notifyListeners();
  }

  void removeFromCart(Item item) {
    final quantity = cartItems[item] ?? 0;

    if (quantity == 0) return;

    if (quantity == 1) {
      cartItems.remove(item);
    } else {
      cartItems[item] = quantity - 1;
    }

    notifyListeners();
  }

  void clearCart() {
    cartItems.clear();
    notifyListeners();
  }
}
