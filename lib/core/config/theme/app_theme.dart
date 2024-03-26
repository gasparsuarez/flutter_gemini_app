import 'package:flutter/material.dart';

class AppTheme {
  ///
  /// App theme configuration
  ///
  static ThemeData get theme => ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          isDense: true,
          fillColor: Colors.grey[300],
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(18),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(18),
          ),
        ),
      );
}
