import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

import '../models/food_category.dart';
import '../models/product_model.dart';

class ProductsViewModel extends ChangeNotifier {
  late final Box<ProductModel> productBox;

  Future<void> init() async {
    productBox = Hive.box<ProductModel>('products');
    await _populateProductsIfNeeded();
  }

  Future<void> _populateProductsIfNeeded() async {
    if (productBox.isEmpty) {
      final products = <ProductModel>[
        ProductModel(
          id: '1',
          name: 'Noodles',
          category: FoodCategory.Noodles,
          imageUrl:
              'https://gidimartng.com/storage/app/public/product/2021-08-26-61278e408547d.png',
          description:
              'Indomie Chicken Flavor "Super pack Size" refers to a \n large portion variant of indomie instant noodles \n specifically flavored with chicken seasoning. ',
          label: 'INDOMIE SUPER PACK',
          price: 14500,
        ),
        ProductModel(
          id: '2',
          name: 'Noodles',
          category: FoodCategory.Noodles,
          imageUrl:
              'https://gidimartng.com/storage/app/public/product/2021-08-26-61278e408547d.png',
          description:
              'Indomie Chicken Flavor "Super pack Size" refers to a \n large portion variant of indomie instant noodles \n specifically flavored with chicken seasoning.',
          label: 'INDOMITABLES 70G',
          price: 9400,
        ),
        ProductModel(
          id: '3',
          name: 'Noodles',
          category: FoodCategory.Noodles,
          imageUrl:
              'https://gidimartng.com/storage/app/public/product/thumbnail/2021-08-28-6129cd452f6d9.png',
          description:
              'Indomie Chicken Flavor "Super pack Size" refers to a \n large portion variant of indomie instant noodles \n specifically flavored with chicken seasoning.',
          label: 'INDOMIE ONIONS 70G',
          price: 10500,
        ),
        ProductModel(
          id: '4',
          name: 'Indomie Noodles',
          category: FoodCategory.Noodles,
          imageUrl:
              'https://housefood.africa/wp-content/uploads/2023/06/Indomie-instant-noodlesregular-chicken.jpg.webp',
          description: 'Double cheese, extra saucy',
          label: 'Indomie Noodles Chichen Flavour Hungryman',
          price: 7.99,
        ),
        ProductModel(
          id: '5',
          name: 'Burger 🍔',
          category: FoodCategory.burgers,
          imageUrl: 'https://img.com/burger.png',
          description: 'Double cheese, extra saucy',
          label: 'INDOMIE SUPER PACK',
          price: 7.99,
        ),
        ProductModel(
          id: '6',
          name: 'Apple 🍎',
          category: FoodCategory.fruits,
          imageUrl: 'https://img.com/apple.png',
          description: 'Fresh and crispy',
          label: 'INDOMIE SUPER PACK',
          price: 1.49,
        ),
        ProductModel(
          id: '7',
          name: 'Apple 🍎',
          category: FoodCategory.fruits,
          imageUrl: 'https://img.com/apple.png',
          description: 'Fresh and crispy',
          label: 'INDOMIE SUPER PACK',
          price: 1.49,
        ),
        ProductModel(
          id: '8',
          name: 'Apple 🍎',
          category: FoodCategory.fruits,
          imageUrl: 'https://img.com/apple.png',
          description: 'Fresh and crispy',
          label: 'INDOMIE SUPER PACK',
          price: 1.49,
        ),
        ProductModel(
          id: '9',
          name: 'Apple 🍎',
          category: FoodCategory.fruits,
          imageUrl: 'https://img.com/apple.png',
          description: 'Fresh and crispy',
          label: 'INDOMIE SUPER PACK',
          price: 1.49,
        ),
        ProductModel(
          id: '10',
          name: 'Apple 🍎',
          category: FoodCategory.fruits,
          imageUrl: 'https://img.com/apple.png',
          description: 'Fresh and crispy',
          label: 'INDOMIE SUPER PACK',
          price: 1.49,
        ),
        // Add more foods...
      ];

      for (final product in products) {
        await productBox.add(product);
      }

      notifyListeners();
    }
  }

  List<ProductModel> get allProducts => productBox.values.toList();
}
