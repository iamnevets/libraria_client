import 'package:flutter/material.dart';

Color grey200 = Color(0xFFF3F3F3);
Color grey300 = Color(0xFFCFCFCF);
Color grey900 = Colors.grey.shade900;
Color transparentColor = Colors.transparent;

Color lightPrimaryColor = Color(0xFF452473);
Color lightPrimaryAccentColor = Color(0xFF2D184A);
Color lightSecondaryColor = Color(0xFFEC4176);
Color lightSecondaryAccentColor = Color(0xFFAB0D3F);
Color lightBackgroundColor = Color(0xFFFFFFFF);
Color lightSurfaceColor = Color(0xFFFFFCFD);
Color lightErrorColor = Color(0xFFDF1C1C);
Color lightColorOnPrimary = Color(0xFFFFECF2);
Color lightColorOnSecondary = Color(0xFFFFECF2);
Color lightColorOnSurface = Color(0xFF232323);
Color lightColorOnBackground = Color(0xFF232323);
Color lightColorOnError = Color(0xFFFFECF2);
Brightness appBrightness = Brightness.light;
Brightness appDarkness = Brightness.dark;

librariaTheming() {
  return ThemeData(
    fontFamily: 'Intel',
    colorScheme: ColorScheme(
        primary: lightPrimaryColor,
        primaryVariant: lightPrimaryAccentColor,
        secondary: lightSecondaryColor,
        secondaryVariant: lightSecondaryAccentColor,
        surface: lightSurfaceColor,
        background: lightBackgroundColor,
        error: lightErrorColor,
        onPrimary: lightColorOnPrimary,
        onSecondary: lightColorOnSecondary,
        onSurface: lightColorOnSurface,
        onBackground: lightColorOnBackground,
        onError: lightColorOnError,
        brightness: appBrightness),
  );
}
