import '../config/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData appThemeData() {
  return ThemeData(
    appBarTheme: AppBarTheme(
      brightness: Brightness.light,
      iconTheme: IconThemeData(
        color: kPrimaryColor, //change your color here
      ),
      color: Colors.white12,
      centerTitle: true,
      elevation: 0.0,
    ),
    primarySwatch: createMaterialColor(kPrimaryColor),
    primaryTextTheme: TextTheme(headline6: TextStyle(color: kTextColor)),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: GoogleFonts.nunitoTextTheme(),
  );
}
