import 'package:flutter/material.dart';

import 'colors.dart';

ThemeData lightTheme = ThemeData(
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.green,
  ),
  useMaterial3: false,
  primaryColorLight: ThemeColor.mainColor.withOpacity(0.30),
  brightness: Brightness.light,
  scaffoldBackgroundColor: ThemeColor.white,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    unselectedItemColor: ThemeColor.black,
    selectedItemColor: ThemeColor.mainColor,
    elevation: 0,
  ),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(
      color: ThemeColor.black,
      fontSize: 20,
    ),
  ),
  highlightColor: ThemeColor.transparent,
  splashColor: ThemeColor.mainColor,
  appBarTheme: const AppBarTheme(
    color: ThemeColor.white,
    elevation: 0,
  ),
);
