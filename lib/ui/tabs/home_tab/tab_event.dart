import 'package:event_planning_ass/utilis/app_colors.dart';
import 'package:event_planning_ass/utilis/app_style.dart';
import 'package:flutter/material.dart';

class TabEvent extends StatelessWidget {
  String eventName;
  bool isSelected;
  Color? color;
  Color? borderColor;
  TextStyle? textStyle;

  TabEvent(
      {super.key,
      this.borderColor,
      this.textStyle,
      required this.eventName,
      required this.isSelected,
      this.color});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.04, vertical: height * 0.006),
      decoration: BoxDecoration(
          color: color ?? (isSelected ? Colors.white : Colors.transparent),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(width: 1.3, color: borderColor ?? Colors.white)),
      child: Center(
        child: Text(eventName,
            style: textStyle ??
                (isSelected
                    ? AppStyle.Medium16White.copyWith(
                        color: AppColors.primaryColorLight)
                    : AppStyle.Medium16White)),
      ),
    );
  }
}
