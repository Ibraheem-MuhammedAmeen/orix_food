import 'package:hive/hive.dart';
part 'cart_product.g.dart';

@HiveType(typeId: 2)
class CartProduct extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String imageUrl;

  @HiveField(2)
  String label;

  @HiveField(3)
  int quantity;

  @HiveField(4)
  double price;

  CartProduct({
    required this.id,
    required this.imageUrl,
    required this.price,
    required this.label,
    required this.quantity,
  });
}
