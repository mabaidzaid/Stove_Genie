import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stove_genie/pages/filter_screen/presentation/screen/filter_screen.dart';
import 'package:stove_genie/pages/search/presentation/screen/search_screen.dart';
import 'package:stove_genie/utils/colors.dart';
import 'package:stove_genie/utils/helper.dart';
import 'package:stove_genie/utils/images.dart';

class SearchField extends StatefulWidget {
  final Function()? onPressed;
  const SearchField({
    super.key,
    this.onPressed,
  });

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  @override
  Widget build(BuildContext context) {
    // mq = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: SizedBox(
            height: 40,
            child: TextFormField(
              dragStartBehavior: DragStartBehavior.down,
              cursorColor: AppColors.buttonColor,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: AppColors.hinttextColor, width: 1.3),
                  borderRadius: BorderRadius.circular(10),
                ),
                border:
                    InputBorder.none, // Removes the default underline border
                // enabledBorder: InputBorder.none,
                contentPadding: const EdgeInsets.only(),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: AppColors.hinttextColor, width: 1.3),
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: AppColors.whiteColor,
                hintText: ('Search...'),
                hintStyle: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.hinttextColor),
                prefixIcon: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(AppImages.searchIcon),
                  ],
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 8,
        ),
        InkWell(
          onTap: () {
            showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: AppColors.whiteColor,
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    height: getHeight(context) * 0.65,
                    width: double.infinity,
                    child: const FilterScreen(),
                  );
                });
          },
          child: Container(
            height: 36,
            width: 41,
            decoration: BoxDecoration(
              // boxShadow: [
              //   BoxShadow(
              //       blurRadius: 4,
              //       color: AppColors.blackColor.withOpacity(.25))
              // ],
              color: AppColors.buttonColor,
              borderRadius: const BorderRadius.all(Radius.circular(9)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(AppImages.filterIcon),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
