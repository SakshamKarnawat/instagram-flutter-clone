import 'package:flutter/material.dart';

enum Themes { lightTheme, darkTheme }

class ThemeProvider extends ChangeNotifier {
  static Themes _appTheme = Themes.darkTheme;

  Themes get appTheme => _appTheme;

  void changeAppTheme(Themes theme) {
    _appTheme = theme;
    notifyListeners();
  }
}
