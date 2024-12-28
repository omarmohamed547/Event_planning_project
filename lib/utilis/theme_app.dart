import 'package:event_planning_ass/utilis/app_colors.dart';
import 'package:event_planning_ass/utilis/app_style.dart';
import 'package:flutter/material.dart';

class ThemeApp {
  static final ThemeData lightTheme = ThemeData(
      primaryColor: AppColors.primaryColorLight,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: AppColors.primaryColorLight,
          shape:
              StadiumBorder(side: BorderSide(width: 4, color: Colors.white))),
      // appBarTheme: AppBarTheme(backgroundColor: AppColors.primaryColorLight, toolbarHeight: 120),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          elevation: 0,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          selectedLabelStyle: AppStyle.bold12White));

  static final ThemeData darkTheme = ThemeData(
      primaryColor: AppColors.primaryColorDark,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: AppColors.primaryColorDark,
          shape:
              StadiumBorder(side: BorderSide(width: 4, color: Colors.white))),
      appBarTheme: AppBarTheme(backgroundColor: AppColors.primaryColorDark),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          elevation: 0,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          selectedLabelStyle: AppStyle.bold12White));
}
