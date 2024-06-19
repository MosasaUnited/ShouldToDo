import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeDataStyle {
  // Light ThemeData
  static final ThemeData light = ThemeData(
    useMaterial3: true,
    primaryColor: ThemeData.light().scaffoldBackgroundColor,
    brightness: Brightness.light,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.redAccent,
    ),
    textTheme: GoogleFonts.montserratTextTheme(),
    colorScheme: ColorScheme.light(
      background: Colors.white,
      primary: Colors.deepPurple.shade700,
      secondary: Colors.deepPurple.shade300,
    ),
  );

  // Dark Theme Data
  static final ThemeData dark = ThemeData(
    useMaterial3: true,
    primaryColor: ThemeData.dark().canvasColor,
    brightness: Brightness.dark,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.redAccent,
    ),
    textTheme: GoogleFonts.montserratTextTheme(),
    colorScheme: ColorScheme.dark(
      background: Colors.grey.shade900,
      primary: Colors.deepPurple.shade500,
      secondary: Colors.deepPurple.shade700,
    ),
  );
}
