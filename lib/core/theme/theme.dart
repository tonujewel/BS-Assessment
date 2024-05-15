import 'package:flutter/material.dart';

import '../utils/color_manager.dart';

class AppThemes {
  static const int _primaryColor = 0xFF169fda;
  static const MaterialColor primarySwatch = MaterialColor(_primaryColor, <int, Color>{
    50: Color(0xFFffffff),
    100: Color(0xFFe8f5fb),
    200: Color(0xFFd0ecf8),
    300: Color(0xFFb9e2f4),
    400: Color(0xFFa2d9f0),
    500: Color(0xFF8bcfed),
    600: Color(0xFF73c5e9),
    700: Color(0xFF5cbce5),
    800: Color(0xFF45b2e1),
    900: Color(0xFF2da9de),
  });

  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    cardColor: Colors.white,
    dividerColor: const Color(0x1C000000),
    fontFamily: "Poppins",
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorManager.primaryColor,
        foregroundColor: Colors.white,
        shape: const StadiumBorder(),
        minimumSize: const Size.fromHeight(50),
        textStyle: const TextStyle(color: Colors.white),
      ),
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      foregroundColor: Colors.white,
      backgroundColor: ColorManager.primaryColor,
    ),
    colorScheme: ColorScheme.fromSwatch(primarySwatch: primarySwatch).copyWith(background: Colors.white),
    bottomAppBarTheme: const BottomAppBarTheme(color: Colors.white),
  );
}
