import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stove_genie/utils/helper.dart';

Widget user(context,String imgPath,String name,String dateTime) {
  return SizedBox(
    width: getWidth(context) * 0.9,
    child: Row(
      children: [
        CircleAvatar(
          child: Image.asset(imgPath),
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
            Text(dateTime,
                  style: GoogleFonts.poppins(
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                      color: Color(0xffa9a9a9)))
          ],
        ),
      ],
    ),
  );
}
