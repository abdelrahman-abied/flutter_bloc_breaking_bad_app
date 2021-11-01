import '/utils/style.dart';
import 'package:flutter/material.dart';

class AppTheme {
  final lightTheme = ThemeData(
      primaryColor: primaryColor,
      // fontFamily: '',
      scaffoldBackgroundColor: primaryColor,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      appBarTheme: const AppBarTheme(
        backgroundColor: primaryColor,
        iconTheme: IconThemeData(
          color: secondaryColor,
        ),
      )
      // errorColor: secondaryColor,
      );
  final darkTheme = ThemeData(
      primaryColor: primaryColor,
      scaffoldBackgroundColor: const Color(0xFF212121),
      // fontFamily: '',
      visualDensity: VisualDensity.adaptivePlatformDensity,
      appBarTheme: const AppBarTheme(backgroundColor: primaryColor));
}
