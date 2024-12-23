import 'package:event_planning_ass/ui/tabs/tab_event.dart';
import 'package:event_planning_ass/utilis/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeTab extends StatefulWidget {
  int isSelected = 0;

  HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    List<String> eventNameList = [
      AppLocalizations.of(context)!.all,
      AppLocalizations.of(context)!.sport,
      AppLocalizations.of(context)!.birthday,
      AppLocalizations.of(context)!.metting,
      AppLocalizations.of(context)!.bookclub,
      AppLocalizations.of(context)!.eating,
      AppLocalizations.of(context)!.exhibition,
      AppLocalizations.of(context)!.workshop,
      AppLocalizations.of(context)!.gaming,
    ];
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: width * 0.03),
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(28),
                bottomRight: Radius.circular(28))),
        height: height * 0.20,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.wlcome_back,
                      style: AppStyle.Medium16White.copyWith(fontSize: 14),
                    ),
                    Text(
                      AppLocalizations.of(context)!.john_safwat,
                      style: AppStyle.bold24White,
                    )
                  ],
                ),
                Row(
                  children: [
                    Image.asset("assets/images/sunnyIcon.png"),
                    SizedBox(
                      width: width * 0.02,
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        "En",
                        style: AppStyle.bold20Primary.copyWith(fontSize: 14),
                      ),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: height * 0.004,
            ),
            Row(
              children: [
                Image.asset("assets/images/locIcon.png"),
                SizedBox(
                  width: width * 0.01,
                ),
                Text(
                  "${AppLocalizations.of(context)!.cairo},",
                  style: AppStyle.Medium16White.copyWith(fontSize: 14),
                ),
                Text(
                  AppLocalizations.of(context)!.egypt,
                  style: AppStyle.Medium16White.copyWith(fontSize: 14),
                )
              ],
            ),
            DefaultTabController(
                length: eventNameList.length,
                child: TabBar(
                    onTap: (index) {
                      widget.isSelected = index;
                      setState(() {});
                    },
                    isScrollable: true,
                    dividerColor: Colors.transparent,
                    tabAlignment: TabAlignment.start,
                    indicatorColor: Colors.transparent,
                    labelPadding: EdgeInsets.symmetric(
                        horizontal: width * 0.02, vertical: height * 0.01),
                    tabs: eventNameList.map((eventName) {
                      return TabEvent(
                          eventName: eventName,
                          isSelected: widget.isSelected ==
                              eventNameList.indexOf(eventName));
                    }).toList())),
          ],
        ),
      ),
    );
  }
}
