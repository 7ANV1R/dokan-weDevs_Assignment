import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart' show GoogleFonts;

import 'palette.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData.light(
    useMaterial3: true,
  ).copyWith(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Palette.primaryColor,
      primary: Palette.primaryColor,
    ),
    scaffoldBackgroundColor: Palette.scaffoldBgColor,
    primaryTextTheme: GoogleFonts.robotoTextTheme(),
  );
}
