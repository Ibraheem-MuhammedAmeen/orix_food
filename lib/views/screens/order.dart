import 'package:flutter/material.dart';
import 'package:orix_food/core/theme/app_colors.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'My Order',
          style: TextStyle(
            fontFamily: 'Montserrat',
            color: Colors.white,
            fontSize: 18,
            letterSpacing: 3,
          ),
        ),
        backgroundColor: AppColors.yellow,
      ),
    );
  }
}
