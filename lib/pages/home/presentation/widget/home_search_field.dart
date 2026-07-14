import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stove_genie/bloc/cubit/recipe_cubit.dart';
import 'package:stove_genie/core/di_container.dart';
import 'package:stove_genie/pages/filter_screen/presentation/screen/filter_screen.dart';
import 'package:stove_genie/utils/colors.dart';
import 'package:stove_genie/utils/helper.dart';
import 'package:stove_genie/utils/images.dart';

class HomeSearchField extends StatefulWidget {
  final Function()? onPressed;
  const HomeSearchField({
    super.key,
    this.onPressed,
  });

  @override
  State<HomeSearchField> createState() => _HomeSearchFieldState();
}

class _HomeSearchFieldState extends State<HomeSearchField> {
  final _search = TextEditingController();

  final RecipeCubit _recipeCubit = Di().sl<RecipeCubit>();
  @override
  Widget build(BuildContext context) {
    // mq = MediaQuery.of(context).size;
    return BlocBuilder(
      bloc: _recipeCubit,
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SizedBox(
                height: 40,
                child: TextFormField(
                  controller: _search,
                  onChanged: (value) {
                    _recipeCubit.searchRecipes(value ?? '');
                  },
                  onTap: () {
                    _recipeCubit.isSearching = true;
                    // Navigator.of(context).push(MaterialPageRoute(
                    //   builder: (context) => const SearchScreen(),
                    // ));
                  },
                  dragStartBehavior: DragStartBehavior.down,
                  cursorColor: AppColors.buttonColor,
                  showCursor: true,
                  decoration: InputDecoration(
                    suffixIcon: _search.text.isNotEmpty
                        ? IconButton(
                            icon: Icon(
                              Icons.clear_rounded,
                              color: Colors.grey[500],
                            ),
                            onPressed: () {
                              _search.clear();
                              _recipeCubit.searchRecipes('');
                            },
                          )
                        : null,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: AppColors.hinttextColor, width: 1.3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.only(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: AppColors.hinttextColor, width: 1.3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: AppColors.whiteColor,
                    hintText: ('Search...'),
                    hintStyle: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.blackColor),
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
                      return SizedBox(
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
      },
    );
  }
}
