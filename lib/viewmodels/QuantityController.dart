import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:orix_food/models/cart_product.dart';
import 'package:orix_food/viewmodels/total_amount.dart';
import 'package:provider/provider.dart';

class QuantityController extends ChangeNotifier {
  final Map<String, int> _quantities = {};

  int getQuantity(String itemName) => _quantities[itemName] ?? 1;
  late Box<CartProduct> addQuantity;

  void add(String itemName, BuildContext context) {
    final cartBox = Hive.box<CartProduct>('cartProducts');
    final products = cartBox.values.toList();

    for (var product in products) {
      if (product.label == itemName) {
        product.quantity += 1;
        product.save(); // save update

        //Recalculate subtotal right after update
        Provider.of<TotalAmount>(context, listen: false).calculateTotal();
        _quantities[itemName] = getQuantity(itemName) + 1;

        notifyListeners();
        break;
      }
    }
  }

  void sub(String itemName, BuildContext context) {
    final cartBox = Hive.box<CartProduct>('cartProducts');
    final products = cartBox.values.toList();

    for (var product in products) {
      if (product.label == itemName) {
        product.quantity -= 1;
        product.save(); // save update

        //Recalculate subtotal right after update
        Provider.of<TotalAmount>(context, listen: false).calculateTotal();
        _quantities[itemName] = getQuantity(itemName) - 1;

        notifyListeners();
        break;
      }
    }
  }
}
