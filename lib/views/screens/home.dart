/*
import 'package:flutter/material.dart';
import 'package:orix_food/viewmodels/products_viewmodel.dart';
import 'package:provider/provider.dart';

import '../../widgets/produt_cart.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProductsViewModel>().init();
    });
  }

  @override
  Widget build(BuildContext context) {
    final productVM = context.watch<ProductsViewModel>();

    // If productBox hasn't been set yet, show a loading spinner
    if (!productVM.productBox.isOpen) {
      return const Center(child: CircularProgressIndicator());
    }

    final products = productVM.productBox.values.toList();

    return Scaffold(
      appBar: AppBar(title: const Text("🍜 Orix Food Menu")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 4,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            return ProductCard(product: products[index]);
          },
        ),
      ),
    );
  }
}
*/
import 'package:flutter/material.dart';
import 'package:orix_food/core/theme/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    FloatingActionButton(
                      backgroundColor: AppColors.primary_bar,
                      onPressed: () {},
                      child: Icon(Icons.person, color: Colors.black),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Orix Cart Resources',
                              style: TextStyle(
                                color: AppColors.grey,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Delivery available only within Abuja',
                              style: TextStyle(
                                color: AppColors.card,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    FloatingActionButton(
                      backgroundColor: AppColors.primary_bar,
                      onPressed: () {},
                      child: Icon(Icons.window_outlined, color: Colors.black),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
