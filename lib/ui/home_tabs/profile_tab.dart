import 'package:event_planning_ass/ui/home_tabs/Language_bootom_sheet.dart';
import 'package:event_planning_ass/utilis/app_style.dart';
import 'package:event_planning_ass/utilis/asset_manager.dart';
import 'package:flutter/material.dart';

class profileTab extends StatelessWidget {
  profileTab({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: height * 0.17,
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
              "Language",
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
                      "Arabic",
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
              "Theme",
              style: AppStyle.bold20Black,
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Theme.of(context).primaryColor, width: 1),
                  borderRadius: BorderRadius.circular(12)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Light",
                    style: AppStyle.bold20Primary,
                  ),
                  Image.asset(AssetManager.showmoreIcon)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
