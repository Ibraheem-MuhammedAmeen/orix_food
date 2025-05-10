import 'package:flutter/material.dart';
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
    return Scaffold(body: Column(children: [Text('heel')]));
  }
