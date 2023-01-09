import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme();

  final primaryColor = Colors.purple;
  final primaryColorDark = Colors.purple[200];
  final secondaryColor = Colors.amber;
  final secondaryColorDark = Colors.amber[200];

  ThemeData getLightTheme() {
    ThemeData lightTheme = ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        fontFamily: 'QuickSand',
        appBarTheme: AppBarTheme(
            titleTextStyle: TextStyle(
          color: primaryColor,
        )));

    ThemeData theme = lightTheme.copyWith(
      primaryColor: primaryColor,
      colorScheme: lightTheme.colorScheme.copyWith(
        primary: primaryColor,
        secondary: secondaryColor,
        surfaceTint: Colors.white,
      ),
      textTheme: lightTheme.textTheme.copyWith(
        headline6: TextStyle(
          fontFamily: 'OpenSans',
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      buttonTheme: lightTheme.buttonTheme.copyWith(
        buttonColor: primaryColor,
      ),
      floatingActionButtonTheme: lightTheme.floatingActionButtonTheme.copyWith(
        backgroundColor: secondaryColor,
      ),
      appBarTheme: lightTheme.appBarTheme.copyWith(
        titleTextStyle: TextStyle(
          fontFamily: 'OpenSans',
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
      ),
      cupertinoOverrideTheme: CupertinoThemeData(
        brightness: Brightness.light,
        primaryColor: primaryColor,
        barBackgroundColor: Colors.white,
        textTheme: CupertinoTextThemeData(
          navTitleTextStyle: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: primaryColor,
          ),
        ),
      ),
    );

    return theme;
  }

  ThemeData getDarkTheme() {
    ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      fontFamily: 'QuickSand',
    );

    ThemeData theme = darkTheme.copyWith(
      primaryColor: primaryColorDark,
      colorScheme: darkTheme.colorScheme.copyWith(
        primary: primaryColorDark,
        secondary: secondaryColor,
        surfaceTint: Colors.white,
      ),
      textTheme: darkTheme.textTheme.copyWith(
        headline6: TextStyle(
          fontFamily: 'OpenSans',
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      buttonTheme: darkTheme.buttonTheme.copyWith(
        buttonColor: primaryColorDark,
      ),
      floatingActionButtonTheme: darkTheme.floatingActionButtonTheme.copyWith(
        backgroundColor: secondaryColor,
      ),
      appBarTheme: darkTheme.appBarTheme.copyWith(
        titleTextStyle: TextStyle(
          fontFamily: 'OpenSans',
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: primaryColorDark,
        ),
      ),
      cupertinoOverrideTheme: CupertinoThemeData(
        brightness: Brightness.dark,
        primaryColor: primaryColorDark,
        barBackgroundColor: Colors.grey.shade800,
        textTheme: CupertinoTextThemeData(
          navTitleTextStyle: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: primaryColorDark,
          ),
        ),
      ),
    );

    return theme;
  }

  CupertinoThemeData getIosTheme() {
    CupertinoThemeData mainTheme = CupertinoThemeData();

    CupertinoThemeData theme = mainTheme.copyWith(
      primaryColor: primaryColor,
      textTheme: mainTheme.textTheme.copyWith(
        actionTextStyle: mainTheme.textTheme.actionTextStyle.copyWith(
          fontFamily: 'OpenSans',
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );

    return theme;
  }
}
