import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:orix_food/core/theme/app_theme.dart';
import 'package:orix_food/viewmodels/loading_provide.dart';
import 'package:orix_food/viewmodels/login_viewmodel.dart';
import 'package:orix_food/viewmodels/register_viewmodel.dart';
import 'package:orix_food/views/splash/splash_screen.dart';
import 'package:orix_food/views/Registration_Login.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter is ready before Firebase
  await Firebase.initializeApp(); // Initialize Firebase
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RegisterViewModel()),
        ChangeNotifierProvider(create: (_) => LoginViewModel()),
        ChangeNotifierProvider(create: (_) => LoadingProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: darkTheme,
      themeMode: ThemeMode.dark, //ThemeMode.system,
      theme: lightTheme,
      home: SplashScreen(),
    );
  }
}
