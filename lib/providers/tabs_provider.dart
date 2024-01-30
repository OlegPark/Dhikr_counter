

import 'package:flutter/material.dart';

class TabsProvider extends ChangeNotifier {
  bool isActive = true;

  void toggle() {
    isActive = !isActive;

    notifyListeners();
  }

}