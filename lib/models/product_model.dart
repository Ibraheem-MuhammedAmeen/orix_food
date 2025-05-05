import 'package:hive/hive.dart';
import 'food_category.dart';

part 'product_model.g.dart';

@HiveType(typeId: 1)
class ProductModel extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String name;

  @HiveField(2)
  FoodCategory category;

  @HiveField(3)
  String imageUrl;

  @HiveField(4)
  String label;

  @HiveField(5)
  String description;

  @HiveField(6)
  double price;

  ProductModel({
    required this.id,
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.description,
    required this.price,
    required this.label,
  });
}
