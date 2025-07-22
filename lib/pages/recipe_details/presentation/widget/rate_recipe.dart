import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stove_genie/bloc/cubit/recipe_cubit.dart';
import 'package:stove_genie/core/di_container.dart';

void showRateRecipeDialog(
  BuildContext context, {
  required Function(double rating) onSubmit,
}) {
  double selectedRating = 0;

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        // Required to update stars in dialog
        builder: (context, setState) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Rate Recipe',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(5, (index) {
                      return IconButton(
                        icon: Icon(
                          index < selectedRating
                              ? Icons.star
                              : Icons.star_border,
                          color: const Color(0xffffad30),
                          size: 32,
                        ),
                        onPressed: () {
                          setState(() {
                            selectedRating = index + 1.0;
                          });
                        },
                      );
                    }),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffFFA307),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      minimumSize: const Size(90, 30),
                      elevation: 0,
                    ),
                    onPressed: () {
                      if (selectedRating > 0) {
                        Navigator.of(context).pop();
                        onSubmit(selectedRating);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please select a rating.'),
                          ),
                        );
                      }
                    },
                    child: Text(
                      'Send',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}

final _recipeCubit = Di().sl<RecipeCubit>();
