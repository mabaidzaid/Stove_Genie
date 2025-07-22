import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Procedure extends StatelessWidget {
  final List<String> steps;
  const Procedure({super.key, required this.steps});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: steps.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xfff1f1f1),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Step ${index + 1}',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: const Color(0xff121212),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    steps[index],
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: const Color(0xffa9a9a9),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
