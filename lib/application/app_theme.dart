import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppThemeData{
  static ThemeData get lightThemeData{
    return ThemeData(
      colorSchemeSeed: AppColors.themeColor,

      inputDecorationTheme: InputDecorationTheme(
        hintStyle: const TextStyle(
          color: Colors.grey
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.borderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.borderColor),
        ),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.themeColor,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 18),
          textStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600
          )
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.themeColor,
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
        ),
      ),
      ),

      textTheme: const TextTheme(
        titleLarge: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w600,
        ),
        bodyMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: AppColors.bodyTextColor,
        ),
      ),

      searchBarTheme: SearchBarThemeData(
        elevation: WidgetStateProperty.all<double>(0.0),
        backgroundColor: WidgetStateProperty.all<Color>(Colors.white),
        shape: WidgetStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
            side: const BorderSide(color: AppColors.borderColor),
          ),
        ),
        padding: const WidgetStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 16.0),
        ),
        hintStyle: WidgetStateProperty.all<TextStyle>(
          const TextStyle(color: Colors.grey),
        ),
      ),

      searchViewTheme: SearchViewThemeData(
        dividerColor: Colors.grey[400],
        headerTextStyle: const TextStyle(
          color: Colors.black87,
        ),
      ),
    );
  }

  static ThemeData get darkThemeData{
    return ThemeData(
      colorSchemeSeed: AppColors.themeColor,
      brightness: Brightness.dark,
    );
  }

}