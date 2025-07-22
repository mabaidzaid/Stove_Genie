import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stove_genie/utils/colors.dart';
import 'package:stove_genie/widget/filter_custom_container.dart';

class TimeContainer extends StatefulWidget {
  const TimeContainer({super.key});

  @override
  State<TimeContainer> createState() => _TimeContainerState();
}

class _TimeContainerState extends State<TimeContainer> {
  int intialIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 10,
        ),
        Text(
          'Time',
          style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.blackColor),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          spacing: 10,
          children: [
            GestureDetector(
                onTap: () {
                  setState(() {
                    intialIndex = 0;
                  });
                },
                child: intialIndex == 0
                    ? Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: AppColors.buttonColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            'All',
                            style: GoogleFonts.poppins(
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ),
                      )
                    : FilterCustomContainer(
                        text: 'All',
                      )),
            GestureDetector(
                onTap: () {
                  setState(() {
                    intialIndex = 1;
                  });
                },
                child: intialIndex == 1
                    ? Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: AppColors.buttonColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            'Newest',
                            style: GoogleFonts.poppins(
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ),
                      )
                    : FilterCustomContainer(
                        text: 'Newest',
                      )),
            GestureDetector(
                onTap: () {
                  setState(() {
                    intialIndex = 2;
                  });
                },
                child: intialIndex == 2
                    ? Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: AppColors.buttonColor,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Center(
                          child: Text(
                            'Oldest',
                            style: GoogleFonts.poppins(
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ),
                      )
                    : FilterCustomContainer(
                        text: 'Oldest',
                      )),
            GestureDetector(
                onTap: () {
                  setState(() {
                    intialIndex = 3;
                  });
                },
                child: intialIndex == 3
                    ? Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: AppColors.buttonColor,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Center(
                          child: Text(
                            'Popularity',
                            style: GoogleFonts.poppins(
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ),
                      )
                    : FilterCustomContainer(
                        text: 'Popularity',
                      )),
          ],
        )
      ],
    );
  }
}
