import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _currentThemeMode = ThemeMode.system;

  ThemeMode get currentThemeMode {
    if (_currentThemeMode == ThemeMode.light) {
      return ThemeMode.light;
    } else if (_currentThemeMode == ThemeMode.dark) {
      return ThemeMode.dark;
    } else {
      return ThemeMode.system;
    }
  }

  void setTheme(ThemeMode? themeMode) {
    _currentThemeMode = themeMode!;
    notifyListeners();
  }
}
