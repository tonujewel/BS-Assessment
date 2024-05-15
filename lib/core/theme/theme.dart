import 'package:flutter/material.dart';

import '../utils/color_manager.dart';

class AppThemes {
  static const int _primaryColor = 0xFF252e43;
  static const MaterialColor primarySwatch = MaterialColor(_primaryColor, <int, Color>{
    50: Color(0xFFffffff),
    100: Color(0xFFe9eaec),
    200: Color(0xFFd3d5d9),
    300: Color(0xFFbec0c7),
    400: Color(0xFFa8abb4),
    500: Color(0xFF9297a1),
    600: Color(0xFF7c828e),
    700: Color(0xFF666d7b),
    800: Color(0xFF515869),
    900: Color(0xFF3b4356),
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
