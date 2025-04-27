import 'package:flutter/material.dart';
import 'package:orix_food/core/theme/app_theme.dart';
import 'package:orix_food/views/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: darkTheme,
      themeMode: ThemeMode.dark, //ThemeMode.system,
      theme: lightTheme,
      home: HomePage(),
    );
  }
}
