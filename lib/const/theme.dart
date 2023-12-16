import 'package:edeft/const/color.dart';
import 'package:edeft/const/const.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class AppTheme {
  static ThemeData get lightMood => ThemeData(
      // Text input theme
      iconTheme: IconThemeData(color: UiColor.extraDarkGreyColor),
      primaryTextTheme: GoogleFonts.poppinsTextTheme(),
      scrollbarTheme: ScrollbarThemeData(thumbColor: MaterialStateProperty.all<Color>(UiColor.darkGreyColor), trackColor: MaterialStateProperty.all<Color>(UiColor.primaryColor.withOpacity(0.2)), trackVisibility: MaterialStateProperty.all<bool>(false)),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        labelStyle: TextStyle(color: UiColor.primaryTextColor),
        hintStyle: TextStyle(color: UiColor.primaryTextColor),
        helperStyle: TextStyle(color: UiColor.primaryTextColor),
        iconColor: UiColor.primaryTextColor,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: UiColor.greyColor, width: 1),
          borderRadius: const BorderRadius.all(Radius.circular(ThemeConst.defaultBorderRadius - 7)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: UiColor.greyColor, width: 1),
          borderRadius: const BorderRadius.all(Radius.circular(ThemeConst.defaultBorderRadius - 7)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: UiColor.greyColor, width: 1),
          borderRadius: const BorderRadius.all(Radius.circular(ThemeConst.defaultBorderRadius - 7)),
        ),
      ),
      popupMenuTheme: PopupMenuThemeData(color: UiColor.extraDarkGreyColor, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(ThemeConst.defaultBorderRadius))),
      primaryColor: UiColor.primaryColor,
      textTheme: GoogleFonts.poppinsTextTheme().copyWith(displayLarge: TextStyle(fontSize: 72.0, fontWeight: FontWeight.w900, color: UiColor.primaryTextColor), titleLarge: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic, fontWeight: FontWeight.w700, color: UiColor.primaryTextColor), bodyMedium: TextStyle(fontSize: 14.0, color: UiColor.primaryTextColor), bodySmall: TextStyle(fontSize: 12.0, color: UiColor.secondaryTextColor)),
      // Card Theme
      cardTheme: CardTheme(color: UiColor.cardOnBackgroundColor, elevation: ThemeConst.defaultElevation, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(ThemeConst.defaultBorderRadius), side: const BorderSide(color: Colors.transparent))),
      // Background Color
      scaffoldBackgroundColor: UiColor.scaffoldBackgroundColor,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        background: UiColor.scaffoldBackgroundColor,
        primary: UiColor.primaryColor,
        secondary: UiColor.primaryColor,
        surface: UiColor.scaffoldBackgroundColor,
        onPrimary: UiColor.primaryTextColor,
        onSecondary: UiColor.primaryTextColor,
        onSurface: UiColor.primaryTextColor,
        onBackground: UiColor.primaryTextColor,
        brightness: Brightness.dark,
        error: UiColor.errorColor,
        onError: UiColor.onErrorColor,
      ));

  static ThemeData get darkThemeData => lightMood.copyWith(
        primaryColor: UiColor.primaryColor,
        textTheme: TextTheme(
          displayLarge: TextStyle(fontSize: 72.0, fontWeight: FontWeight.w900, color: UiColor.primaryTextColor),
          titleLarge: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic, fontWeight: FontWeight.w700, color: UiColor.primaryTextColor),
          bodyMedium: TextStyle(fontSize: 14.0, color: UiColor.primaryTextColor),
          bodySmall: TextStyle(fontSize: 12.0, color: UiColor.secondaryTextColor),
        ),
        // Card Theme
        cardTheme: CardTheme(color: UiColor.cardOnBackgroundColor, elevation: ThemeConst.defaultElevation, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(ThemeConst.defaultBorderRadius), side: const BorderSide(color: Colors.transparent))),
        // Background Color
        scaffoldBackgroundColor: UiColor.scaffoldBackgroundColor,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          background: UiColor.scaffoldBackgroundColor,
          primary: UiColor.primaryColor,
          secondary: UiColor.primaryColor,
          surface: UiColor.scaffoldBackgroundColor,
          onPrimary: UiColor.primaryTextColor,
          onSecondary: UiColor.primaryTextColor,
          onSurface: UiColor.primaryTextColor,
          onBackground: UiColor.primaryTextColor,
          brightness: Brightness.dark,
          error: UiColor.errorColor,
          onError: UiColor.onErrorColor,
        ),
      );
}
