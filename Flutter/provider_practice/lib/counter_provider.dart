import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int count = 0;
  int step = 1;

  void increment() {
    count += step;
    notifyListeners();
  }

  void decrement() {
    count -= step;
    notifyListeners();
  }

  void reset() {
    count = 0;
    notifyListeners();
  }
}
