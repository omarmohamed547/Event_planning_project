import 'package:event_planning_ass/utilis/app_colors.dart';
import 'package:event_planning_ass/utilis/app_style.dart';
import 'package:event_planning_ass/utilis/asset_manager.dart';
import 'package:flutter/material.dart';

class EventItem extends StatelessWidget {
  const EventItem({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height * 0.24,
        width: width * 0.91,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
                image: AssetImage(
                  AssetManager.birthdayImage,
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
                  children: [
                    Text(
                      "21",
                      style: AppStyle.bold20Primary,
                    ),
                    Text(
                      "Nov",
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
                    "This is a Birthday Party ",
                    style: AppStyle.bold14Primary.copyWith(color: Colors.black),
                  ),
                  Icon(
                    Icons.favorite,
                    color: AppColors.primaryColorLight,
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
