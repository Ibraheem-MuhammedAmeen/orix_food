import '../models/food_category.dart';
import '../models/product_model.dart';
import 'package:hive/hive.dart';

class FilteredProducts {
  static List<ProductModel> getOneProductPerCategory() {
    late final Box<ProductModel> productBox;
    productBox = Hive.box<ProductModel>('products');
    // Get all products from the Hive box
    final allProducts = productBox.values.toList();

    // A map to hold one product per category
    final Map<FoodCategory, ProductModel> uniqueProducts = {};

    for (final product in allProducts) {
      // Only add if that category isn't already in the map
      uniqueProducts.putIfAbsent(product.category, () => product);
    }

    // Return just one product per category
    return uniqueProducts.values.toList();
  }
}
