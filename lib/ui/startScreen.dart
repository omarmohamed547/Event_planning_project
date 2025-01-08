import 'package:event_planning_ass/providers/app_language_provider.dart';
import 'package:event_planning_ass/providers/app_theme_provider.dart';
import 'package:event_planning_ass/ui/OnBoarding_Screen.dart';
import 'package:event_planning_ass/ui/home_screen.dart';
import 'package:event_planning_ass/utilis/app_colors.dart';
import 'package:event_planning_ass/utilis/app_style.dart';
import 'package:event_planning_ass/utilis/asset_manager.dart';
import 'package:event_planning_ass/utilis/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class StartScreen extends StatelessWidget {
  static String startScreenId = "StartScreen";
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Image.asset("assets/images/appBarOnboarding.png")),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Image.asset(AssetManager.firstintroScreen),
            SizedBox(
              height: height * 0.02,
            ),
            Text(
              "Personalize Your Experience",
              style: AppStyle.bold20Primary,
            ),
            SizedBox(
              height: height * 0.03,
            ),
            Text(
              "Choose your preferred theme and language to get started with a comfortable, tailored experience that suits your style.",
              style: AppStyle.Medium16Black,
            ),
            SizedBox(
              height: height * 0.03,
            ),
            ChooseThemeOrLanguage(
              width: width,
              text: AppLocalizations.of(context)!.language,
              imageOnefunc: () {
                languageProvider.changeAppLanguage("ar");
              },
              imageOne: "assets/images/LR.png",
              imageTwofunc: () {
                languageProvider.changeAppLanguage("en");
              },
              secondImage: "assets/images/EG.png",
            ),
            SizedBox(
              height: height * 0.03,
            ),
            ChooseThemeOrLanguage(
              width: width,
              text: AppLocalizations.of(context)!.theme,
              imageOnefunc: () {
                themeProvider.changeAppTheme(ThemeMode.light);
              },
              imageOne: "assets/images/Sun (1).png",
              imageTwofunc: () {
                themeProvider.changeAppTheme(ThemeMode.dark);
              },
              secondImage: "assets/images/Moon.png",
            ),
            SizedBox(
              height: height * 0.03,
            ),
            custom_elevated_button(
                paddingContainer: EdgeInsets.symmetric(horizontal: 0),
                paddingHeight: EdgeInsets.symmetric(vertical: height * 0.01),
                onButtonClicked: () {
                  Navigator.pushReplacementNamed(
                      context, OnboardingScreen.onBoardingId);
                },
                text: "Let’s Start")
          ]),
        ),
      ),
    );
  }
}

class ChooseThemeOrLanguage extends StatelessWidget {
  String text;
  String imageOne;
  String secondImage;
  void Function()? imageOnefunc;
  void Function()? imageTwofunc;

  ChooseThemeOrLanguage({
    super.key,
    this.imageOnefunc,
    this.imageTwofunc,
    required this.width,
    required this.text,
    required this.imageOne,
    required this.secondImage,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: AppStyle.Medium20Primary,
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border:
                  Border.all(width: 1.5, color: AppColors.primaryColorLight)),
          child: Row(
            children: [
              Container(
                  decoration: BoxDecoration(
                      color: AppColors.primaryColorLight,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                          width: 1.8, color: AppColors.primaryColorLight)),
                  child: InkWell(
                      onTap: imageOnefunc, child: Image.asset(imageOne))),
              SizedBox(
                width: width * 0.02,
              ),
              InkWell(onTap: imageTwofunc, child: Image.asset(secondImage))
            ],
          ),
        )
      ],
    );
  }
}
