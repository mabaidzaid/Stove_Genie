import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stove_genie/pages/search/presentation/widget/search_container.dart';
import 'package:stove_genie/pages/search/presentation/widget/serch_filed.dart';
import 'package:stove_genie/utils/colors.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.whiteColor,
        primary: true,
        elevation: 0,
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: SvgPicture.asset('assets/icons/arrow-left.svg')),
          ],
        ),
        centerTitle: true,
        title: Text(
          'Search recipes',
          style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.appbarTextColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 17,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: SearchField(),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'Recent Search',
                style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.blackColor),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView.builder(
                itemCount: 8,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: 160,
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                ),
                itemBuilder: (context, index) {
                  return SearchContainer(
                    imgPath: 'assets/images/menu.png',
                    recipeName: 'Traditional spare ribs baked',
                    chefName: 'By Chef John',
                    kCal: '1081 KCal',
                    rating: '4.0',
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
