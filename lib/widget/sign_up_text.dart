import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stove_genie/utils/colors.dart';

Widget signupText(BuildContext context, String title, String description) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    spacing: 10,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text(
          // 'Sign Up',
          title,
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 20,
              color: AppColors.blackColor),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 20, right: 125),
        child: Text(
          // 'It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum.',
          description,
          // textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.w400,
              fontSize: 11,
              color: AppColors.h1Color),
        ),
      ),
    ],
  );
}
