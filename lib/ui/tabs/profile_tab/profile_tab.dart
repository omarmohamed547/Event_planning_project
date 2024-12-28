import 'package:event_planning_ass/providers/app_language_provider.dart';
import 'package:event_planning_ass/providers/app_theme_provider.dart';
import 'package:event_planning_ass/ui/tabs/profile_tab/Language_bootom_sheet.dart';
import 'package:event_planning_ass/ui/tabs/profile_tab/Theme_bottom_sheet.dart';
import 'package:event_planning_ass/utilis/app_colors.dart';
import 'package:event_planning_ass/utilis/app_style.dart';
import 'package:event_planning_ass/utilis/asset_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class profileTab extends StatefulWidget {
  profileTab({super.key});

  @override
  State<profileTab> createState() => _profileTabState();
}

class _profileTabState extends State<profileTab> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColorLight,
        toolbarHeight: height * 0.2,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(38))),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(AssetManager.appbarImageProfile),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "john sawfwt",
                  style: AppStyle.bold24White,
                ),
                Text(
                  "john sawfwt.route@gmail.com",
                  style: AppStyle.Medium16White,
                )
              ],
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              AppLocalizations.of(context)!.language,
              style: AppStyle.bold20Black,
            ),
            SizedBox(
              height: height * 0.02,
            ),
            InkWell(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (builder) {
                      return LanguageBootomSheet();
                    });
              },
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Theme.of(context).primaryColor, width: 1),
                    borderRadius: BorderRadius.circular(12)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      languageProvider.appLanguage == 'en'
                          ? AppLocalizations.of(context)!.english
                          : AppLocalizations.of(context)!.arabic,
                      //AppLocalizations.of(context)!.arabic,
                      style: AppStyle.bold20Primary,
                    ),
                    Image.asset(AssetManager.showmoreIcon)
                  ],
                ),
              ),
            ),
            SizedBox(
              height: height * 0.04,
            ),
            Text(
              AppLocalizations.of(context)!.theme,
              style: AppStyle.bold20Black,
            ),
            SizedBox(
              height: height * 0.02,
            ),
            InkWell(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (builder) {
                      return ThemeBootomSheet();
                    });
              },
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Theme.of(context).primaryColor, width: 1),
                    borderRadius: BorderRadius.circular(12)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      themeProvider.appTheme == ThemeMode.light
                          ? AppLocalizations.of(context)!.light
                          : AppLocalizations.of(context)!.dark,
                      style: AppStyle.bold20Primary,
                    ),
                    Image.asset(AssetManager.showmoreIcon)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
