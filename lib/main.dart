import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_planning_ass/providers/app_language_provider.dart';
import 'package:event_planning_ass/providers/app_theme_provider.dart';
import 'package:event_planning_ass/ui/create_event.dart';
import 'package:event_planning_ass/ui/home_screen.dart';
import 'package:event_planning_ass/ui/login_screen.dart';
import 'package:event_planning_ass/ui/register_scree.dart';
import 'package:event_planning_ass/utilis/theme_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseFirestore.instance.disableNetwork();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => AppLanguageProvider()),
    ChangeNotifierProvider(create: (context) => AppThemeProvider())
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeApp.lightTheme,
      darkTheme: ThemeApp.darkTheme,
      themeMode: themeProvider.appTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(languageProvider.appLanguage),
      initialRoute: LoginScreen.loginScreenId,
      routes: {
        HomeScreen.homeScreenId: (context) => HomeScreen(),
        LoginScreen.loginScreenId: (context) => LoginScreen(),
        RegisterScreen.registerScreenId: (context) => RegisterScreen(),
        CreateEvent.createEventScreenId: (context) => CreateEvent(),
      },
    );
  }
}
