import 'package:event_planning_ass/providers/event_list_provider.dart';
import 'package:event_planning_ass/providers/user_provider.dart';
import 'package:event_planning_ass/ui/tabs/home_tab/EventItem.dart';
import 'package:event_planning_ass/utilis/app_colors.dart';
import 'package:event_planning_ass/utilis/app_style.dart';
import 'package:event_planning_ass/utilis/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoveTab extends StatefulWidget {
  LoveTab({super.key});

  @override
  State<LoveTab> createState() => _LoveTabState();
}

class _LoveTabState extends State<LoveTab> {
  late TextEditingController loveController;

  @override
  void initState() {
    super.initState();
    loveController = TextEditingController();

    // Ensure favourite events are loaded when the screen is first opened
    final eventProvider =
        Provider.of<EventListProvider>(context, listen: false);

    final userProvider = Provider.of<UserProvider>(context, listen: false);
    eventProvider.getFavouriteEvent(userProvider.currentuser!.id!);
  }

  @override
  void dispose() {
    loveController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    EventListProvider eventprovider = Provider.of<EventListProvider>(context);
    var userprovider = Provider.of<UserProvider>(context);
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: height * 0.05,
          ),
          CustomTextField(
              controller: loveController,
              onChanged: (text) {
                setState(() {
                  if (text.isEmpty) {
                    eventprovider.favouriteList = eventprovider.favouriteList;
                    eventprovider
                        .getFavouriteEvent(userprovider.currentuser!.id!);
                  } else {
                    eventprovider.favouriteList =
                        eventprovider.favouriteList.where((event) {
                      return event.eventName
                          .toLowerCase()
                          .contains(text.toLowerCase());
                    }).toList();
                  }
                });
              },
              margin: EdgeInsets.symmetric(horizontal: width * 0.03),
              hintText: "Search for Event",
              borderColor: AppColors.primaryColorLight,
              hintStyle: AppStyle.bold14Primary,
              prefixIcon: Image.asset("assets/icons/searchIcon.png")),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.04),
              child: eventprovider.favouriteList.isEmpty
                  ? const Center(child: Text("No Favourite Items Found"))
                  : ListView.separated(
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: height * 0.02,
                        );
                      },
                      itemCount: eventprovider.favouriteList.length,
                      itemBuilder: (context, index) {
                        return EventItem(
                          height: height,
                          width: width,
                          eventModelobj: eventprovider.favouriteList[index],
                        );
                      }),
            ),
          )
        ],
      ),
    );
  }
}
