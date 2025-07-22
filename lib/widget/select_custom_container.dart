import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stove_genie/utils/colors.dart';

class SelectCustomContainer extends StatelessWidget {
  final String text;
  final String? svgIconPath;
  final bool showRow;

  const SelectCustomContainer({
    super.key,
    required this.text,
    this.svgIconPath,
    this.showRow = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.buttonColor,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: showRow
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: GoogleFonts.poppins(
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    color: AppColors.whiteColor,
                  ),
                ),
                const SizedBox(width: 8),
                if (svgIconPath != null)
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        svgIconPath!,
                      ),
                    ],
                  ),
              ],
            )
          : Center(
              child: Text(
                text,
                style: GoogleFonts.poppins(
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                  color: AppColors.whiteColor,
                ),
              ),
            ),
    );
  }
}
