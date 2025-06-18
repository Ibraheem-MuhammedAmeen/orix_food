import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:orix_food/models/cart_product.dart';
import 'package:orix_food/models/product_model.dart';
import 'package:uuid/uuid.dart';

class CartProductProvider extends ChangeNotifier {
  var uuid = Uuid();
  late final Box<CartProduct> cartBox = Hive.box<CartProduct>('cartProducts');

  /// Returns current cart count
  int get noAddedToCart => cartBox.length;

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
    await cartBox.add(SaveOrders);
    notifyListeners();
  }

  Future<void> deleteCart(String id) async {
    final keyToDelete = cartBox.keys.firstWhere(
      (key) => cartBox.get(key)?.id == id,
      orElse: () => null,
    );

    if (keyToDelete != null) {
      await cartBox.delete(keyToDelete);
      notifyListeners();
    }
  }
}
