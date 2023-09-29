import 'package:flutter/material.dart';

class AppTheme {
  const AppTheme._();

  static final ThemeData theme = ThemeData(
    scaffoldBackgroundColor: Colors.blue,
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple),
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.blueAccent,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w700,
        fontSize: 20.0,
      ),
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w700,
        fontSize: 24.0,
      ),
      displaySmall: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w700,
        fontSize: 18.0,
      ),
    ),
  );
}
