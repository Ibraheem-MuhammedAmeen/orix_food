import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:orix_food/models/food_category.dart';
import 'package:orix_food/views/dataList_Screen.dart';

import '../core/theme/app_colors.dart';
import '../models/product_model.dart';

class CategoryCart extends StatelessWidget {
  const CategoryCart({
    super.key,
    required this.name,
    required this.img,
    required this.category,
  });
  final String name;
  final String img;
  final FoodCategory category;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final box = Hive.box<ProductModel>('products');
        final selectedProducts =
            box.values
                .where((product) => product.category == category)
                .toList();

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DatalistScreen(products: selectedProducts),
          ),
        );
      },
      child: Container(
        height: 125,
        width: 123,
        decoration: BoxDecoration(
          color: AppColors.dark_grey,
          borderRadius: BorderRadius.circular(10), // <- this makes it ROUND 🌀
        ),
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(img, width: 50, height: 50),
              SizedBox(height: 10),
              Text(
                name,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: AppColors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
