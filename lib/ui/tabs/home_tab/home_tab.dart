import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_planning_ass/firebase_utilis.dart';
import 'package:event_planning_ass/model/Event_model.dart';
import 'package:event_planning_ass/providers/event_list_provider.dart';
import 'package:event_planning_ass/providers/user_provider.dart';
import 'package:event_planning_ass/ui/tabs/home_tab/EventItem.dart';
import 'package:event_planning_ass/ui/tabs/home_tab/tab_event.dart';
import 'package:event_planning_ass/utilis/app_colors.dart';
import 'package:event_planning_ass/utilis/app_style.dart';
import 'package:event_planning_ass/utilis/asset_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class HomeTab extends StatefulWidget {
  HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    UserProvider userprovider = Provider.of<UserProvider>(context);

    EventListProvider eventprovider = Provider.of<EventListProvider>(context);
    eventprovider.returneventNameList(context);
    if (eventprovider.eventsList.isEmpty) {
      eventprovider.getAllEvent(userprovider.currentuser!.id!);
    }

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: width * 0.03),
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(28),
                    bottomRight: Radius.circular(28))),
            height: height * 0.22,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.05,
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
                          userprovider.currentuser!.name!,
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
                            style:
                                AppStyle.bold20Primary.copyWith(fontSize: 14),
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
                    length: eventprovider.eventNameList.length,
                    child: TabBar(
                        onTap: (index) {
                          eventprovider.changeIndex(
                              index, userprovider.currentuser!.id!);
                        },
                        isScrollable: true,
                        dividerColor: Colors.transparent,
                        tabAlignment: TabAlignment.start,
                        indicatorColor: Colors.transparent,
                        labelPadding: EdgeInsets.symmetric(
                            horizontal: width * 0.02, vertical: height * 0.01),
                        tabs: eventprovider.eventNameList.map((eventName) {
                          return TabEvent(
                              eventName: eventName,
                              isSelected: eventprovider.selectedIndex ==
                                  eventprovider.eventNameList
                                      .indexOf(eventName));
                        }).toList())),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.04),
              child: eventprovider.filterList.isEmpty
                  ? Center(child: Text("No Items Found"))
                  : ListView.separated(
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: height * 0.02,
                        );
                      },
                      itemCount: eventprovider.filterList.length,
                      itemBuilder: (context, index) {
                        return EventItem(
                          height: height,
                          width: width,
                          eventModelobj: eventprovider.filterList[index],
                        );
                      }),
            ),
          )
        ],
      ),
    );
  }
}
