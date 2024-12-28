import 'package:event_planning_ass/ui/home_screen.dart';
import 'package:event_planning_ass/ui/register_scree.dart';
import 'package:event_planning_ass/ui/tabs/love_tab.dart';
import 'package:event_planning_ass/utilis/app_colors.dart';
import 'package:event_planning_ass/utilis/app_style.dart';
import 'package:event_planning_ass/utilis/asset_manager.dart';
import 'package:event_planning_ass/utilis/custom_elevated_button.dart';
import 'package:event_planning_ass/utilis/custom_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginScreen extends StatelessWidget {
  static const String loginScreenId = "LoginScreen";
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          //mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(height: height * 0.3, AssetManager.logoLoginImage),
            CustomTextField(
              margin: EdgeInsets.symmetric(horizontal: width * 0.04),
              hintText: AppLocalizations.of(context)!.email,
              prefixIcon: Image.asset("assets/images/EmailIcon.png"),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            CustomTextField(
              margin: EdgeInsets.symmetric(horizontal: width * 0.04),
              hintText: AppLocalizations.of(context)!.password,
              suffixxIcon: Image.asset("assets/icons/obscureIcon.png"),
              prefixIcon: Image.asset("assets/icons/passIcon.png"),
            ),
            TextButton(
                onPressed: () {},
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    AppLocalizations.of(context)!.forget_pass,
                    style: AppStyle.bold14Primary.copyWith(
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.primaryColorLight,
                        fontSize: 16),
                  ),
                )),
            custom_elevated_button(
              onButtonClicked: () {
                Navigator.pushReplacementNamed(
                    context, HomeScreen.homeScreenId);
              },
              text: AppLocalizations.of(context)!.login,
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Center(
              child: Text.rich(TextSpan(children: [
                TextSpan(
                    text: AppLocalizations.of(context)!.do_not_have_acc,
                    style:
                        AppStyle.Medium16White.copyWith(color: Colors.black)),
                TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pushNamed(
                            context, RegisterScreen.registerScreenId);
                      },
                    text: AppLocalizations.of(context)!.create_acc,
                    style: AppStyle.bold20Primary.copyWith(
                        fontSize: 16,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.primaryColorLight)),
              ])),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Row(
              children: [
                Expanded(
                  child: Divider(
                    thickness: 1.5,
                    color: AppColors.primaryColorLight,
                    indent: 25,
                    endIndent: 25,
                  ),
                ),
                Text(
                  "Or",
                  style: AppStyle.Medium16White.copyWith(
                      color: AppColors.primaryColorLight),
                ),
                Expanded(
                  child: Divider(
                    thickness: 1.5,
                    color: AppColors.primaryColorLight,
                    indent: 25,
                    endIndent: 25,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.02,
            ),
            custom_elevated_button(
              onButtonClicked: () {},
              color: Colors.transparent,
              icon: Image.asset("assets/icons/goggleIcon.png"),
              text: AppLocalizations.of(context)!.log_with_google,
              style: AppStyle.Medium20Primary,
            )
          ],
        ),
      ),
    );
  }
}
