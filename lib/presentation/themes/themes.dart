import 'package:flutter/material.dart';
import 'package:medical_app/utils/constants.dart';

class MyThemes {
  const MyThemes._();

  static ThemeData light() {
    return ThemeData(
      primaryColor: primaryColor,
      scaffoldBackgroundColor: Color(0xFFEFEFF1),
      textTheme: TextTheme(
          bodyLarge: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w700, fontSize: 20),
          bodySmall: TextStyle(
            color: Color(0xFF515151),
            fontSize: 16,
            fontFamily: 'SF Pro Display',
            fontWeight: FontWeight.w500,

          )),
      appBarTheme: const AppBarTheme(backgroundColor: Colors.redAccent),
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
    );
  }

  static ThemeData dark() {
    return ThemeData(
      primaryColor: primaryColorDark,
      scaffoldBackgroundColor: Color(0xFF012E2C),
      textTheme: TextTheme(
          bodyLarge: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
          bodySmall: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: 'SF Pro Display',
            fontWeight: FontWeight.w500,
          )),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.grey,
        centerTitle: true,
      ),
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
    );
  }
}
