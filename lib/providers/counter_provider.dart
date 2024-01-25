import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CounterProvider extends ChangeNotifier {
  int counter = 0;

  CounterProvider() {
    getCounter();
  }

  Future<void> increment() async {
    final prefs = await SharedPreferences.getInstance();

      counter++;
      notifyListeners();

    prefs.setInt('counter', counter);
  }

  Future<void> getCounter() async {
    final prefs = await SharedPreferences.getInstance();

      counter = prefs.getInt('counter') ?? 0;
      notifyListeners();
  }

  Future<void> decrement() async {
    final prefs = await SharedPreferences.getInstance();

    if (counter > 0) {
      counter --;
      notifyListeners();

      prefs.setInt('counter', counter);
    }
  }

  Future<void> zeroing() async {
    final prefs = await SharedPreferences.getInstance();
    
    if (counter != 0) {
      counter = 0;
      notifyListeners();

      prefs.setInt('counter', counter);
    }
  }

}