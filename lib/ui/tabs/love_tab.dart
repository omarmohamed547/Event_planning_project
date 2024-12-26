import 'package:event_planning_ass/ui/tabs/home_tab/EventItem.dart';
import 'package:event_planning_ass/utilis/app_colors.dart';
import 'package:event_planning_ass/utilis/app_style.dart';
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

class CustomTextField extends StatelessWidget {
  String hintText;
  Color? borderColor;
  TextStyle? hintStyle;
  Widget? prefixIcon;
  String? label;
  CustomTextField({
    this.label,
    this.prefixIcon,
    this.hintStyle,
    required this.hintText,
    this.borderColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.only(
        right: width * 0.02,
        left: width * 0.02,
        //top: height * 0.05,
      ),
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.02, vertical: height * 0.01),
      child: TextFormField(
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide:
                    BorderSide(width: 1, color: borderColor ?? Colors.grey)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide:
                    BorderSide(width: 1, color: borderColor ?? Colors.grey)),
            prefixIcon: prefixIcon,
            hintText: hintText,
            hintStyle: hintStyle ?? AppStyle.Medium16grey),
      ),
    );
  }
}
