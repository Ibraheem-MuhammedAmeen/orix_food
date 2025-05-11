import 'package:flutter/material.dart';
import 'package:orix_food/core/theme/app_colors.dart';
import 'package:orix_food/models/product_model.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key, required this.product});
  final dynamic product;
  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.product.label,
          style: TextStyle(
            fontFamily: 'Montserrat',
            color: Colors.white,
            fontSize: 18,
            letterSpacing: 3,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Image.network(
            widget.product.imageUrl,
            width: double.infinity,
            height: 300,
            fit: BoxFit.cover,
            errorBuilder:
                (context, error, stackTrace) => const Icon(Icons.error),
          ),
          SizedBox(height: 9),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(11.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      widget.product.label,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        //letterSpacing: 3,
                      ),
                    ),
                    SizedBox(height: 9),
                    Text(
                      '\₦${widget.product.price.toString()}',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontSize: 15,
                        //letterSpacing: 3,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      widget.product.description,
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.grey,
                        fontSize: 11,
                        //letterSpacing: 3,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
