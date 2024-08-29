import 'package:flutter/material.dart';

import 'app_pallete.dart';

class AppTheme {
  static final ThemeData baseTheme = ThemeData(
    primaryColor: AppPallete.primary,
    fontFamily: 'Satoshi',
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppPallete.primary,
        textStyle: const TextStyle(
          fontSize: 20,
          fontFamily: 'Satoshi',
          fontWeight: FontWeight.bold,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    ),
  );

  static final ThemeData lightTheme = baseTheme.copyWith(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppPallete.lightBackground,
  );

  static final ThemeData darkTheme = baseTheme.copyWith(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppPallete.darkBackground,
  );
}
