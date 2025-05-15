import 'package:flutter/material.dart';

import '../core/theme/app_colors.dart';

class QuantityBorder extends StatelessWidget {
  const QuantityBorder({super.key, required this.icon, required this.onTap});
  final Widget icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: AppColors.grey,
            borderRadius: BorderRadius.circular(7),
          ),
          child: icon,
        ),
      ),
    );
  }
}
