import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stove_genie/utils/colors.dart';
import 'package:stove_genie/widget/mini_tv_container.dart';

class TvList extends StatelessWidget {
  const TvList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true, // Allow wrapping inside another scrollable widget
      physics:
          const NeverScrollableScrollPhysics(), // Disable internal scrolling
      itemCount: 10, // Number of items to display
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MiniTvContainer(
              imgPath: 'assets/images/burger.png',
              rating: '4.0',
              time: '20 min',
              showButton: true,
            ),
            const SizedBox(
                height: 8), // Add spacing between MiniTvContainer and Row
            Row(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Align content to the top
              children: [
                Expanded(
                  child: Text(
                    'Spicy chicken burger with French fries',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.blackColor,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 8), // Space between text and reviews
                Column(
                  mainAxisAlignment:
                      MainAxisAlignment.start, // Align to the top
                  children: [
                    Text(
                      '(13k Reviews)',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.cheifColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 16), // Add spacing between items
          ],
        );
      },
    );
  }
}
