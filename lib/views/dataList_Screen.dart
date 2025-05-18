import 'package:flutter/material.dart';
import 'package:orix_food/models/product_model.dart';
import 'package:orix_food/viewmodels/cart_product_provider.dart';
import 'package:provider/provider.dart';

import '../widgets/produt_cart.dart';

class DatalistScreen extends StatefulWidget {
  const DatalistScreen({super.key, required this.products});

  final List<ProductModel> products;

  @override
  State<DatalistScreen> createState() => _DatalistScreenState();
}

class _DatalistScreenState extends State<DatalistScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartProductProvider>(
      builder: (context, state, _) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              widget.products.isNotEmpty
                  ? widget.products.first.category.name.replaceAll('_', ' ')
                  : 'Category',
              style: TextStyle(
                fontFamily: 'Montserrat',
                color: Colors.white,
                fontSize: 18,
                letterSpacing: 3,
              ),
            ),
            actions: [
              SizedBox(
                width: 40,
                height: 30,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Icon(Icons.shopping_cart_outlined),
                    Positioned(
                      bottom: 20,
                      right: 10,
                      child: Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          child: Text(
                            '${state.noAddedToCart}',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ), // or any other dynamic title
          body:
              widget.products.isEmpty
                  ? Center(child: Text('No products found for this category'))
                  : GridView.builder(
                    itemCount: widget.products.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 3 / 4,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                    itemBuilder: (context, index) {
                      return ProductCard(product: widget.products[index]);
                    },
                  ),
        );
      },
    );
  }
}
