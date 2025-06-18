import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:orix_food/models/product_model.dart';

class SearchModelView extends ChangeNotifier {
  late Box<ProductModel> _productBox;
  List<ProductModel> _allProducts = [];
  late List<ProductModel> filteredProducts;

  Future<void> init() async {
    _productBox = Hive.box<ProductModel>('products');
    _allProducts = _productBox.values.toList();
    filteredProducts = _allProducts; // Start with all products visible
    notifyListeners();
  }

  void search(String query) {
    if (query.trim().isEmpty) {
      //filteredProducts = List.from(_allProducts); // Reset to all
      filteredProducts = [];
      notifyListeners();
    } else {
      filteredProducts =
          _allProducts
              .where(
                (product) =>
                    product.name.toLowerCase().contains(query.toLowerCase()),
              )
              .toList();
      notifyListeners();
    }
  }
}
