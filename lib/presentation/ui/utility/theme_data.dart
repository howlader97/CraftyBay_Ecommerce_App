import 'package:flutter/material.dart';

ThemeData themeData() {
  return ThemeData(
    /* primarySwatch: MaterialColor(
          AppColors.primaryColor.value,
          AppColors().color,
        ),*/
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 0,
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFF07ADAE)),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF07ADAE),
        padding: EdgeInsets.symmetric(vertical: 12),
        textStyle: TextStyle(
          fontSize: 16,
          letterSpacing: 0.5,
          fontWeight: FontWeight.w500,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
  );

}