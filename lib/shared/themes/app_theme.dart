import 'package:copia_insta_tent1/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

class AppThemes {
  static ThemeData mainTheme = ThemeData(
    primaryColor: const Color.fromARGB(255, 153, 11, 189),
    scaffoldBackgroundColor: AppColors.background,
    iconTheme: const IconThemeData(
      color: AppColors.primary,
    ),
    listTileTheme: const ListTileThemeData(
      iconColor: AppColors.primary,
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.resolveWith((states) {
          return AppColors.primary;
        }),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          return AppColors.primary;
        }),
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(),
      filled: true,
      fillColor: AppColors.background,
      focusColor: AppColors.primary,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.secondDegrade, width: 2.0),
      ),
      floatingLabelStyle: TextStyle(
        color: AppColors.primary,
      ),
      contentPadding: EdgeInsets.symmetric(
        vertical: 22,
        horizontal: 26,
      ),
      labelStyle: TextStyle(
        fontSize: 20,
        decorationColor: AppColors.primary,
      ),
      iconColor: AppColors.primary,
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.primary,
      selectionColor: AppColors.secondDegrade,
      selectionHandleColor: AppColors.primary,
    ),
    cardColor: AppColors.cardColor,
  );
}
