import 'package:flutter/material.dart';

import 'app_pallete.dart';

class AppTheme {
  static final ThemeData baseTheme = ThemeData(
    primaryColor: AppPallete.primary,
    fontFamily: 'Satoshi',
    dividerTheme: const DividerThemeData(
      color: AppPallete.grey,
    ),
    dividerColor: AppPallete.grey,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppPallete.primary,
      selectionColor: AppPallete.primary.withOpacity(0.3),
      selectionHandleColor: AppPallete.primary,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 25,
      ),
      hintStyle: const TextStyle(
        color: AppPallete.textGrey,
      ),
      enabledBorder: outlineInputBorder(),
      focusedBorder: outlineInputBorder().copyWith(
        borderSide: const BorderSide(
          color: AppPallete.primary,
          width: 1.5,
        ),
      ),
      border: outlineInputBorder(),
      fillColor: Colors.transparent,
    ),
    colorScheme: const ColorScheme.light().copyWith(
      primary: AppPallete.white,
      surface: AppPallete.lightBackground,
      tertiary: Colors.black,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(
        color: AppPallete.textBlack,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppPallete.primary,
        elevation: 0,
        textStyle: const TextStyle(
          fontSize: 16,
          fontFamily: 'Satoshi',
          fontWeight: FontWeight.bold,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    ),
  );

  static OutlineInputBorder outlineInputBorder() {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(30),
      ),
      borderSide: BorderSide(
        color: AppPallete.textGrey,
        width: 1,
      ),
    );
  }

  static final ThemeData lightTheme = baseTheme.copyWith(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppPallete.lightBackground,
    textTheme: baseTheme.textTheme.apply(
      bodyColor: AppPallete.textBlack,
      displayColor: AppPallete.textBlack,
    ),
  );

  static final ThemeData darkTheme = baseTheme.copyWith(
    brightness: Brightness.light,
    colorScheme: const ColorScheme.dark().copyWith(
      primary: Colors.black,
      tertiary: AppPallete.white,
      surface: AppPallete.darkBackground,
    ),
    appBarTheme: baseTheme.appBarTheme.copyWith(
      iconTheme: const IconThemeData(
        color: AppPallete.textWhite,
      ),
    ),
    scaffoldBackgroundColor: AppPallete.darkBackground,
    textTheme: baseTheme.textTheme.apply(
      bodyColor: AppPallete.textWhite,
      displayColor: AppPallete.textWhite,
    ),
  );
}
