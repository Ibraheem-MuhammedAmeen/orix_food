// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_category.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FoodCategoryAdapter extends TypeAdapter<FoodCategory> {
  @override
  final int typeId = 0;

  @override
  FoodCategory read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return FoodCategory.fruits;
      case 1:
        return FoodCategory.Rice_Pastas;
      case 2:
        return FoodCategory.Sauces_Spreads;
      case 3:
        return FoodCategory.Sugar_Sweeteners;
      case 4:
        return FoodCategory.Seasonings;
      case 5:
        return FoodCategory.Miscellaneous;
      case 6:
        return FoodCategory.Flour_Grains;
      case 7:
        return FoodCategory.Noodles;
      case 8:
        return FoodCategory.Cooking_Oils;
      default:
        return FoodCategory.fruits;
    }
  }

  @override
  void write(BinaryWriter writer, FoodCategory obj) {
    switch (obj) {
      case FoodCategory.fruits:
        writer.writeByte(0);
        break;
      case FoodCategory.Rice_Pastas:
        writer.writeByte(1);
        break;
      case FoodCategory.Sauces_Spreads:
        writer.writeByte(2);
        break;
      case FoodCategory.Sugar_Sweeteners:
        writer.writeByte(3);
        break;
      case FoodCategory.Seasonings:
        writer.writeByte(4);
        break;
      case FoodCategory.Miscellaneous:
        writer.writeByte(5);
        break;
      case FoodCategory.Flour_Grains:
        writer.writeByte(6);
        break;
      case FoodCategory.Noodles:
        writer.writeByte(7);
        break;
      case FoodCategory.Cooking_Oils:
        writer.writeByte(8);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FoodCategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
