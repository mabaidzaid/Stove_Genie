import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

import 'package:stove_genie/bloc/cubit/recipe_cubit.dart';
import 'package:stove_genie/bloc/state/recipe_state.dart';
import 'package:stove_genie/core/di_container.dart';
import 'package:stove_genie/localdb/recipe_db.dart';
import 'package:stove_genie/models/recipe/recipe_model.dart';
import 'package:stove_genie/pages/recipe_details/presentation/screen/recipe_details.dart';
import 'package:stove_genie/utils/colors.dart';
import 'package:stove_genie/utils/images.dart';

class AllScreen extends StatefulWidget {
  const AllScreen({super.key});

  @override
  State<AllScreen> createState() => _AllScreenState();
}

class _AllScreenState extends State<AllScreen> {
  final cubit = Di().sl<RecipeCubit>();

  @override
  void initState() {
    super.initState();
    cubit.fetchRecipe().catchError((e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching recipes: $e')),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipeCubit, RecipeState>(
      bloc: cubit,
      builder: (context, state) {
        // 1) Show shimmer skeleton while loading
        if (state is RecipeLoading) {
          return SizedBox(
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 30),
              itemCount: 4,
              itemBuilder: (_, index) => Padding(
                padding: EdgeInsets.only(left: index == 0 ? 0 : 15),
                child: const SkeletonRecipeCard(),
              ),
            ),
          );
        }

        if (state is RecipeError) {
          return Center(
              child: Text('Failed to load recipes.', style: _errorStyle));
        }

        if (state is RecipeLoaded) {
          final recipes = cubit.isSearching
              ? cubit.filterRecipeData
              : cubit.recipeData.reversed.toList();
          if (recipes.isEmpty) {
            return Center(child: Text('No recipes found.', style: _errorStyle));
          }
          return SizedBox(
            height: 250,
            child: StatefulBuilder(
              builder: (context, setState) {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 30),
                  itemCount: recipes.length,
                  itemBuilder: (context, index) {
                    final r = recipes[index];
                    return Padding(
                      padding: EdgeInsets.only(left: index == 0 ? 0 : 15),
                      child: FutureBuilder<bool>(
                        future: RecipeDbHelper().isRecipeSaved(r.id),
                        builder: (context, snap) {
                          final isSaved = snap.data ?? false;
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => RecipeDetails(
                                      recipe: r,
                                    ),
                                  ));
                            },
                            child: RecepieWidget(
                              recipe: r,
                              isFavorite: isSaved,
                              onFavoriteToggled: () => setState(() {}),
                            ),
                          );
                        },
                      ),
                    );
                  },
                );
              },
            ),
          );
        }

        // fallback
        return const SizedBox.shrink();
      },
    );
  }
}

// A simple shimmer placeholder for your recipe card
class SkeletonRecipeCard extends StatelessWidget {
  const SkeletonRecipeCard({super.key});
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Column(
        children: [
          const SizedBox(height: 40),
          Container(
            height: 160,
            width: 150,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: Column(
              children: [
                const SizedBox(height: 40),
                // title placeholder
                Container(
                  height: 14,
                  width: 100,
                  color: Colors.white,
                ),
                const SizedBox(height: 10),
                // category placeholder
                Container(
                  height: 12,
                  width: 60,
                  color: Colors.white,
                ),
                const Spacer(),
                // time + favorite icon placeholder
                Row(
                  children: [
                    Container(
                      height: 12,
                      width: 40,
                      color: Colors.white,
                    ),
                    const Spacer(),
                    Container(
                      height: 20,
                      width: 20,
                      color: Colors.white,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RecepieWidget extends StatefulWidget {
  final RecipeModel recipe;
  final bool isFavorite;
  final VoidCallback onFavoriteToggled;
  final double? width;

  const RecepieWidget({
    super.key,
    required this.recipe,
    required this.isFavorite,
    required this.onFavoriteToggled,
    this.width = 150,
  });

  @override
  State<RecepieWidget> createState() => _RecepieWidgetState();
}

class _RecepieWidgetState extends State<RecepieWidget> {
  late bool isFav;

  @override
  void initState() {
    super.initState();
    isFav = widget.isFavorite;
  }

  Future<void> _toggleFavorite() async {
    if (isFav) {
      await RecipeDbHelper().deleteRecipe(widget.recipe.id);
    } else {
      await RecipeDbHelper().insertRecipe(widget.recipe);
    }
    setState(() => isFav = !isFav);
    widget.onFavoriteToggled();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(isFav ? 'Saved!' : 'Removed!'),
        backgroundColor: isFav ? Colors.green : Colors.orange,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            const SizedBox(height: 40),
            Container(
              height: 160,
              width: widget.width,
              decoration: BoxDecoration(
                color: AppColors.containeColor.withOpacity(0.5),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 55),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      widget.recipe.title,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.resipetextColor,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            widget.recipe.category,
                            style: GoogleFonts.poppins(
                              color: AppColors.cheifColor,
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 5),
                        SvgPicture.asset(AppImages.flameIcon),
                        const SizedBox(width: 2),
                        Text(
                          '${widget.recipe.calories} KCal',
                          style: GoogleFonts.poppins(
                            color: AppColors.falmetextColor,
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Text(
                          widget.recipe.time ?? '',
                          style: GoogleFonts.poppins(
                            color: AppColors.resipetextColor,
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: _toggleFavorite,
                          child: SvgPicture.asset(
                            isFav
                                ? AppImages.saveselected
                                : AppImages.saveUnSelected,
                            height: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ],
        ),
        // recipe image
        Positioned(
          bottom: 160,
          left: 40,
          child: CircleAvatar(
              radius: 40,
              backgroundColor: Colors.grey.shade200,
              // backgroundImage: widget.recipe.image.isNotEmpty
              //     ? NetworkImage(widget.recipe.image)
              //     : null,
              child:
                  // widget.recipe.image.isEmpty
                  // ?
                  const Icon(Icons.restaurant, size: 40, color: Colors.grey)
              // : null,
              ),
        ),
        // rating badge
        Positioned(
          top: 30,
          left: 105,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.rateContainerColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                SvgPicture.asset('assets/icons/rate_star.svg'),
                const SizedBox(width: 5),
                Text(
                  widget.recipe.rating.toStringAsFixed(1),
                  style: GoogleFonts.poppins(
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    color: AppColors.blackColor,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// simple text style for error/fallback
final _errorStyle = GoogleFonts.poppins(
  fontSize: 14,
  fontWeight: FontWeight.w500,
  color: Colors.grey[600],
);
