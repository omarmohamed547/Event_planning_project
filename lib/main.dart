import 'package:event_planning_ass/ui/home_screen.dart';
import 'package:event_planning_ass/utilis/theme_app.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeApp.lightTheme,
      darkTheme: ThemeApp.darkTheme,
      themeMode: ThemeMode.light,
      initialRoute: HomeScreen.homeScreenId,
      routes: {HomeScreen.homeScreenId: (context) => HomeScreen()},
    );
  }
}
