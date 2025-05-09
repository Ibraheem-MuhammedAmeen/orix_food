import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:orix_food/core/theme/app_theme.dart';
import 'package:orix_food/models/food_category.dart';
import 'package:orix_food/models/product_model.dart';
import 'package:orix_food/viewmodels/loading_provide.dart';
import 'package:orix_food/viewmodels/login_viewmodel.dart';
import 'package:orix_food/viewmodels/products_viewmodel.dart';
import 'package:orix_food/viewmodels/register_viewmodel.dart';
import 'package:orix_food/views/mainShell.dart';
import 'package:orix_food/views/screens/home.dart';
import 'package:orix_food/views/splash/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:path_provider/path_provider.dart';

import 'core/services/shared_prefrence_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter is ready before Firebase
  await Firebase.initializeApp(); // Initialize Firebase
  final dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);
  Hive.initFlutter();
  Hive.registerAdapter(FoodCategoryAdapter());
  Hive.registerAdapter(ProductModelAdapter());

  await Hive.openBox<ProductModel>('products');

  final isLoggedIn = await SharedPrefService().isLoggedIn();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RegisterViewModel()),
        ChangeNotifierProvider(create: (_) => LoginViewModel()),
        ChangeNotifierProvider(create: (_) => LoadingProvider()),
        ChangeNotifierProvider(create: (_) => ProductsViewModel()),
      ],
      child: MyApp(isLoggedIn: isLoggedIn),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.isLoggedIn});
  final bool isLoggedIn;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: darkTheme,
      themeMode: ThemeMode.dark, //ThemeMode.system,
      theme: lightTheme,
      home: isLoggedIn ? NavigationPage() : const SplashScreen(),
    );
  }
}
