import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xff008536);

const kPrimaryLightColor = Color(0xff4bb662);
const kPrimaryDarkColor = Color(0xff005709);

const kSecondaryColor = Color(0xffebc547);

const kPrimaryTextColor = Color(0xff333333);
const kTextColor = Color(0xff555555);

const kBackgroundColor = Color(0xfff7fff9);

const kContainerSpacing = const EdgeInsets.all(8.0);

// const kPrimaryGradientColor = LinearGradient(colors: [
//   Color(0xFF979797),
//   Color(0xFF757575),
// ]);

const kAnimationDuration = Duration(milliseconds: 200);

const kAppBarTheme = AppBarTheme(
  iconTheme: IconThemeData(
    color: kPrimaryDarkColor,
  ),
  centerTitle: true,
  color: kBackgroundColor,
  elevation: 0.0,
);

MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  strengths.forEach((strength) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  });
  return MaterialColor(color.value, swatch);
}
