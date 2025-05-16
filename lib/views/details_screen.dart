import 'package:flutter/material.dart';
import 'package:orix_food/core/theme/app_colors.dart';
import 'package:orix_food/models/product_model.dart';
import 'package:orix_food/viewmodels/filtered_products_one_one.dart';
import 'package:orix_food/viewmodels/quantity_provider.dart';
import 'package:orix_food/widgets/quantity_border.dart';
import 'package:provider/provider.dart';

import '../widgets/alert_card.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key, required this.product});
  final dynamic product;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final oneProductPerCategory = FilteredProducts.getOneProductPerCategory();

  @override
  Widget build(BuildContext context) {
    return Consumer<QuantityProvider>(
      builder: (context, state, _) {
        return Scaffold(
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(11.0),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      showAutoDismissAlert(context, "Item added to cart!");
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFFF6B00), // Vibrant orange
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: Text('Add to cart', style: TextStyle(fontSize: 16)),
                  ),
                ),
                SizedBox(width: 10),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.shopping_cart, color: Color(0xFFFF6B00)),
                ),
              ],
            ),
          ),
          appBar: AppBar(
            title: Text(
              widget.product.label,
              style: const TextStyle(
                fontFamily: 'Montserrat',
                color: Colors.white,
                fontSize: 18,
                letterSpacing: 3,
              ),
            ),
            centerTitle: true,
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    widget.product.imageUrl,
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.cover,
                    errorBuilder:
                        (context, error, stackTrace) => const Icon(Icons.error),
                  ),
                  const SizedBox(height: 9),
                  Padding(
                    padding: const EdgeInsets.all(11.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.product.label,
                          style: const TextStyle(
                            fontFamily: 'Montserrat',
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 9),
                        Text(
                          '\₦${widget.product.price}',
                          style: const TextStyle(
                            fontFamily: 'Montserrat',
                            color: Colors.white,
                            fontSize: 25,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          widget.product.description,
                          style: const TextStyle(
                            fontFamily: 'Montserrat',
                            color: Colors.grey,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            const Text(
                              'Quantity:',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                            const Spacer(),
                            QuantityBorder(
                              icon: const Icon(Icons.remove),
                              onTap: state.sub,
                            ),
                            const SizedBox(width: 10),
                            Text('${state.value}'),
                            QuantityBorder(
                              icon: const Icon(Icons.add),
                              onTap: state.add,
                            ),
                          ],
                        ),
                        const SizedBox(height: 14),
                        const Text(
                          'Most Popular',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 14),
                        SizedBox(
                          height: 170,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: oneProductPerCategory.length,
                            itemBuilder: (context, index) {
                              final product = oneProductPerCategory[index];
                              return Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (context) =>
                                                DetailsScreen(product: product),
                                      ),
                                    );
                                  },
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    // color: AppColors.cardBackground,
                                    child: SizedBox(
                                      width: 130,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                const BorderRadius.vertical(
                                                  top: Radius.circular(12),
                                                ),
                                            child: Image.network(
                                              product.imageUrl,
                                              width: 130,
                                              height: 100,
                                              fit: BoxFit.cover,
                                              errorBuilder:
                                                  (
                                                    context,
                                                    error,
                                                    stackTrace,
                                                  ) => const Icon(Icons.error),
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsets.all(
                                                8.0,
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    product.name,
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                  Text(
                                                    product.category.name,
                                                    style: const TextStyle(
                                                      color: Colors.grey,
                                                    ),
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
