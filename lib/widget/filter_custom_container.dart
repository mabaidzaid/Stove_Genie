import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stove_genie/utils/colors.dart';

class FilterCustomContainer extends StatelessWidget {
  final Widget? icon;
  final String? text;
  final bool isRow;

  const FilterCustomContainer({
    super.key,
    this.icon,
    this.text,
    this.isRow = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.buttonColor,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: isRow
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (text != null)
                  Text(
                    text!,
                    style: GoogleFonts.poppins(
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                      color: AppColors.buttonColor,
                    ),
                  ),
                if (icon != null && text != null) const SizedBox(width: 10),
                if (icon != null) icon!,
              ],
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (icon != null) icon!,
                if (icon != null && text != null) const SizedBox(height: 10),
                if (text != null)
                  Text(
                    text!,
                    style: GoogleFonts.poppins(
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                      color: AppColors.buttonColor,
                    ),
                  ),
              ],
            ),
    );
  }
}
