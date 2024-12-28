import 'package:event_planning_ass/utilis/app_colors.dart';
import 'package:event_planning_ass/utilis/app_style.dart';
import 'package:flutter/material.dart';

class ChooseDateOrTime extends StatelessWidget {
  String textEvent;
  String textChoose;
  Widget icon;
  TextStyle? style;
  void Function()? onTap;
  ChooseDateOrTime({
    this.style,
    this.onTap,
    required this.icon,
    required this.textChoose,
    required this.textEvent,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            icon,
            SizedBox(
              width: width * 0.02,
            ),
            Text(
              textEvent,
              style: AppStyle.Medium16Black,
            ),
          ],
        ),
        InkWell(
          onTap: onTap,
          child: Text(textChoose, style: style),
        ),
      ],
    );
  }
}
