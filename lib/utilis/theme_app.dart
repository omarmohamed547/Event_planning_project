import 'package:event_planning_ass/utilis/app_colors.dart';
import 'package:flutter/material.dart';

class ThemeApp {
  static final ThemeData lightTheme = ThemeData(
      appBarTheme: AppBarTheme(
          backgroundColor: AppColors.primaryColorLight, toolbarHeight: 120));

  static final ThemeData darkTheme = ThemeData(
      appBarTheme: AppBarTheme(backgroundColor: AppColors.primaryColorDark));
}
