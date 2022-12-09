import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: primary,
  backgroundColor: background,
  scaffoldBackgroundColor: background,
  dialogBackgroundColor: background,
  splashColor: primary,
  fontFamily: GoogleFonts.inter().fontFamily,
  textTheme: const TextTheme(
    headline1: TextStyle(
      color: primary,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    bodyText1: TextStyle(
      color: primary,
      fontSize: 15,
    ),
    button: TextStyle(
      color: primary,
      fontSize: 18,
    ),
  ),
  appBarTheme: AppBarTheme(
    elevation: 0,
    centerTitle: true,
    iconTheme: const IconThemeData(
      color: primary,
    ),
    titleTextStyle: TextStyle(
      fontSize: 25,
      fontFamily: GoogleFonts.montserrat().fontFamily,
      letterSpacing: 3,
      fontWeight: FontWeight.bold,
      color: primary,
    ),
    foregroundColor: primary,
    backgroundColor: background,
    toolbarHeight: 80,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(50),
      ),
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    elevation: 0,
    backgroundColor: secondary,
    enableFeedback: true,
    selectedItemColor: primary,
    unselectedItemColor: Colors.white,
  ),
  iconTheme: const IconThemeData(
    color: primary,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      textStyle: const TextStyle(
        color: onSecondary,
        fontSize: 18,
        letterSpacing: 2,
      ),
      foregroundColor: onSecondary,
      backgroundColor: primary,
      elevation: 2,
      enableFeedback: true,
      shape: const StadiumBorder(),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      enableFeedback: true,
      textStyle: const TextStyle(
        color: Colors.white,
        //fontSize: 18,
      ),
      side: const BorderSide(
        color: primary,
        width: 2,
      ),
      shape: const StadiumBorder(),
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    filled: false,
    fillColor: Colors.transparent,
    labelStyle: TextStyle(color: primary),
    helperStyle: TextStyle(color: primary),
    hintStyle: TextStyle(color: primary),
    errorStyle: TextStyle(color: error),
    iconColor: primary,
    prefixIconColor: primary,
    suffixIconColor: primary,
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: primary),
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    disabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: primary),
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    border: UnderlineInputBorder(
      borderSide: BorderSide(color: primary),
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: primary),
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    errorBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: error),
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
  ),
);
