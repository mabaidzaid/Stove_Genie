import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stove_genie/utils/colors.dart';

Widget forgetText(BuildContext context, String title, String description) {
  return Column(
    spacing: 16,
    children: [
      Text(
        // 'Sign Up',
        title,
        style: GoogleFonts.inter(
            fontWeight: FontWeight.w600,
            fontSize: 28,
            color: AppColors.buttonColor),
      ),
      Text(
        // 'It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum.',
        description,
        textAlign: TextAlign.center,
        style: GoogleFonts.inter(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: AppColors.h2Color),
      ),
    ],
  );
}
