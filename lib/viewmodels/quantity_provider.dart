import 'package:flutter/cupertino.dart';

class QuantityProvider extends ChangeNotifier {
  int value = 1;

  void add() {
    value += 1;
    notifyListeners();
  }

  void sub() {
    if (value > 1) {
      value -= 1;
      notifyListeners();
    }
  }
}
