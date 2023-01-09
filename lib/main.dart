import 'package:expenses/pages/home.dart';
import 'package:expenses/theme/app_theme.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(ExpensesApp());
}

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      theme: AppTheme().getLightTheme(),
      darkTheme: AppTheme().getDarkTheme(),
      themeMode: ThemeMode.system,
    );
  }
}
