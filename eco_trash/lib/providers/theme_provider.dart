import 'package:eco_trash/themes/themes.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.dark;

  ThemeMode get themeMode => _themeMode;

  ThemeData get themeData => echoTrashTheme;

  void toggleTheme(bool isDarkMode) {
    _themeMode = ThemeMode.dark;
    notifyListeners();
  }
}