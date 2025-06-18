import 'package:flutter/material.dart';
import 'package:orix_food/viewmodels/cart_product_provider.dart';
import 'package:provider/provider.dart';

import '../../core/theme/app_colors.dart';

class ToCart extends StatelessWidget {
  const ToCart({super.key});

  @override
  Widget build(BuildContext context) {
    final cartVM = context.watch<CartProductProvider>();

    // If productBox hasn't been set yet, show a loading spinner
    /*if (!cartVM.productBox.isOpen) {
      return const Center(child: CircularProgressIndicator());
    }*/

    //final products = productVM.productBox.values.toList();
    return Consumer<CartProductProvider>(
      builder: (context, state, _) {
        final cartProducts = state.cartBox.values.toList();
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'My Cart',
              style: TextStyle(
                fontFamily: 'Montserrat',
                color: Colors.white,
                fontSize: 18,
                letterSpacing: 3,
              ),
            ),
            backgroundColor: AppColors.yellow,
          ),
          body: Padding(
            padding: const EdgeInsets.only(
              top: 13,
              bottom: 10,
              right: 8,
              left: 8,
            ),
            child: ListView.builder(
              itemBuilder: (context, index) {
                final cardProduct = cartProducts[index];
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Dismissible(
                    onDismissed: (direction) {
                      state.deleteCart(cardProduct.id);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            '${cardProduct.label} removed from cart',
                          ),
                        ),
                      );
                    },
                    key: Key('$cardProduct.id'),
                    child: Card(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Image.network(
                                  cardProduct.imageUrl,
                                  height: 70,
                                  width: 150,
                                  fit: BoxFit.cover,
                                ),
                              ],
                            ),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  cardProduct.label,
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: AppColors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    wordSpacing: 0.5,
                                  ),
                                ),
                                Text(
                                  'L, Black',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: AppColors.grey,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    wordSpacing: 0.5,
                                  ),
                                ),
                                Text(
                                  '\₦${cardProduct.price}',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: Colors.red,
                                    fontSize: 14.5,
                                    fontWeight: FontWeight.bold,
                                    wordSpacing: 0.5,
                                  ),
                                ),
                                Row(children: []),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
              itemCount: cartProducts.length,
            ),
          ),
        );
      },
    );
  }
}
