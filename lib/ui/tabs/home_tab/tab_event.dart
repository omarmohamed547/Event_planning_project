import 'package:event_planning_ass/utilis/app_colors.dart';
import 'package:event_planning_ass/utilis/app_style.dart';
import 'package:flutter/material.dart';

class TabEvent extends StatelessWidget {
  String eventName;
  bool isSelected;
  TabEvent({super.key, required this.eventName, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.04, vertical: height * 0.004),
      decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(width: 2, color: Colors.white)),
      child: Text(
        eventName,
        style: isSelected
            ? AppStyle.Medium16White.copyWith(
                color: AppColors.primaryColorLight)
            : AppStyle.Medium16White,
      ),
    );
  }
}
