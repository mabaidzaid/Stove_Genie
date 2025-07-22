import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stove_genie/utils/colors.dart';

class CustomButton extends StatelessWidget {
  final Function()? onTap;
  final String text;
  final String? svgPicture; // Optional icon

  const CustomButton({
    super.key,
    required this.text,
    this.onTap,
    this.svgPicture,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          color: AppColors.buttonColor,
          boxShadow: [
            BoxShadow(
              color: AppColors.blurCOlor,
              offset: const Offset(4, 4),
              blurRadius: 0.1,
            ),
          ],
          borderRadius: const BorderRadius.all(Radius.circular(14)),
        ),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (svgPicture != null) ...[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(svgPicture!),
                  ],
                ),
                // const SizedBox(width: 8), // Spacing between icon and text
              ],
              SizedBox(
                width: 16,
              ),
              Text(
                text,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppColors.whiteColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
