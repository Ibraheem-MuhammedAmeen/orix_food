import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:orix_food/models/cart_product.dart';
import 'package:uuid/uuid.dart';

class CartProductProvider extends ChangeNotifier {
  var uuid = Uuid();
  late final Box<CartProduct> cartProductBox = Hive.box<CartProduct>(
    'cartProducts',
  );
  Future<void> saveToCart(
    String img,
    String label,
    double amount,
    int quantity,
  ) async {
    final SaveOrders = CartProduct(
      id: uuid.v4(),
      imageUrl: img,
      price: amount,
      label: label,
      quantity: quantity,
    );
    await cartProductBox.add(SaveOrders);
    notifyListeners();
  }
}
