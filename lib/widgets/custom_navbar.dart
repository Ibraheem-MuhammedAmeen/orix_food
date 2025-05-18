import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../core/theme/app_colors.dart';

class CustomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, left: 34, right: 34),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(Ionicons.home_outline, "Home", 0),
          Spacer(),
          _buildNavItem(CupertinoIcons.smallcircle_circle, "Category", 1),
          Spacer(),
          _buildNavItem(CupertinoIcons.cart, "Cart", 2),
          Spacer(),
          _buildNavItem(Icons.list_alt, "Order", 3),
          Spacer(),
          _buildNavItem(Icons.person_add_alt_outlined, "Menu", 4),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    bool isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () => onItemTapped(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: EdgeInsets.symmetric(
          horizontal: isSelected ? 18 : 0,
          vertical: 10,
        ),
        decoration:
            isSelected
                ? BoxDecoration(
                  color: AppColors.yellow,
                  borderRadius: BorderRadius.circular(20),
                )
                : null,
        child: Row(
          children: [
            Icon(icon, color: Colors.white, size: 25),
            if (isSelected)
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  label,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
