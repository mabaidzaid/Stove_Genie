import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stove_genie/bloc/cubit/recipe_cubit.dart';
import 'package:stove_genie/bloc/state/recipe_state.dart';
import 'package:stove_genie/core/di_container.dart';
import 'package:stove_genie/localdb/recipe_db.dart';
import 'package:stove_genie/pages/home/presentation/widget/all_screen.dart';
import 'package:stove_genie/pages/recipe_details/presentation/screen/recipe_details.dart';

class MyReceipeWidget extends StatefulWidget {
  const MyReceipeWidget({super.key});

  @override
  State<MyReceipeWidget> createState() => _MyReceipeWidgetState();
}

class _MyReceipeWidgetState extends State<MyReceipeWidget> {
  final cubit = Di().sl<RecipeCubit>();

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
          final recipes = cubit.recipeData.toList();
          if (recipes.isEmpty) {
            return Center(child: Text('No recipes found.', style: _errorStyle));
          }
          return SizedBox(
            height: 250,
            child: StatefulBuilder(
              builder: (context, setState) {
                final recipeList = recipes
                    .where(
                      (element) =>
                          element.userId ==
                          FirebaseAuth.instance.currentUser?.uid,
                    )
                    .toList();
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 30),
                  itemCount: recipeList.length,
                  itemBuilder: (context, index) {
                    final r = recipes
                        .where(
                          (element) =>
                              element.userId ==
                              FirebaseAuth.instance.currentUser?.uid,
                        )
                        .toList()[index];
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
                              width: 170,
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

// simple text style for error/fallback
final _errorStyle = GoogleFonts.poppins(
  fontSize: 14,
  fontWeight: FontWeight.w500,
  color: Colors.grey[600],
);
