import 'package:flutter/material.dart';
import 'colors_constants.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    fontFamily: "Poppins",
    brightness: Brightness.light,
    primarySwatch: generateMaterialColorFromColor(Colors.black),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        side: const BorderSide(
          width: 2.0,
          color: Colors.white,
        ),
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    fontFamily: "Poppins",
    brightness: Brightness.dark,
    primarySwatch: generateMaterialColorFromColor(Colors.white),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        side: const BorderSide(
          width: 2.0,
          color: Colors.black,
        ),
      ),
    ),
  );
}
