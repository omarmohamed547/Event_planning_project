import 'package:event_planning_ass/providers/app_language_provider.dart';
import 'package:event_planning_ass/providers/app_theme_provider.dart';
import 'package:event_planning_ass/utilis/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class ThemeBootomSheet extends StatefulWidget {
  ThemeBootomSheet({super.key});

  @override
  State<ThemeBootomSheet> createState() => _ThemeBootomSheetState();
}

class _ThemeBootomSheetState extends State<ThemeBootomSheet> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var themeProvider = Provider.of<AppThemeProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
              onTap: () {
                themeProvider.changeAppTheme(ThemeMode.light);
                setState(() {});
              },
              child: themeProvider.appTheme == ThemeMode.light
                  ? SelectedWidget(
                      text: AppLocalizations.of(context)!.light,
                    )
                  : UnSelectedWidget(
                      text: AppLocalizations.of(context)!.light,
                    )),
          SizedBox(
            height: height * 0.02,
          ),
          InkWell(
            onTap: () {
              themeProvider.changeAppTheme(ThemeMode.dark);
              setState(() {});
            },
            child: themeProvider.appTheme == ThemeMode.dark
                ? SelectedWidget(
                    text: AppLocalizations.of(context)!.dark,
                  )
                : UnSelectedWidget(
                    text: AppLocalizations.of(context)!.dark,
                  ),
          )
        ],
      ),
    );
  }
}

class UnSelectedWidget extends StatelessWidget {
  String text;
  UnSelectedWidget({
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppStyle.bold20Black,
    );
  }
}

class SelectedWidget extends StatelessWidget {
  String text;
  SelectedWidget({
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          //AppLocalizations.of(context)!.english,
          style: AppStyle.bold20Primary,
        ),
        Icon(
          Icons.check,
          size: 24,
          color: Theme.of(context).primaryColor,
        )
      ],
    );
  }
}
