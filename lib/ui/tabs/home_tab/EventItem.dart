import 'package:event_planning_ass/model/Event_model.dart';
import 'package:event_planning_ass/providers/event_list_provider.dart';
import 'package:event_planning_ass/providers/user_provider.dart';
import 'package:event_planning_ass/utilis/app_colors.dart';
import 'package:event_planning_ass/utilis/app_style.dart';
import 'package:event_planning_ass/utilis/asset_manager.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class EventItem extends StatefulWidget {
  EventModel eventModelobj;
  EventItem({
    required this.eventModelobj,
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  State<EventItem> createState() => _EventItemState();
}

class _EventItemState extends State<EventItem> {
  @override
  Widget build(BuildContext context) {
    var eventProvider = Provider.of<EventListProvider>(context);
    var userprovider = Provider.of<UserProvider>(context);

    return Container(
        height: widget.height * 0.24,
        width: widget.width * 0.91,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
                image: AssetImage(
                  widget.eventModelobj.image,
                ),
                fit: BoxFit.fill)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                padding: EdgeInsets.symmetric(horizontal: 6),
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      widget.eventModelobj.dateTime.day.toString(),
                      style: AppStyle.bold20Primary,
                    ),
                    Text(
                      DateFormat.MMM().format(widget.eventModelobj.dateTime),
                      style: AppStyle.bold14Primary,
                    )
                  ],
                )),
            Container(
              padding: EdgeInsets.all(6),
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8), color: Colors.white),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.eventModelobj.title,
                    style: AppStyle.bold14Primary.copyWith(color: Colors.black),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        // Update the database and local state
                        eventProvider.updateFavouriteFunc(widget.eventModelobj,
                            userprovider.currentuser!.id!);
                      });
                    },
                    child: widget.eventModelobj.isFavourite == true
                        ? Image.asset("assets/icons/iconFavouriteSelected.png")
                        : Image.asset("assets/icons/iconfavunSelected.png"),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
