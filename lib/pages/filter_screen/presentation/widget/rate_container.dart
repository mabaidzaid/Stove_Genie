import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stove_genie/widget/custom_row_container.dart';
import 'package:stove_genie/utils/colors.dart';
import 'package:stove_genie/widget/filter_custom_container.dart';

class RateContainer extends StatefulWidget {
  const RateContainer({super.key});

  @override
  State<RateContainer> createState() => _RateContainerState();
}

class _RateContainerState extends State<RateContainer> {
  int intialIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
        ),
        Text(
          'Rate',
          style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.blackColor),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          spacing: 15,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  intialIndex = 0;
                });
              },
              child: intialIndex == 0
                  ? CustomRowContainer(
                      text: '5', svgIconPath: 'assets/icons/star_unactive.svg')
                  : FilterCustomContainer(
                      isRow: true,
                      text: '5',
                      icon: SvgPicture.asset('assets/icons/rate_star.svg'),
                    ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  intialIndex = 1;
                });
              },
              child: intialIndex == 1
                  ? CustomRowContainer(
                      text: '4', svgIconPath: 'assets/icons/star_unactive.svg')
                  : FilterCustomContainer(
                      isRow: true,
                      text: '4',
                      icon: SvgPicture.asset('assets/icons/rate_star.svg'),
                    ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  intialIndex = 2;
                });
              },
              child: intialIndex == 2
                  ? CustomRowContainer(
                      text: '3', svgIconPath: 'assets/icons/star_unactive.svg')
                  : FilterCustomContainer(
                      isRow: true,
                      text: '3',
                      icon: SvgPicture.asset('assets/icons/rate_star.svg'),
                    ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  intialIndex = 3;
                });
              },
              child: intialIndex == 3
                  ? CustomRowContainer(
                      text: '2', svgIconPath: 'assets/icons/star_unactive.svg')
                  : FilterCustomContainer(
                      isRow: true,
                      text: '2',
                      icon: SvgPicture.asset('assets/icons/rate_star.svg'),
                    ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  intialIndex = 4;
                });
              },
              child: intialIndex == 4
                  ? CustomRowContainer(
                      text: "1", svgIconPath: 'assets/icons/star_unactive.svg')
                  : FilterCustomContainer(
                      isRow: true,
                      text: '1',
                      icon: SvgPicture.asset('assets/icons/rate_star.svg'),
                    ),
            ),
          ],
        ),
      ],
    );
  }
}
