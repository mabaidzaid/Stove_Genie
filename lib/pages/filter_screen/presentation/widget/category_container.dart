import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stove_genie/utils/colors.dart';
import 'package:stove_genie/widget/filter_custom_container.dart';
import 'package:stove_genie/widget/select_custom_container.dart';

class CategoryContainer extends StatefulWidget {
  const CategoryContainer({super.key});

  @override
  State<CategoryContainer> createState() => _CategoryContainerState();
}

class _CategoryContainerState extends State<CategoryContainer> {
  int intialIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
          spacing: 10,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  intialIndex = 0;
                });
              },
              child: intialIndex == 0
                  ? SelectCustomContainer(
                      text: 'All',
                    )
                  : FilterCustomContainer(
                      text: 'All',
                    ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  intialIndex = 1;
                });
              },
              child: intialIndex == 1
                  ? SelectCustomContainer(
                      text: 'Cereal',
                    )
                  : FilterCustomContainer(
                      text: 'Cereal',
                    ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  intialIndex = 2;
                });
              },
              child: intialIndex == 2
                  ? SelectCustomContainer(
                      text: 'Vegetables',
                    )
                  : FilterCustomContainer(
                      text: 'Vegetables',
                    ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  intialIndex = 3;
                });
              },
              child: intialIndex == 3
                  ? SelectCustomContainer(
                      showRow: true,
                      text: 'Dinner',
                      svgIconPath: 'assets/icons/star_unactive.svg',
                    )
                  : FilterCustomContainer(
                      isRow: true,
                      text: 'Dinner',
                      icon: SvgPicture.asset('assets/icons/rate_star.svg'),
                    ),
            ),
          ],
        ),
        Row(
          spacing: 10,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  intialIndex = 4;
                });
              },
              child: intialIndex == 4
                  ? SelectCustomContainer(
                      text: 'Chinese',
                    )
                  : FilterCustomContainer(
                      text: 'Chinese',
                    ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  intialIndex = 5;
                });
              },
              child: intialIndex == 5
                  ? SelectCustomContainer(
                      text: 'Local Dish',
                    )
                  : FilterCustomContainer(
                      text: 'Local Dish',
                    ),
            ),
            Builder(builder: (context) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    intialIndex = 6;
                  });
                },
                child: intialIndex == 6
                    ? SelectCustomContainer(
                        text: 'Fruit',
                      )
                    : FilterCustomContainer(
                        text: 'Fruit',
                      ),
              );
            }),
            GestureDetector(
              onTap: () {
                setState(() {
                  intialIndex = 7;
                });
              },
              child: intialIndex == 7
                  ? SelectCustomContainer(
                      text: 'BreakFast',
                    )
                  : FilterCustomContainer(
                      text: 'BreakFast',
                    ),
            ),
          ],
        ),
        Row(
          spacing: 10,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  intialIndex = 8;
                });
              },
              child: intialIndex == 8
                  ? SelectCustomContainer(
                      text: 'Spanish',
                    )
                  : FilterCustomContainer(
                      text: 'Spanish',
                    ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  intialIndex = 9;
                });
              },
              child: intialIndex == 9
                  ? SelectCustomContainer(
                      text: 'Chinese',
                    )
                  : FilterCustomContainer(
                      text: 'Chinese',
                    ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  intialIndex = 10;
                });
              },
              child: intialIndex == 10
                  ? SelectCustomContainer(
                      text: 'Lunch',
                    )
                  : FilterCustomContainer(
                      text: 'Lunch',
                    ),
            )
          ],
        ),
      ],
    );
  }
}
