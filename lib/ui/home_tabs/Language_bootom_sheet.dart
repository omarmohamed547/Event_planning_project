import 'package:event_planning_ass/utilis/app_style.dart';
import 'package:flutter/material.dart';

class LanguageBootomSheet extends StatelessWidget {
  LanguageBootomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "English",
            style: AppStyle.bold20Primary,
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Text(
            "Arabic",
            style: AppStyle.bold20Black,
          )
        ],
      ),
    );
  }
}
