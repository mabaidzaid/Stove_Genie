import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stove_genie/localdb/recipe_db.dart';
import 'package:stove_genie/models/recipe/recipe_model.dart';
import 'package:stove_genie/pages/recipe_details/presentation/widget/ingredients.dart';
import 'package:stove_genie/pages/recipe_details/presentation/widget/procedure.dart';
import 'package:stove_genie/pages/recipe_details/presentation/widget/rate_recipe.dart';
import 'package:stove_genie/pages/recipe_details/presentation/widget/recipe_dialog.dart';
import 'package:stove_genie/pages/recipe_details/presentation/widget/user_account.dart';
import 'package:stove_genie/pages/reviews_screen/presentation/screen/reviews_screen.dart';
import 'package:stove_genie/pages/saved_recipes/presentation/widget/recipe_container.dart';

class RecipeDetails extends StatefulWidget {
  final RecipeModel? recipe;

  const RecipeDetails({super.key, this.recipe});

  @override
  State<RecipeDetails> createState() => _RecipeDetailsState();
}

class _RecipeDetailsState extends State<RecipeDetails> {
  bool isSaved = true;

  Future<void> _unsaveRecipe() async {
    await RecipeDbHelper().deleteRecipe(widget.recipe?.id ?? '');
    setState(() {
      isSaved = false;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Recipe removed from saved')),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.recipe == null) {
      return const Scaffold(
        body: Center(child: Text("No recipe selected")),
      );
    }

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          scrolledUnderElevation: 0,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back, color: Colors.black),
          ),
          actions: [
            PopupMenuButton<int>(
              icon: const Icon(Icons.more_horiz_outlined, color: Colors.black),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: Colors.white,
              onSelected: (value) {
                switch (value) {
                  case 0:
                    showRecipeDialog(
                        context, 'https://www.stovegenie.com/recipe');
                    break;
                  case 1:
                    showRateRecipeDialog(context, onSubmit: (rating) {
                      final userId = FirebaseAuth.instance.currentUser?.uid;
                      final recipeId = widget.recipe?.id;
                      if (userId != null && recipeId?.isNotEmpty == true) {
                        FirebaseFirestore.instance
                            .collection('recipes')
                            .doc(recipeId)
                            .update({
                          'reviews': FieldValue.arrayUnion([
                            {
                              'userId': userId,
                              'rating': rating,
                              'timestamp': DateTime.now().toIso8601String(),
                            }
                          ])
                        });
                      }
                    });
                    break;
                  case 2:
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ReviewsScreen()),
                    );
                    break;
                  case 3:
                    _unsaveRecipe();
                    break;
                }
              },
              itemBuilder: (context) => [
                _buildMenuItem(Icons.share, "Share", 0),
                _buildMenuItem(Icons.star, "Rate Recipe", 1),
                _buildMenuItem(Icons.comment, "Review", 2),
                _buildMenuItem(Icons.bookmark, "Unsave", 3),
              ],
            ),
          ],
        ),
        body: Column(
          children: [
            Column(
              children: [
                RecipeContainer(
                  imgPath: widget.recipe!.image.isNotEmpty
                      ? widget.recipe!.image
                      : '',
                  rating: widget.recipe!.rating.toString(),
                  time: widget.recipe!.time.isNotEmpty
                      ? widget.recipe!.time
                      : '0 min',
                  showButton: true,
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          widget.recipe!.title.isNotEmpty
                              ? widget.recipe!.title
                              : '-',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Text(
                            (widget.recipe!.reviews?.length ?? 0).toString(),
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: const Color(0xffa3a3a3),
                            ),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            'Reviews',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: const Color(0xffa3a3a3),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            UserAccountWidget(userId: widget.recipe!.userId),
            const SizedBox(height: 20),
            TabBar(
              physics: const NeverScrollableScrollPhysics(),
              isScrollable: false,
              dividerColor: Colors.transparent,
              indicator: BoxDecoration(
                color: const Color(0xFFFFA307),
                borderRadius: BorderRadius.circular(10),
              ),
              labelColor: Colors.white,
              unselectedLabelColor: const Color(0xFFFFA307),
              overlayColor: WidgetStateProperty.all(Colors.transparent),
              tabs: const [
                Tab(child: Text('INGREDIENT')),
                Tab(child: Text('PROCEDURE')),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Ingredients(
                    ingredients: widget.recipe!.ingredients ?? [],
                  ),
                  Procedure(steps: widget.recipe!.steps ?? []),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  PopupMenuItem<int> _buildMenuItem(IconData icon, String text, int value) {
    return PopupMenuItem(
      value: value,
      child: Row(
        children: [
          Icon(icon, color: Colors.black),
          const SizedBox(width: 10),
          Text(text),
        ],
      ),
    );
  }
}
