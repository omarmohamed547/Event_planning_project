import 'package:event_planning_ass/utilis/app_style.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  String hintText;
  Color? borderColor;
  TextStyle? hintStyle;
  Widget? prefixIcon;
  Widget? suffixxIcon;

  String? label;
  CustomTextField({
    this.suffixxIcon,
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
          horizontal: width * 0.03, vertical: height * 0.001),
      child: TextFormField(
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide:
                    BorderSide(width: 1.5, color: borderColor ?? Colors.grey)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                    width: 1, color: borderColor ?? Color(0xff7B7B7B))),
            prefixIcon: prefixIcon,
            suffixIcon: suffixxIcon,
            hintText: hintText,
            hintStyle: hintStyle ?? AppStyle.Medium16grey),
      ),
    );
  }
}
