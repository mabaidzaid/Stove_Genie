import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stove_genie/pages/reviews_screen/presentation/widget/user.dart';

class CommentWidget extends StatelessWidget {
  const CommentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        user(context, 'assets/images/profile.png', 'Sir Faiz',
            'June 12, 2020 - 19:35'),
        SizedBox(
          height: 10,
        ),
        Text(
            'Lorem Ipsum tempor incididunt ut labore et dolore,inise voluptate velit esse cillum',
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                fontSize: 11,
                color: Color(0xff484848))),
        SizedBox(height: 5,),
        Row(
          children: [
            IntrinsicWidth(
              child: Container(
                height: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xfff3f3f3),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6.0),
                  child: Row(
                    spacing: 5,
                    children: [
                      Text(
                        '👍',
                        style: GoogleFonts.poppins(fontSize: 12),
                      ),
                      Text(
                        '3',
                        style: GoogleFonts.poppins(fontSize: 12),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(width: 5),
            IntrinsicWidth(
              child: Container(
                height: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xfff3f3f3),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6.0),
                  child: Row(
                    spacing: 5,
                    children: [
                      Text(
                        '👎',
                        style: GoogleFonts.poppins(fontSize: 12),
                      ),
                      Text(
                        '10',
                        style: GoogleFonts.poppins(fontSize: 12),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
