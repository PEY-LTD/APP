// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pey/src/core/resources/colors.dart';

final themeData = ThemeData(
  scaffoldBackgroundColor: Palette.background,
  textTheme: GoogleFonts.interTightTextTheme().apply(
    bodyColor: Colors.black,
    displayColor: Colors.black,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.black,
      elevation: 0.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    ),
  ),
  buttonTheme: const ButtonThemeData(
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: Palette.blueHue,
      onPrimary: Palette.iconColor,
      secondary: Palette.buttonColor,
      onSecondary: Colors.black,
      error: Palette.buttonColor,
      onError: Colors.white,
      background: Colors.transparent,
      onBackground: Colors.black,
      surface: Palette.cardColor,
      onSurface: Colors.black,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    contentPadding: const EdgeInsets.symmetric(
      horizontal: 20.0,
      vertical: 20.0,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(28),
      borderSide: const BorderSide(color: Palette.iconColor),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(28.0),
      borderSide: const BorderSide(color: Color(0xFFCBD2D9)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(28.0),
      borderSide: const BorderSide(color: Palette.blueHue, width: 1.6),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(28.0),
      borderSide: BorderSide(color: Colors.red.shade300),
    ),
  ),
  appBarTheme: AppBarTheme(
      elevation: 0.0,
      backgroundColor: Palette.background,
      surfaceTintColor: Colors.transparent,
      centerTitle: true,
      titleTextStyle: GoogleFonts.inter(
          color: Palette.black, fontWeight: FontWeight.w500, fontSize: 20)),
  colorScheme: ColorScheme.dark(
    background: Palette.background,
    primary: Palette.blueHue,
    tertiary: Palette.cardColor,
  ),
);
