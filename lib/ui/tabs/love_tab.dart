import 'package:event_planning_ass/ui/tabs/home_tab/EventItem.dart';
import 'package:event_planning_ass/utilis/app_colors.dart';
import 'package:event_planning_ass/utilis/app_style.dart';
import 'package:event_planning_ass/utilis/custom_text_field.dart';
import 'package:flutter/material.dart';

class LoveTab extends StatelessWidget {
  LoveTab({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: height * 0.05,
          ),
          CustomTextField(
              hintText: "Search for Event",
              borderColor: AppColors.primaryColorLight,
              hintStyle: AppStyle.bold14Primary,
              prefixIcon: Image.asset("assets/icons/searchIcon.png")),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.04),
              child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: height * 0.02,
                    );
                  },
                  itemCount: 7,
                  itemBuilder: (context, index) {
                    return EventItem(height: height, width: width);
                  }),
            ),
          )
        ],
      ),
    );
  }
}
