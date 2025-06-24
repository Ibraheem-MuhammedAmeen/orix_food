import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:orix_food/core/theme/app_colors.dart';
import 'package:orix_food/models/food_category.dart';
import 'package:orix_food/widgets/categoryCard_widget.dart';
import 'package:provider/provider.dart';

import '../../models/product_model.dart';
import '../../viewmodels/products_viewmodel.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary_bar,
        title: Text(
          'C a t e g o r y',
          style: TextStyle(fontFamily: 'Montserrat', fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 6, left: 6, top: 19),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 25,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 15,
              children: [
                CategoryCart(
                  name: 'Rice & Pastas',
                  img: 'assets/images/rice_pasta.png',
                  category: FoodCategory.Rice_Pastas,
                ),
                CategoryCart(
                  name: 'Sauces & Spreads',
                  img: 'assets/images/sauces_spreads.png',
                  category: FoodCategory.Sauces_Spreads,
                ),
                CategoryCart(
                  name: 'sugar & Sweeteners',
                  img: 'assets/images/Sugar_Sweeteners.png',
                  category: FoodCategory.Sugar_Sweeteners,
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 15,
              children: [
                CategoryCart(
                  name: 'Seasonings',
                  img: 'assets/images/Seasonings.png',
                  category: FoodCategory.Seasonings,
                ),
                CategoryCart(
                  name: 'Miscellaneous',
                  img: 'assets/images/miscellaneous.png',
                  category: FoodCategory.Miscellaneous,
                ),
                CategoryCart(
                  name: 'Flour_Grains',
                  img: 'assets/images/flur_grains.png',
                  category: FoodCategory.Flour_Grains,
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 15,
              children: [
                CategoryCart(
                  name: 'Cooking_Oils',
                  img: 'assets/images/cooking_oil.png',
                  category: FoodCategory.Cooking_Oils,
                ),
                CategoryCart(
                  name: 'Fruits',
                  img: 'assets/images/fruits.png',
                  category: FoodCategory.fruits,
                ),
                CategoryCart(
                  name: 'Junks',
                  img: 'assets/images/junks.png',
                  category: FoodCategory.fruits,
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                spacing: 15,
                children: [
                  CategoryCart(
                    name: 'Noodles',
                    img: 'assets/images/noodle.png',
                    category: FoodCategory.Noodles,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
