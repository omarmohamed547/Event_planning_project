import 'package:event_planning_ass/ui/tabs/love_tab.dart';
import 'package:event_planning_ass/utilis/app_colors.dart';
import 'package:event_planning_ass/utilis/app_style.dart';
import 'package:event_planning_ass/utilis/asset_manager.dart';
import 'package:event_planning_ass/utilis/custom_elevated_button.dart';
import 'package:event_planning_ass/utilis/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RegisterScreen extends StatelessWidget {
  static const String registerScreenId = "RegisterScreen";
  RegisterScreen({super.key});

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
              hintText: AppLocalizations.of(context)!.name,
              prefixIcon: Image.asset("assets/images/UserIcon.png"),
            ),
            SizedBox(
              height: height * 0.02,
            ),
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
            SizedBox(
              height: height * 0.02,
            ),
            CustomTextField(
              margin: EdgeInsets.symmetric(horizontal: width * 0.04),
              hintText: AppLocalizations.of(context)!.repassword,
              suffixxIcon: Image.asset("assets/icons/obscureIcon.png"),
              prefixIcon: Image.asset("assets/icons/passIcon.png"),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            custom_elevated_button(
              onButtonClicked: () {},
              text: AppLocalizations.of(context)!.create_acc,
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Center(
              child: Text.rich(TextSpan(children: [
                TextSpan(
                    text: AppLocalizations.of(context)!.alredy_acc,
                    style:
                        AppStyle.Medium16White.copyWith(color: Colors.black)),
                TextSpan(
                    text: AppLocalizations.of(context)!.login,
                    style: AppStyle.bold20Primary.copyWith(
                        fontSize: 16,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.primaryColorLight)),
              ])),
            ),
            SizedBox(
              height: height * 0.02,
            ),
          ],
        ),
      ),
    );
  }
}
