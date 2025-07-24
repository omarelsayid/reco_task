import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

themeData() {
  return ThemeData(
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.white,
      filled: true,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(9)),
      focusedBorder: InputBorder.none,
      enabledBorder: InputBorder.none,
      labelStyle: GoogleFonts.getFont(
        'Nunito Sans',
        fontSize: 14,
        letterSpacing: 0.1,
      ),
    ),
  );
}
