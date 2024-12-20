import 'package:event_planning_ass/utilis/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle {
  static final bold12White = GoogleFonts.inter(
      color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold);

  static final bold24White = GoogleFonts.inter(
      color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold);

  static final Medium16White = GoogleFonts.inter(
      color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500);

  static final bold20Primary = GoogleFonts.inter(
      color: AppColors.primaryColorLight,
      fontSize: 20,
      fontWeight: FontWeight.bold);

  static final bold20Black = GoogleFonts.inter(
      color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold);
}
