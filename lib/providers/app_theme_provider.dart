import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppThemeProvider extends ChangeNotifier {
  //data
  ThemeMode appTheme = ThemeMode.light;
  AppThemeProvider() {
    loadThemeApp();
  }

  //func to change data
  void changeAppTheme(ThemeMode newTheme) async {
    if (newTheme == appTheme) {
      return;
    } else {
      appTheme = newTheme;
      notifyListeners();
    }
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("theme", "$newTheme");
  }

  Future loadThemeApp() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String savedTheme = prefs.getString("theme") ?? "${ThemeMode.light}";

    if (savedTheme == "${ThemeMode.dark}") {
      appTheme = ThemeMode.dark;
    } else if (savedTheme == "${ThemeMode.system}") {
      appTheme = ThemeMode.system;
    } else {
      appTheme = ThemeMode.light;
    }

    notifyListeners();
  }
}
