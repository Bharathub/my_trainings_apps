import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData themeData = ThemeData(
    useMaterial3: true,
    colorScheme: colorScheme,
    textTheme: textTheme,
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0XFFEFF2F2),
    ),
  );
  static ColorScheme get colorScheme => const ColorScheme(
      brightness: Brightness.light,
      primary: Color.fromARGB(255, 221, 68, 68),
      onPrimary: Color(0xffFBF9F0),
      primaryContainer: Color(0xffFBF9F0),
      secondary: Color(0xffFBF9F0),
      onSecondary: Color(0XFF000000),
      secondaryContainer: Color(0xffFBF9F0),
      error: Color(0XFFF31919),
      onError: Color(0XFFFFFFFF),
      errorContainer: Color(0xFFFFDAD6),
      onErrorContainer: Color(0xFF410002),
      surfaceContainerHighest: Color(0XFFE1E1E1),
      surfaceContainerHigh: Color(0XFFFFFFFF),
      // surfaceContainerLow: Color(0XFFfbf3e5),
      surface: Color(0XFFFFFFFF),
      onSurface: Color(0xFF000000),
      onSurfaceVariant: Color(0XFF777777),
      outline: Color(0XFFDDDDDD),
      outlineVariant: Color(0XFFE1E1E1),
      shadow: Color.fromRGBO(0, 0, 0, 0.16),
      inverseSurface: Color.fromRGBO(0, 0, 0, 0.9),
      onInverseSurface: Color(0xFFFFFFFF),
      inversePrimary: Color(0xffFFCB09),
      surfaceTint: Color(0xFFFFFFFF));

  static TextTheme get textTheme => const TextTheme(
        displayLarge: TextStyle(
          fontFamily: "GilmerRegular",
          fontSize: 57,
          fontWeight: FontWeight.w400,
          height: 64 / 57,
        ),
        displayMedium: TextStyle(
          fontFamily: "GilmerRegular",
          fontSize: 45,
          fontWeight: FontWeight.w400,
          height: 52 / 45,
        ),
        displaySmall: TextStyle(
          fontFamily: "GilmerRegular",
          fontSize: 36,
          fontWeight: FontWeight.w400,
          height: 44 / 36,
        ),
        headlineLarge: TextStyle(
          fontFamily: "GilmerRegular",
          fontSize: 32,
          fontWeight: FontWeight.w400,
          height: 40 / 32,
        ),
        headlineMedium: TextStyle(
          fontFamily: "GilmerMedium",
          fontSize: 28,
          fontWeight: FontWeight.w400,
          height: 36 / 28,
        ),
        headlineSmall: TextStyle(
          fontFamily: "GilmerBold",
          fontSize: 24,
          fontWeight: FontWeight.w700,
          height: 32 / 24,
        ),
        titleLarge: TextStyle(
          fontFamily: "GilmerRegular",
          fontSize: 22,
          fontWeight: FontWeight.w400,
          height: 28 / 22,
        ),
        titleMedium: TextStyle(
          fontFamily: "Gilmer",
          fontSize: 16,
          fontWeight: FontWeight.w500,
          height: 24 / 16,
        ),
        titleSmall: TextStyle(
          fontFamily: "GilmerMedium",
          fontSize: 14,
          fontWeight: FontWeight.w500,
          height: 20 / 14,
        ),
        bodyLarge: TextStyle(
          fontFamily: "GilmerRegular",
          fontSize: 16,
          fontWeight: FontWeight.w400,
          height: 24 / 16,
        ),
        bodyMedium: TextStyle(
          fontFamily: "GilmerRegular",
          fontSize: 14,
          fontWeight: FontWeight.w400,
          height: 20 / 14,
        ),
        bodySmall: TextStyle(
          fontFamily: "GilmerRegular",
          fontSize: 12,
          fontWeight: FontWeight.normal,
          height: 16 / 12,
        ),
        labelLarge: TextStyle(
          fontFamily: "GilmerMedium",
          fontSize: 14,
          fontWeight: FontWeight.w500,
          height: 20 / 14,
        ),
        labelMedium: TextStyle(
          fontFamily: "GilmerMedium",
          fontSize: 12,
          fontWeight: FontWeight.w500,
          height: 16 / 12,
        ),
        labelSmall: TextStyle(
          fontFamily: "GilmerMedium",
          fontSize: 11,
          fontWeight: FontWeight.w500,
          height: 16 / 11,
        ),
      );
}
