import 'package:event_planning_ass/providers/app_language_provider.dart';
import 'package:event_planning_ass/utilis/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class LanguageBootomSheet extends StatefulWidget {
  LanguageBootomSheet({super.key});

  @override
  State<LanguageBootomSheet> createState() => _LanguageBootomSheetState();
}

class _LanguageBootomSheetState extends State<LanguageBootomSheet> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var languageProvider = Provider.of<AppLanguageProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
              onTap: () {
                languageProvider.changeAppLanguage("en");
                setState(() {});
              },
              child: languageProvider.appLanguage == "en"
                  ? SelectedWidget(
                      text: AppLocalizations.of(context)!.english,
                    )
                  : UnSelectedWidget(
                      text: AppLocalizations.of(context)!.english,
                    )),
          SizedBox(
            height: height * 0.02,
          ),
          InkWell(
            onTap: () {
              languageProvider.changeAppLanguage("ar");
            },
            child: languageProvider.appLanguage == "ar"
                ? SelectedWidget(
                    text: AppLocalizations.of(context)!.arabic,
                  )
                : UnSelectedWidget(
                    text: AppLocalizations.of(context)!.arabic,
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
