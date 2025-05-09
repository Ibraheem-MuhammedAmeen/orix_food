import 'package:flutter/material.dart';

import '../core/theme/app_colors.dart';

class CategoryCart extends StatelessWidget {
  const CategoryCart({super.key, required this.name, required this.img});
  final String name;
  final String img;
  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
