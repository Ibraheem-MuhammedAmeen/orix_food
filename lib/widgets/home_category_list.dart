import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:orix_food/models/food_category.dart';
import 'package:orix_food/views/dataList_Screen.dart';

import '../core/theme/app_colors.dart';
import '../models/product_model.dart';

class HomeCategoryListCart extends StatelessWidget {
  const HomeCategoryListCart({
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
      child: Column(
        spacing: 12,
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              color: AppColors.dark_grey,
              borderRadius: BorderRadius.circular(
                30,
              ), // <- this makes it ROUND 🌀
            ),
            child: Padding(
              padding: const EdgeInsets.all(11.0),
              child: Image.asset(img, width: 50, height: 50),
            ),
          ),

          Text(
            name,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 11,
              fontWeight: FontWeight.w600,
              //color: AppColors.black,
            ),
          ),
        ],
      ),
    );
  }
}
