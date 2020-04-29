import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final theme = ThemeData(
  accentColor: Colors.white,
  fontFamily: GoogleFonts.nunitoSans().fontFamily,
  appBarTheme: AppBarTheme(
    elevation: 0,
    color: Colors.white,
  ),
  textTheme: TextTheme(
    headline1: TextStyle(
      fontFamily: GoogleFonts.robotoSlab().fontFamily,
      fontSize: 20,
      color: Color(0xFF454545),
      fontWeight: FontWeight.w900
    ),
    headline2: TextStyle(
      fontFamily: GoogleFonts.nunitoSans().fontFamily,
      color: Color(0xFF949494),
      fontSize: 12,
      fontWeight: FontWeight.normal
    ),
  ),
);
