import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

import '../models/food_category.dart';
import '../models/product_model.dart';

class ProductsViewModel extends ChangeNotifier {
  late final Box<ProductModel> productBox;

  Future<void> init() async {
    productBox = Hive.box<ProductModel>('products');
    await _populateProductsIfNeeded();
  }

  Future<void> _populateProductsIfNeeded() async {
    if (productBox.isEmpty) {
      final products = <ProductModel>[
        ProductModel(
          id: '1',
          name: 'Noodles',
          category: FoodCategory.Noodles,
          imageUrl:
              'https://gidimartng.com/storage/app/public/product/2021-08-26-61278e408547d.png',
          description:
              'Indomie Chicken Flavor "Super pack Size" refers to a \n large portion variant of indomie instant noodles \n specifically flavored with chicken seasoning. ',
          label: 'INDOMIE SUPER PACK',
          price: 14500,
        ),
        ProductModel(
          id: '2',
          name: 'Noodles',
          category: FoodCategory.Noodles,
          imageUrl:
              'https://gidimartng.com/storage/app/public/product/2021-08-26-61278e408547d.png',
          description:
              'Indomie Chicken Flavor "Super pack Size" refers to a \n large portion variant of indomie instant noodles \n specifically flavored with chicken seasoning.',
          label: 'INDOMITABLES 70G',
          price: 9400,
        ),
        ProductModel(
          id: '3',
          name: 'Noodles',
          category: FoodCategory.Noodles,
          imageUrl:
              'https://gidimartng.com/storage/app/public/product/thumbnail/2021-08-28-6129cd452f6d9.png',
          description:
              'Indomie Chicken Flavor "Super pack Size" refers to a \n large portion variant of indomie instant noodles \n specifically flavored with chicken seasoning.',
          label: 'INDOMIE ONIONS 70G',
          price: 10500,
        ),
        ProductModel(
          id: '4',
          name: 'Indomie Noodles',
          category: FoodCategory.Noodles,
          imageUrl:
              'https://housefood.africa/wp-content/uploads/2023/06/Indomie-instant-noodlesregular-chicken.jpg.webp',
          description: 'Double cheese, extra saucy',
          label: 'Indomie Noodles Chichen Flavour Hungryman',
          price: 7.99,
        ),
        ProductModel(
          id: '5',
          name: 'GERAWA RICE 50KG',
          category: FoodCategory.Rice_Pastas,
          imageUrl: 'https://housefood.africa/wp-content/uploads/2022/05/Gerawa-rice.png.webp',
          description: 'GERAWA PREMIUM PARBOILED RICE 50KG',
          label: 'GERAWA RICE 50KG',
          price: 83000,
        ),
        ProductModel(
          id: '6',
          name: 'GOLDEN PENNY SPAGHETTI',
          category: FoodCategory.Rice_Pastas,
          imageUrl: 'https://img.com/apple.png',
          description: 'GOLDEN PENNY SPAGHETTI 20 pieces in a pack ',
          label: 'GOLDEN PENNY SPAGHETTI',
          price: 19700,
        ),
        ProductModel(
          id: '7',
          name: 'BABA RICE 50KG',
          category: FoodCategory.Rice_Pastas,
          imageUrl: 'https://img.com/apple.png',
          description: 'BABA RICE 50KG',
          label: 'BABA RICE 50KG',
          price: 99000,
        ),
        ProductModel(
          id: '8',
          name: 'MAI KWABO ',
          category: FoodCategory.Rice_Pastas,
          imageUrl: 'https://img.com/apple.png',
          description: 'MAI KWABO SPAGHETTI[20 IN A PACK',
          label: 'MAI KWABO',
          price: 18000,
        ),
        ProductModel(
          id: '9',
          name: 'Golden penny pasta',
          category: FoodCategory.Rice_Pastas,
          imageUrl: 'https://img.com/apple.png',
          description: 'Fresh and crispy',
          label: 'Golden penny pasta',
          price: 19900,
        ),
        ProductModel(
          id: '10',
          name: 'OPTIMUM RICE 50KG',
          category: FoodCategory.Rice_Pastas,
          imageUrl: 'https://housefood.africa/wp-content/uploads/2022/11/Optimum-Parboiled-Rice.jpg.webp',
          description: 'Fresh and crispy',
          label: 'OPTIMUM RICE 50KG',
          price: 90000,
        ),
        ProductModel(
          id: '11',
          name: 'BIG BULL RICE 50KG',
          category: FoodCategory.Rice_Pastas,
          imageUrl: 'https://ng.jumia.is/unsafe/fit-in/300x300/filters:fill(white)/product/27/3810993/1.jpg?1084',
          description: 'Fresh and crispy',
          label: 'BIG BULL RICE 50KG',
          price: 84500,
        ),
        ProductModel(
          id: '12',
          name: 'BIG BULL GOLD 10KG',
          category: FoodCategory.Rice_Pastas,
          imageUrl: 'https://ng.jumia.is/unsafe/fit-in/300x300/filters:fill(white)/product/27/3810993/1.jpg?1084',
          description: 'Fresh and crispy',
          label: 'BIG BULL GOLD 10KG',
          price: 25400,
        ),
        ProductModel(
          id: '13',
          name: 'BIG BULL Rice 5kg',
          category: FoodCategory.Rice_Pastas,
          imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTEe7TFXjq-opM4IZxcgwYyQ8zhXmVEx6N31WytmsxYV8JLjhz4Q4P1w-A&usqp=CAE&s',
          description: 'BIG BULL Rice 5kg',
          label: 'BIG BULL Rice 5kg',
          price: 13450,
        ),
        ProductModel(
          id: '14',
          name: 'GOLDEN PENNY SUGAR',
          category: FoodCategory.Sugar_Sweeteners,
          imageUrl: 'https://i0.wp.com/nextcashandcarry.com.ng/wp-content/uploads/2022/04/Golden-Penny-500g-sugar-728x800-1-1.jpg?w=500&ssl=1',
          description: 'Golden Penny sugar is vitamin A Fortified for home \n consumption from premium brand. An energy given \n food that can be enjoy with pap, beverages, cere.',,
          label: 'GOLDEN PENNY SUGAR 50KG',
          price: 83000,
        ),
        ProductModel(
          id: '15',
          name: 'GOLDEN PENNY SUGAR',
          category: FoodCategory.Sugar_Sweeteners,
          imageUrl: 'https://img.com/apple.png',
          description: 'Golden Penny sugar is vitamin A Fortified for home \n consumption from premium brand. An energy given \n food that can be enjoy with pap, beverages, cere.',
          label: 'GOLDEN PENNY SUGAR 500G',
          price: 20000,
        ),
        ProductModel(
          id: '16',
          name: 'GOLDEN PENNY CUBE',
          category: FoodCategory.Sugar_Sweeteners,
          imageUrl: 'https://i0.wp.com/nextcashandcarry.com.ng/wp-content/uploads/2022/04/download-94-1.jpg?w=225&ssl=1',
          description: 'Golden Penny sugar is vitamin A Fortified for home \n consumption from premium brand. An energy given \n food that can be enjoy with pap, beverages, cere.',
          label: 'GOLDEN PENNY CUBE SUGAR 500G [50 BOXS IN A \n CARTON]',
          price: 53000,
        ),
        ProductModel(
          id: '17',
          name: 'GOLDEN PENNY SUGAR',
          category: FoodCategory.Sugar_Sweeteners,
          imageUrl: 'https://www.pricepally.com/_next/image?url=https%3A%2F%2Fpp-new-node-medusa-prod-bucket.s3.us-east-1.amazonaws.com%2F8f1EW1kfdr7wpW325wH9fV1Yub2Yu0CcNzdPo5gi-1718209641760.jpg&w=3840&q=75',
          description:
              'Golden Penny sugar is vitamin A Fortified for home \n consumption from premium brand. An energy given \n food that can be enjoy with pap, beverages, cere.',
          label: 'GOLDEN PENNY SUGAR 1KG',
          price: 19000,
        ),
        ProductModel(
          id: '18',
          name: 'BAMA MAYONNAISE',
          category: FoodCategory.Sauces_Spreads,
          imageUrl: 'https://uzoebo.com/images/uzoebo/1703167221_bama.jpg',
          description:
          'BAMA MAYONNAISE SACHETS [15 ML] X [100]',
          label: 'BAMA MAYONNAISE SACHETS [15 ML]',
          price: 8000,
        ),
        ProductModel(
          id: '19',
          name: 'BAMA MAYONNAISE',
          category: FoodCategory.Sauces_Spreads,
          imageUrl: 'https://www.pricepally.com/_next/image?url=https%3A%2F%2Fpp-new-node-medusa-prod-bucket.s3.us-east-1.amazonaws.com%2FBama%20Mayonnaise%20(226ml)-1718369172631.jpg&w=3840&q=75',
          description:
          'BAMA MAYONNAISE SACHETS [226 ML] X [12 IN A CARTON]',
          label: 'BAMA MAYONNAISE SACHETS [226 ML]',
          price: 17000,
        ),
        ProductModel(
          id: '20',
          name: 'CHOCHO SPREAD',
          category: FoodCategory.Sauces_Spreads,
          imageUrl: 'https://www-konga-com-res.cloudinary.com/w_500,f_auto,fl_lossy,dpr_auto,q_auto/media/catalog/product/B/G/170352_1684509190.jpg',
          description:
          'GOLDEN PENNY CHOCHO SPREAD ',
          label: 'CHOCHO SPREAD',
          price: 16000,
        ),
        ProductModel(
          id: '21',
          name: 'GINO PEPPER & ONION',
          category: FoodCategory.Seasonings,
          imageUrl: 'https://funmistores-public.s3.eu-north-1.amazonaws.com/products/C6PksDfRQlAwNT4.jpg',
          description:
          'GINO PEPPER & ONION',
          label: 'GINO PEPPER & ONION',
          price: 8500,
        ),
        ProductModel(
          id: '22',
          name: 'Gino Party Jollof',
          category: FoodCategory.Seasonings,
          imageUrl: 'https://ng.jumia.is/unsafe/fit-in/300x300/filters:fill(white)/product/05/5275904/1.jpg?5123',
          description:
          'Gino Party Jollof Sachet 50g X50',
          label: 'Gino Party Jollof Sachet ',
          price: 9500,
        ),
        ProductModel(
          id: '23',
          name: 'GINO CURRY POWDER',
          category: FoodCategory.Seasonings,
          imageUrl: 'https://foodieng.com/wp-content/uploads/2022/07/gino-curry-powder-20190809140535.jpg.jpg',
          description:
          'GINO CURRY POWDER 200 SACHETS X 3KG[BOX]',
          label: 'GINO CURRY POWDER SACHETS',
          price: 9000,
        ),
        ProductModel(
          id: '24',
          name: 'GINO THYME SACHET',
          category: FoodCategory.Seasonings,
          imageUrl: 'https://freshtodommot.com/cdn/shop/products/thyme-bag-gino-5g_405c1f0f-2436-478f-bec5-5e9f764be885_216x.jpg?v=1674569379',
          description:
          'GINO THYME SACHET 200 X 35G [BOX]',
          label: 'GINO THYME SACHET',
          price: 9500,
        ),
        ProductModel(
          id: '25',
          name: 'TOMATOS JOS MIX',
          category: FoodCategory.Seasonings,
          imageUrl: 'https://24hoursmarket.com/wp-content/uploads/2024/12/1735076140507.jpg',
          description:
          'TOMATOS JOS MIX 5O SACHET IN A CARTON',
          label: 'TOMATOS JOS MIX',
          price: 6900,
        ),
        ProductModel(
          id: '26',
          name: 'JUMBO TOMATO ',
          category: FoodCategory.Seasonings,
          imageUrl: 'https://i0.wp.com/waziri.ng/wp-content/uploads/2023/12/Jumbo-Tomato-Mix-Satchet-60g-x-50.jpg?w=500&ssl=1',
          description:
          'JUMBO TOMATO PASTE SACHET [50 IN A CARTON]',
          label: 'JUMBO TOMATO PASTE SACHET',
          price: 6800,
        ),
        ProductModel(
          id: '27',
          name: 'DANGOTE SALT 500G',
          category: FoodCategory.Seasonings,
          imageUrl: 'https://i0.wp.com/nextcashandcarry.com.ng/wp-content/uploads/2022/05/Dangote-Salt-1.png?w=425&ssl=1',
          description:
          'DANGOTE SALT 500G [15 ML] X [100]',
          label: 'DANGOTE SALT 500G',
          price: 8000,
        ),
        ProductModel(
          id: '28',
          name: 'DANGOTE SALT 1KG',
          category: FoodCategory.Seasonings,
          imageUrl: 'https://i0.wp.com/nextcashandcarry.com.ng/wp-content/uploads/2022/05/download-7.jpg?fit=243%2C208&ssl=1',
          description:
          'DANGOTE SALT 20 Sachets X 1KG',
          label: 'DANGOTE SALT 1KG',
          price: 8400,
        ),
        ProductModel(
          id: '29',
          name: 'ROYCO BEEF FLAVOUR',
          category: FoodCategory.Seasonings,
          imageUrl: 'https://www-konga-com-res.cloudinary.com/w_500,f_auto,fl_lossy,dpr_auto,q_auto/media/catalog/product/D/Y/200729_1722512847.jpg',
          description:
          'ROYCO BEEF FLAVOUR 4G X(20)',
          label: 'ROYCO BEEF FLAVOUR ',
          price: 25000,
        ),
        ProductModel(
          id: '30',
          name: 'GINO MIX',
          category: FoodCategory.Seasonings,
          imageUrl: 'https://ng.jumia.is/unsafe/fit-in/300x300/filters:fill(white)/product/05/5275904/1.jpg?5123',
          description:
          'GINO MIX [50 IN A CARTON]',
          label: 'GINO MIX',
          price: 8500,
        ),
        ProductModel(
          id: '31',
          name: 'GOLDEN BITES CHIN',
          category: FoodCategory.Miscellaneous,
          imageUrl: 'https://ng.jumia.is/unsafe/fit-in/500x500/filters:fill(white)/product/00/3527104/1.jpg?5316',
          description:
          'GOLDEN BITES CHIN CHIN CRUNCHY 40G X 100 ',
          label: 'GOLDEN BITES CHIN CHIN CRUNCHY 40G X 100',
          price: 13000,
        ),
        ProductModel(
          id: '32',
          name: 'AMAIZING DAY',
          category: FoodCategory.Miscellaneous,
          imageUrl: 'https://rave-services.f4b-flutterwave.com/v1/services/filestack/download/3g7MKM8SNCLbotSVYFng?width=430&height=430&resize=1&fit=crop&align=center',
          description:
          'AMAIZING DAY MAIZE, SOYA AND CASSAVA INSTANT CEREAL 100 SACHETS X 456',
          label: 'AMAIZING DAY CEREAL 100 SACHETS',
          price: 22300,
        ),
        ProductModel(
          id: '33',
          name: 'HONEY WELL',
          category: FoodCategory.Flour_Grains,
          imageUrl: 'https://24hoursmarket.com/wp-content/uploads/2021/02/1717322604816.jpg',
          description:
          'HONEY WELL SEMOLINA 1.8KG',
          label: 'HONEY WELL SEMOLINA 1.8KG',
          price: 17000,
        ),
        ProductModel(
          id: '34',
          name: 'GPM FLOUR 1KG X',
          category: FoodCategory.Flour_Grains,
          imageUrl: 'https://storage.googleapis.com/media-management-eu-alerzo/product-images/66f59c3840bc0f2379fba9ce/mOpbbR1iCR%20-%201744630229348.jpg',
          description:
          'GOLDEN PENNY MYLT PURPOSE FLOUR ALL \n PURPOSE BAKING FLOUR',
          label: 'GPM FLOUR 1KG X [10] ',
          price: 14500,
        ),
        ProductModel(
          id: '35',
          name: 'SEMO 5KG',
          category: FoodCategory.Flour_Grains,
          imageUrl: 'https://24hoursmarket.com/wp-content/uploads/2020/04/1643499587400.jpg',
          description:
          'High Quality Golden Penny semovita.',
          label: 'SEMO 5KG',
          price: 8500,
        ),
        ProductModel(
          id: '36',
          name: 'SEMO 1KG',
          category: FoodCategory.Flour_Grains,
          imageUrl: 'https://www.pricepally.com/_next/image?url=https%3A%2F%2Fpp-new-node-medusa-prod-bucket.s3.us-east-1.amazonaws.com%2FFLoDUUZ87Ek0e0VOrN51hKyw0y3YMdG444IqfEIu-1718631807704.jpg&w=3840&q=75',
          description:
          'High Quality Golden Penny semovita.',
          label: 'SEMO 1KG',
          price: 17000,
        ),
        ProductModel(
          id: '37',
          name: 'SEMO 10KG',
          category: FoodCategory.Flour_Grains,
          imageUrl: 'https://gidimartng.com/storage/app/public/product/2022-01-11-61dd3d37d7960.png',
          description:
          'High Quality Golden Penny semovita.',
          label: 'SEMO 10KG',
          price: 17000,
        ),
        ProductModel(
          id: '38',
          name: 'KINGS OIL 25 LITERS',
          category: FoodCategory.Cooking_Oils,
          imageUrl: 'https://www.gidimartng.com/storage/app/public/product/2021-11-26-61a0b37fab655.png',
          description:
          'DEVON KIGS OIL 25 LITERS.',
          label: 'KINGS OIL 25 LITERS',
          price: 89000,
        ),
        ProductModel(
          id: '39',
          name: 'GOLDEN PENNY SOYA',
          category: FoodCategory.Cooking_Oils,
          imageUrl: 'https://housefood.africa/wp-content/uploads/2024/12/golden-penny-4-l-carton.png',
          description:
          'GOLDEN PENNY SOYA OIL 2.75[6 BOTTLES IN A CARTON]',
          label: 'GOLDEN PENNY SOYA OIL 2.75',
          price: 62000,
        ),
        ProductModel(
          id: '40',
          name: 'GOLDEN PENNY SOYA',
          category: FoodCategory.Cooking_Oils,
          imageUrl: 'https://housefood.africa/wp-content/uploads/2024/12/golden-penny-4-l-carton.png',
          description:
          'GOLDEN PENNY SOYA OIL 4 liters [6 gallons in a carton]',
          label: 'GOLDEN PENNY SOYA OIL 4 liters',
          price: 94000,
        ),
        ProductModel(
          id: '41',
          name: 'GOLDEN PENNY SOYA',
          category: FoodCategory.Cooking_Oils,
          imageUrl: 'https://www.pricepally.com/_next/image?url=https%3A%2F%2Fpp-new-node-medusa-prod-bucket.s3.us-east-1.amazonaws.com%2FnxiVHmVA7tzIl7SAa2Hp2k9yBoesNbEShcLeWGgV-1718657788147.jpg&w=3840&q=75',
          description:
          'GOLDEN PENNY SOYA OIL 4 liters [4 gallons in a carton].',
          label: 'GOLDEN PENNY SOYA OIL 5 liters',
          price: 75000,
        ),
        ProductModel(
          id: '42',
          name: 'GOLDEN PENNY SOYA',
          category: FoodCategory.Cooking_Oils,
          imageUrl: 'https://www.pricepally.com/_next/image?url=https%3A%2F%2Fpp-new-node-medusa-prod-bucket.s3.us-east-1.amazonaws.com%2FnxiVHmVA7tzIl7SAa2Hp2k9yBoesNbEShcLeWGgV-1718657788147.jpg&w=3840&q=75',
          description:
          'GOLDEN PENNY SOYA OIL 1 liters.',
          label: 'SGOLDEN PENNY SOYA OIL 1 liters',
          price: 49000,
        ),
        ProductModel(
          id: '43',
          name: 'KINGS OIL 3 LITERS',
          category: FoodCategory.Cooking_Oils,
          imageUrl: 'https://gidimartng.com/storage/app/public/product/2022-02-23-621645d7385b8.png',
          description:
          'DEVON KINGS OIL 3 LITERS',
          label: 'KINGS OIL 3 LITERS',
          price: 66000,
        ),
        ProductModel(
          id: '44',
          name: 'Power Oil 2.6LITERS',
          category: FoodCategory.Cooking_Oils,
          imageUrl: 'https://gidimartng.com/storage/app/public/product/2022-04-28-626a63bb9c1ee.png',
          description:
          'Power Oil 2.6LITERS - Carton(x 8).',
          label: 'Power Oil 2.6LITERS -Carton(x 8)',
          price: 85000,
        ),
        ProductModel(
          id: '45',
          name: 'GOLDEN TERRA SOYA',
          category: FoodCategory.Cooking_Oils,
          imageUrl: 'https://gidimartng.com/storage/app/public/product/2022-03-21-62384fb0b2abd.png',
          description:
          'GOLDEN TERRA SOYA OIL 5 liters.',
          label: 'GOLDEN TERRA SOYA OIL 5 liters',
          price: 66300,
        ),
        ProductModel(
          id: '46',
          name: 'GOLDEN TERRA SOYA',
          category: FoodCategory.Cooking_Oils,
          imageUrl: 'https://mysasun.com/cdn/shop/files/Golden-Terra-Oil-Sahcet_00d9893a-f3b9-4f10-9c03-595111794b34.jpg?v=1727892771&width=480',
          description:
          'GOLDEN TERRA SOYA OIL 43ML [sachet].',
          label: 'GOLDEN TERRA SOYA OIL 43ML [sachet]',
          price: 18700,
        ),
        ProductModel(
          id: '47',
          name: 'GOLDEN TERRA SOYA',
          category: FoodCategory.Cooking_Oils,
          imageUrl: 'https://ng.jumia.is/unsafe/fit-in/300x300/filters:fill(white)/product/90/1009904/1.jpg?3577',
          description:
          'GOLDEN TERRA SOYA OIL 700ML.',
          label: 'GOLDEN TERRA SOYA OIL 700ML',
          price: 35100,
        ),




        // Add more foods...
      ];

      for (final product in products) {
        await productBox.add(product);
      }

      notifyListeners();
    }
  }

  List<ProductModel> get allProducts => productBox.values.toList();
}
