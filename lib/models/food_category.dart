import 'package:hive/hive.dart';

part 'food_category.g.dart';

@HiveType(typeId: 0)
enum FoodCategory {
  @HiveField(0)
  fruits,

  @HiveField(1)
  Rice_Pastas,

  @HiveField(2)
  Sauces_Spreads,

  @HiveField(3)
  Sugar_Sweeteners,

  @HiveField(4)
  Seasonings,

  @HiveField(5)
  Miscellaneous,

  @HiveField(6)
  Flour_Grains,

  @HiveField(7)
  Noodles,

  @HiveField(8)
  Cooking_Oils,
}
