import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:orix_food/viewmodels/QuantityController.dart';
import 'package:orix_food/viewmodels/cart_product_provider.dart';
import 'package:orix_food/viewmodels/total_amount.dart';
import 'package:orix_food/widgets/add_sub_widget.dart';
import 'package:provider/provider.dart';

import '../../core/theme/app_colors.dart';

class ToCart extends StatefulWidget {
  const ToCart({super.key});

  @override
  State<ToCart> createState() => _ToCartState();
}

class _ToCartState extends State<ToCart> {
  void initState() {
    super.initState();
    Future.microtask(
      () => Provider.of<TotalAmount>(context, listen: false).calculateTotal(),
    );
  }

  @override
  Widget build(BuildContext context) {
    String truncateText(String text, {int maxLength = 15}) {
      if (text.length <= maxLength) return text;
      return '${text.substring(0, maxLength)}...';
    }

    String formatWithCommas(double value) {
      final formatter = NumberFormat('#,##0.00'); // Keeps 2 decimal places
      return formatter.format(value);
    }

    final cartVM = context.watch<CartProductProvider>();

    //final products = productVM.productBox.values.toList();
    return Consumer3<CartProductProvider, QuantityController, TotalAmount>(
      builder: (context, state, quantityState, amountState, _) {
        final cartProducts = state.cartBox.values.toList();
        return Scaffold(
          bottomNavigationBar: SizedBox(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 13,
                    bottom: 10,
                    right: 8,
                    left: 8,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Subtotal :',
                        style: TextStyle(
                          fontFamily: 'Montserrat',

                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          wordSpacing: 0.5,
                        ),
                      ),
                      Text(
                        '\₦${formatWithCommas(amountState.subTotal)}',
                        style: TextStyle(
                          fontFamily: 'Montserrat',

                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          wordSpacing: 0.5,
                        ),
                      ),
                      SizedBox(width: 20),
                      Container(
                        height: 40,
                        width: 100,
                        decoration: BoxDecoration(
                          color: AppColors.error,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            'Check out',
                            style: TextStyle(
                              fontFamily: 'Montserrat',

                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              wordSpacing: 0.5,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
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
            backgroundColor: AppColors.error,
          ),
          body: SafeArea(
            child: Padding(
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
                        state.deleteCart(cardProduct.id, context);
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
                                    '${truncateText(cardProduct.label)}',
                                    //cardProduct.label,
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
                                  SizedBox(
                                    width: 150,
                                    child: Row(
                                      children: [
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
                                        Spacer(),
                                        AddSubWidget(
                                          icon: Icons.add,
                                          onTap: () {
                                            quantityState.add(
                                              cardProduct.label,
                                              context,
                                            );
                                          },
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          '${quantityState.getQuantity(cardProduct.label)}',
                                          style: TextStyle(color: Colors.black),
                                        ),

                                        SizedBox(width: 5),
                                        AddSubWidget(
                                          icon: Icons.remove,
                                          onTap: () {
                                            quantityState.sub(
                                              cardProduct.label,
                                              context,
                                            );
                                          },
                                        ),
                                      ],
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
          ),
        );
      },
    );
  }
}
