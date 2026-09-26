import 'package:flutter/material.dart';

import 'package:expense_tracker/models/expense.dart';

class AppColors {
  static const background = Color(0xFFF5F7F4);
  static const surface = Color(0xFFFFFFFF);
  static const ink = Color(0xFF142724);
  static const muted = Color(0xFF6F7C77);
  static const line = Color(0xFFE7ECE8);
  static const teal = Color(0xFF155C50);
  static const tealLight = Color(0xFFC5E6D9);
  static const mint = Color(0xFFDDF2E9);
  static const track = Color(0xFFEEF2EF);
  static const orange = Color(0xFFECA76A);
  static const orangeTint = Color(0xFFFFF0E0);
  static const blue = Color(0xFF8DB9D8);
  static const blueTint = Color(0xFFEAF4FB);
  static const purple = Color(0xFFAF9AD8);
  static const purpleTint = Color(0xFFF1ECFA);
  static const green = Color(0xFF72B59B);
  static const greenTint = Color(0xFFE5F3EC);

  static Color category(Category category) => switch (category) {
    Category.food => orange,
    Category.travel => blue,
    Category.leisure => purple,
    Category.work => green,
  };

  static Color categoryTint(Category category) => switch (category) {
    Category.food => orangeTint,
    Category.travel => blueTint,
    Category.leisure => purpleTint,
    Category.work => greenTint,
  };
}

final appTheme = ThemeData(
  useMaterial3: true,
  fontFamily: 'Roboto',
  scaffoldBackgroundColor: AppColors.background,
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.teal,
    surface: AppColors.background,
  ),
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: AppColors.teal,
    selectionColor: AppColors.mint,
    selectionHandleColor: AppColors.teal,
  ),
  snackBarTheme: SnackBarThemeData(
    behavior: SnackBarBehavior.floating,
    backgroundColor: AppColors.ink,
    contentTextStyle: const TextStyle(color: Colors.white),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
  ),
);
