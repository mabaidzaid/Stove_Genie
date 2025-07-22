import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stove_genie/pages/notification_screen/presentation/widget/notification_icon.dart';
import 'package:stove_genie/utils/helper.dart';

Widget mainContainer(context,String notificationTitle,String notificationDescription,bool badge) {
  return Container(
    width: getWidth(context) * 0.9,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12), color: Color(0xfff1f1f1)),
    child: Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                notificationTitle,
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 11,
                    color: Color(0xff121212)),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                notificationDescription,
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 11,
                    color: Color(0xffa9a9a9)),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                '10 mins ago',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 7,
                    color: Color(0xffa9a9a9)),
              ),
            ],
          )),
          NotificationIcon(
            showBadge: badge,
          )
        ],
      ),
    ),
  );
}
