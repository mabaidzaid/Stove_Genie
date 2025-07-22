import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stove_genie/bloc/cubit/recipe_cubit.dart';
import 'package:stove_genie/core/di_container.dart';
import 'package:stove_genie/pages/home/presentation/widget/all_screen.dart';
import 'package:stove_genie/pages/home/presentation/widget/category_button.dart';
import 'package:stove_genie/utils/colors.dart';

class CategorySwitch extends StatefulWidget {
  const CategorySwitch({super.key});

  @override
  State<CategorySwitch> createState() => _CategorySwitchState();
}

class _CategorySwitchState extends State<CategorySwitch> {
  late final RecipeCubit _recipeCubit;

  @override
  void initState() {
    super.initState();
    _recipeCubit = Di().sl<RecipeCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _recipeCubit,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCategoryList(),
            const SizedBox(height: 24),
            const AllScreen(),
          ],
        );
      },
    );
  }

  Widget _buildCategoryList() {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: _recipeCubit.categories.length,
        itemBuilder: (context, index) {
          final text = _recipeCubit.categories[index];
          final isSelected = _recipeCubit.currentIndex == index;

          return Padding(
            padding: EdgeInsets.only(
              right: index == _recipeCubit.categories.length - 1 ? 0 : 12,
            ),
            child: GestureDetector(
              onTap: () {
                _recipeCubit.setCurrentIndex(index);
                _recipeCubit.searchRecipes(text);
              },
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                child: isSelected
                    ? CategoryButton(
                        key: ValueKey('selected_$index'),
                        height: 31,
                        widget: 54,
                        text: text,
                      )
                    : Container(
                        key: ValueKey('unselected_$index'),
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        child: Text(
                          text,
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: AppColors.buttonColor,
                          ),
                        ),
                      ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    // Don't dispose the cubit here if it's managed by DI container
    super.dispose();
  }
}
