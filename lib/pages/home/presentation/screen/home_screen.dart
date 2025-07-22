import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stove_genie/pages/home/presentation/widget/home_app_bar.dart';
import 'package:stove_genie/pages/home/presentation/widget/new_recipes.dart';
import 'package:stove_genie/pages/home/presentation/widget/home_search_field.dart';
import 'package:stove_genie/pages/home/presentation/widget/swtich_category.dart';
import 'package:stove_genie/utils/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: HomeAppBar(),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: HomeSearchField(),
            ),
            SizedBox(
              height: 15,
            ),
            CategorySwitch(),
            // SizedBox(
            //   height: 15,
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'New Recipes',
                style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.blackColor),
              ),
            ),
            SizedBox(
              height: 32,
            ),
            Expanded(child: NewRecipes())
          ],
        ),
      ),
    );
  }
}
