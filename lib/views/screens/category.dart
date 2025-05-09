import 'package:flutter/material.dart';
import 'package:orix_food/core/theme/app_colors.dart';
import 'package:orix_food/widgets/categoryCard_widget.dart';

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
        backgroundColor: AppColors.yellow,
        title: Text(
          'C a t e g o r y',
          style: TextStyle(fontFamily: 'Montserrat', fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 6, left: 6, top: 19),
        child: Column(
          children: [
            Row(
              children: [
                CategoryCart(
                  name: 'Rice & Pastas',
                  img: 'assets/images/rice_pasta.png',
                ),
                SizedBox(width: 15),
                CategoryCart(
                  name: 'Sauces & Spreads',
                  img: 'assets/images/sauces_spreads.png',
                ),
                SizedBox(width: 15),
                CategoryCart(
                  name: 'sugar & Sweeteners',
                  img: 'assets/images/Sugar_Sweeteners.png',
                ),
              ],
            ),
            SizedBox(height: 25),
            Row(
              children: [
                CategoryCart(
                  name: 'Seasonings',
                  img: 'assets/images/Seasonings.png',
                ),
                SizedBox(width: 15),
                CategoryCart(
                  name: 'Miscellaneous',
                  img: 'assets/images/miscellaneous.png',
                ),
                SizedBox(width: 15),
                CategoryCart(
                  name: 'Flour_Grains',
                  img: 'assets/images/flur_grains.png',
                ),
              ],
            ),
            SizedBox(height: 25),
            Row(
              children: [
                CategoryCart(
                  name: 'Cooking_Oils',
                  img: 'assets/images/cooking_oil.png',
                ),
                SizedBox(width: 15),
                CategoryCart(name: 'Fruits', img: 'assets/images/fruits.png'),
                SizedBox(width: 15),
                CategoryCart(name: 'Junks', img: 'assets/images/junks.png'),
              ],
            ),
            SizedBox(height: 25),
            Row(
              children: [
                CategoryCart(name: 'Noodles', img: 'assets/images/noodle.png'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
