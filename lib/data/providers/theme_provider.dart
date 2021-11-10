import 'package:flutter/material.dart';
import 'package:news_app/data/models/theme_type.dart';

class ThemeProvider extends ChangeNotifier {
  static List<ThemeData> themes = [
    ThemeData(brightness: Brightness.light, primaryColor: Colors.white),
    ThemeData(brightness: Brightness.dark, primaryColor: Colors.black)
  ];

  ThemeType _currentTheme = ThemeType.light;
  ThemeData _currentThemeData = themes[0];

  set currentTheme(theme) {
    if (theme != null) {
      _currentTheme = theme;
      _currentThemeData =
          _currentTheme == ThemeType.light ? themes[0] : themes[1];
      notifyListeners();
    }
  }

  get myTheme => _currentTheme;

  get currentThemeData => _currentThemeData;

  void switchTheme() => _currentTheme == ThemeType.light
      ? currentTheme = ThemeType.dark
      : currentTheme = ThemeType.light;
}
