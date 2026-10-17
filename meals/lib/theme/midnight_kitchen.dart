import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract final class MidnightKitchen {
  static const Color background = Color(0xFF171B1A);
  static const Color surface = Color(0xFF242A27);
  static const Color foreground = Color(0xFFF5F3E9);
  static const Color muted = Color(0xFFB7C0B9);
  static const Color border = Color(0xFF465049);
  static const Color amber = Color(0xFFF2BB69);
  static const Color soft = Color(0xFF33362B);
  static const Color onAmber = Color(0xFF24251C);
  static const Color photoScrim = Color(0xFF111111);
  static const Color photoText = Color(0xFFFFFFFF);
  static const Color photoMuted = Color(0xFFE5E7DF);
}

ThemeData buildMidnightKitchenTheme() {
  final colorScheme =
      ColorScheme.fromSeed(
        seedColor: MidnightKitchen.amber,
        brightness: Brightness.dark,
      ).copyWith(
        primary: MidnightKitchen.amber,
        onPrimary: MidnightKitchen.onAmber,
        secondary: MidnightKitchen.amber,
        onSecondary: MidnightKitchen.onAmber,
        surface: MidnightKitchen.surface,
        onSurface: MidnightKitchen.foreground,
        onSurfaceVariant: MidnightKitchen.muted,
        outline: MidnightKitchen.border,
        surfaceTint: Colors.transparent,
      );

  return ThemeData(
    useMaterial3: true,
    colorScheme: colorScheme,
    scaffoldBackgroundColor: MidnightKitchen.background,
    appBarTheme: const AppBarTheme(
      backgroundColor: MidnightKitchen.background,
      foregroundColor: MidnightKitchen.foreground,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
    ),
    dividerTheme: const DividerThemeData(
      color: MidnightKitchen.border,
      thickness: 1,
    ),
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: MidnightKitchen.surface,
      contentTextStyle: TextStyle(
        color: MidnightKitchen.foreground,
        fontSize: 14,
      ),
      actionTextColor: MidnightKitchen.amber,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: MidnightKitchen.background,
      selectedItemColor: MidnightKitchen.amber,
      unselectedItemColor: MidnightKitchen.muted,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
    ),
    textTheme: ThemeData.dark().textTheme.apply(
      fontFamily: GoogleFonts.manrope().fontFamily,
      bodyColor: MidnightKitchen.foreground,
      displayColor: MidnightKitchen.foreground,
    ),
  );
}
