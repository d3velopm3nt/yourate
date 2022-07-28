import 'package:flutter/material.dart';

class Constants {
  static String appName = "YouRate";

    //Colors for theme
  static Color lightPrimary = Colors.deepOrange;
  static MaterialColor lightPrimaryMat = Colors.deepOrange;
  static Color darkPrimary =  Colors.black;
  static Color darkBG = Colors.black;
  static Color lightAccent =const Color(0xff5563ff);
  static Color darkAccent =const Color(0xff5563ff);
  static Color lightBG = const Color(0xfffcfcff);

    static ThemeData lightTheme = ThemeData(
    backgroundColor: lightBG,
    primaryColor: lightPrimary,
    primarySwatch: lightPrimaryMat,
    secondaryHeaderColor: lightAccent,
  textTheme: TextTheme(
        headline6: TextStyle(
          color: darkBG,
          fontSize: 18.0,
          fontWeight: FontWeight.w800,
        ),
      ),
    scaffoldBackgroundColor: lightBG,
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    backgroundColor: darkBG,
    primaryColor: darkPrimary,
    textTheme:TextTheme(
        headline6: TextStyle(
          color: lightBG,
          fontSize: 18.0,
          fontWeight: FontWeight.w800,
        ),
      ),
    scaffoldBackgroundColor: darkBG,
  );
}
