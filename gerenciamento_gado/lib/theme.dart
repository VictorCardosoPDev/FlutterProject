import 'package:flutter/material.dart';

final ThemeData gadoTheme = ThemeData(
  primaryColor: Colors.brown[700],
  scaffoldBackgroundColor: Colors.green[100],
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.brown[800],
    titleTextStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: Colors.brown[900]),
    titleLarge: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.green[700],
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  ),
);