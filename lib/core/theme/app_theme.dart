import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text_theme.dart';

// Light Theme
final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: AppColors.background,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
    titleTextStyle: kBlackMerriweatherSmallTitleStyle,
    iconTheme: IconThemeData(color: Colors.black),
  ),
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.accent,
    brightness: Brightness.light,
    primary: AppColors.primary,
    onPrimary: AppColors.onPrimary,
    background: AppColors.background,
    onBackground: Colors.black,
  ),
);

// Dark Theme
final ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: AppColors.selectedPaymentCardBackground,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
    titleTextStyle: kWhiteMerriweatherSmallTitleStyle,
    iconTheme: IconThemeData(color: Colors.white),
  ),
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.accent,
    brightness: Brightness.dark,
    primary: AppColors.primary,
    onPrimary: AppColors.onPrimary,
    background: AppColors.selectedPaymentCardBackground,
    onBackground: Colors.white,
  ),
);
