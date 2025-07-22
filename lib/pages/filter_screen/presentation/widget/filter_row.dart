import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stove_genie/utils/colors.dart';

class FilterRow extends StatelessWidget {
  const FilterRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // SVG icon ko start position pe rakhein
        GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: SvgPicture.asset('assets/icons/arrow-left.svg')),

        // Space ko distribute karne ke liye Expanded widget ka use karein
        Expanded(
          child: Align(
            alignment: Alignment.center,
            child: Text(
              'Filter Search',
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.blackColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
