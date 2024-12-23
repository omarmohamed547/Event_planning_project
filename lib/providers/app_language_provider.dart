import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLanguageProvider extends ChangeNotifier {
  //data
  String appLanguage = "en";
  //func to change data
  AppLanguageProvider() {
    _loadAppLanguage(); // Load language on initialization
  }

  Future<void> _loadAppLanguage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    appLanguage = prefs.getString('language') ?? "en";
    notifyListeners(); // Notify listeners to update UI
  }

  Future<void> changeAppLanguage(String newLanguage) async {
    if (newLanguage == appLanguage)
      return;
    else {
      appLanguage = newLanguage;
      notifyListeners();
    }

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', newLanguage);
  }
}
