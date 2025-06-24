import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:orix_food/models/cart_product.dart';

class TotalAmount extends ChangeNotifier {
  double _subTotal = 0;

  double get subTotal => _subTotal;

  Future<void> calculateTotal() async {
    final cartBox = Hive.box<CartProduct>('cartProducts');
    final allProducts = cartBox.values.toList();

    double total = 0;

    for (final product in allProducts) {
      total += product.price * product.quantity;
    }

    _subTotal = total;
    notifyListeners();
  }
}
