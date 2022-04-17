import 'package:aplikasi_shopii/helpers/theme_pref.dart';
import 'package:flutter/material.dart';

class ThemeDarkProvider with ChangeNotifier {
  ThemeDarkPreferences themeDarkPreferences = ThemeDarkPreferences();
  bool _darkTheme = false;
  bool get darkTheme => _darkTheme;

  set darkTheme(bool value) {
    _darkTheme = value;
    themeDarkPreferences.setDarkTheme(value);
    notifyListeners();
  }
}
