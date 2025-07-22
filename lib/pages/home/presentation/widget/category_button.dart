import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stove_genie/utils/colors.dart';

class CategoryButton extends StatelessWidget {
  final String text;
  final double? height;
  final double? widget;

  const CategoryButton({
    super.key,
    required this.text,
    this.height,
    this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: widget,
      decoration: const BoxDecoration(
          color: AppColors.buttonColor,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Center(
        child: Text(
          text,
          style: GoogleFonts.poppins(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: AppColors.whiteColor),
        ),
      ),
    );
  }
}
