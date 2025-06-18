import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:orix_food/core/theme/app_colors.dart';
import 'package:orix_food/viewmodels/search_viewmodel.dart';
import 'package:orix_food/views/screens/category.dart';
import 'package:orix_food/widgets/app_textfield.dart';
import 'package:provider/provider.dart';

import '../../models/food_category.dart';
import '../../viewmodels/filtered_products_one_one.dart';

import '../../widgets/home_category_list.dart';
import '../details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final oneProductPerCategory = FilteredProducts.getOneProductPerCategory();
  var searchController = TextEditingController();
  String searchValue = '';
  SearchModelView search = SearchModelView();
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => Provider.of<SearchModelView>(context, listen: false).init(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<String> imageList = [
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKHnoq1LlVr7QAGF9a1TT8Aegw5dequCV6aA&s',
      'https://images.unsplash.com/photo-1719532520316-4cc0d8886ab7?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cmljZSUyMGJhZ3xlbnwwfHwwfHx8MA%3D%3D',
      'https://images.unsplash.com/photo-1621939514649-280e2ee25f60?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8U25hY2tzfGVufDB8fDB8fHww',
      'https://images.unsplash.com/photo-1550989460-0adf9ea622e2?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzJ8fGdyb2Nlcmllc3xlbnwwfHwwfHx8MA%3D%3D',
      'https://images.unsplash.com/photo-1586090643003-b2bfb4fbd833?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDh8fGdyb2Nlcmllc3xlbnwwfHwwfHx8MA%3D%3D',
    ];
    return Scaffold(
      body: Consumer<SearchModelView>(
        builder: (context, state, _) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 9,
                  horizontal: 13,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 18,
                  children: [
                    Row(
                      children: [
                        FloatingActionButton(
                          backgroundColor: AppColors.primary_bar,
                          onPressed: () {},
                          child: Icon(Icons.person, color: Colors.black),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Orix Cart Resources',
                                  style: TextStyle(
                                    color: AppColors.light_grey,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat',
                                  ),
                                ),
                                Text(
                                  'Delivery available only within Abuja',
                                  style: TextStyle(
                                    color: AppColors.card,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        FloatingActionButton(
                          backgroundColor: AppColors.primary_bar,
                          onPressed: () {},
                          child: Icon(
                            Icons.window_outlined,
                            color: Colors.black,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ],
                    ),
                    //SizedBox(height: 15),
                    AppTextField(
                      controller: searchController,
                      bgColor: AppColors.light_grey,
                      prefixIcon: Icon(Icons.search, size: 23),
                      hintText: 'Search in Products',
                      onChanged: (value) {
                        searchValue = value;

                        state.search(value);
                      },
                    ),
                    //SizedBox(height: 20),
                    (searchValue.isEmpty)
                        ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 18,
                          children: [
                            Text(
                              'C a t e g o r i e s',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: AppColors.error,
                              ),
                            ),
                            SizedBox(
                              height: 100,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  HomeCategoryListCart(
                                    name: 'Seasonings',
                                    img: 'assets/images/Seasonings.png',
                                    category: FoodCategory.Seasonings,
                                  ),
                                  SizedBox(width: 15),
                                  HomeCategoryListCart(
                                    name: 'Miscellaneous',
                                    img: 'assets/images/miscellaneous.png',
                                    category: FoodCategory.Miscellaneous,
                                  ),
                                  SizedBox(width: 15),
                                  HomeCategoryListCart(
                                    name: 'Flour_Grains',
                                    img: 'assets/images/flur_grains.png',
                                    category: FoodCategory.Flour_Grains,
                                  ),
                                  SizedBox(width: 15),
                                  HomeCategoryListCart(
                                    name: 'Cooking_Oils',
                                    img: 'assets/images/cooking_oil.png',
                                    category: FoodCategory.Cooking_Oils,
                                  ),
                                  SizedBox(width: 15),
                                  HomeCategoryListCart(
                                    name: 'Fruits',
                                    img: 'assets/images/fruits.png',
                                    category: FoodCategory.fruits,
                                  ),
                                  SizedBox(width: 15),
                                  HomeCategoryListCart(
                                    name: 'Junks',
                                    img: 'assets/images/junks.png',
                                    category: FoodCategory.fruits,
                                  ),
                                  SizedBox(width: 15),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder:
                                              (context) => CategoryScreen(),
                                        ),
                                      );
                                    },
                                    child: Column(
                                      spacing: 12,
                                      children: [
                                        Container(
                                          height: 70,
                                          width: 70,
                                          decoration: BoxDecoration(
                                            color: AppColors.dark_grey,
                                            borderRadius: BorderRadius.circular(
                                              30,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(11.0),
                                            child: Image.asset(
                                              'assets/images/more.png',
                                              width: 50,
                                              height: 50,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'More',
                                          style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 11,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              'M o s t P o p u l a r',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: AppColors.error,
                              ),
                            ),
                            SizedBox(
                              height: 150,
                              child: ListView.separated(
                                itemBuilder: (context, index) {
                                  final product = oneProductPerCategory[index];
                                  return InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder:
                                              (context) => DetailsScreen(
                                                product: product,
                                              ),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      height: 125,
                                      width: 140,
                                      decoration: BoxDecoration(
                                        color: AppColors.dark_grey,
                                        borderRadius: BorderRadius.circular(
                                          10,
                                        ), // <- this makes it ROUND 🌀
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.network(
                                              product.imageUrl,
                                              width: 130,
                                              height: 100,
                                              fit: BoxFit.cover,
                                            ),
                                            SizedBox(height: 10),
                                            Text(
                                              product.name,
                                              style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                fontSize: 11,
                                                fontWeight: FontWeight.w600,
                                                color: AppColors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                itemCount: oneProductPerCategory.length,
                                scrollDirection: Axis.horizontal,
                                separatorBuilder: (
                                  BuildContext context,
                                  int index,
                                ) {
                                  return SizedBox(width: 15);
                                },
                              ),
                            ),
                            SizedBox(height: 10),
                            CarouselSlider(
                              options: CarouselOptions(
                                height: 200,
                                autoPlay: true,
                                enlargeCenterPage: true,
                                viewportFraction: 0.8,
                                aspectRatio: 16 / 9,
                                autoPlayInterval: Duration(seconds: 3),
                              ),
                              items:
                                  imageList.map((imgUrl) {
                                    return Builder(
                                      builder: (BuildContext context) {
                                        return Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          margin: EdgeInsets.symmetric(
                                            horizontal: 5,
                                          ),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                            child: Image.network(
                                              imgUrl,
                                              fit: BoxFit.cover,
                                              errorBuilder:
                                                  (
                                                    context,
                                                    error,
                                                    stackTrace,
                                                  ) => Center(
                                                    child: Icon(
                                                      Icons.broken_image,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  }).toList(),
                            ),
                            Text(
                              'M o s t P o p u l a r',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: AppColors.error,
                              ),
                            ),
                            SizedBox(
                              height: 150,
                              child: ListView.separated(
                                itemBuilder: (context, index) {
                                  final product = oneProductPerCategory[index];
                                  return InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder:
                                              (context) => DetailsScreen(
                                                product: product,
                                              ),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      height: 125,
                                      width: 140,
                                      decoration: BoxDecoration(
                                        color: AppColors.dark_grey,
                                        borderRadius: BorderRadius.circular(
                                          10,
                                        ), // <- this makes it ROUND 🌀
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.network(
                                              product.imageUrl,
                                              width: 130,
                                              height: 100,
                                              fit: BoxFit.cover,
                                            ),
                                            SizedBox(height: 10),
                                            Text(
                                              product.name,
                                              style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                fontSize: 11,
                                                fontWeight: FontWeight.w600,
                                                color: AppColors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                itemCount: oneProductPerCategory.length,
                                scrollDirection: Axis.horizontal,
                                separatorBuilder: (
                                  BuildContext context,
                                  int index,
                                ) {
                                  return SizedBox(width: 15);
                                },
                              ),
                            ),
                          ],
                        )
                        : SizedBox(
                          height: 400,
                          child: ListView.builder(
                            itemCount: state.filteredProducts.length,
                            itemBuilder: (context, index) {
                              final product = state.filteredProducts[index];

                              return InkWell(
                                splashColor: AppColors.grey,
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
                                child: Text(
                                  '${product.name}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Montserrat',
                                    fontSize: 20,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
