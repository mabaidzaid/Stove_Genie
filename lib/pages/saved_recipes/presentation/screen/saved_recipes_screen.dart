import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:stove_genie/localdb/recipe_db.dart';
import 'package:stove_genie/models/recipe/recipe_model.dart';
import 'package:stove_genie/pages/saved_recipes/presentation/widget/recipe_container.dart';

class SavedRecipesScreen extends StatefulWidget {
  const SavedRecipesScreen({super.key});

  @override
  State<SavedRecipesScreen> createState() => _SavedRecipesScreenState();
}

class _SavedRecipesScreenState extends State<SavedRecipesScreen> {
  List<RecipeModel> savedRecipes = [];

  Future<void> loadSavedRecipes() async {
    final data = await RecipeDbHelper().getRecipes();
    log(data.first.title);
    setState(() {
      savedRecipes = data;
    });
  }

  @override
  void initState() {
    super.initState();
    loadSavedRecipes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Saved recipes'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: savedRecipes.isEmpty
          ? const Center(child: Text("No saved recipes"))
          : SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Center(
                    child: Column(
                      children: savedRecipes
                          .map(
                            (recipe) => RecipeContainer(
                              imgPath: recipe.image,
                              rating: recipe.rating.toString(),
                              recipeName: recipe.title,
                              chefName: "",
                              kCal: recipe.calories,
                              time: recipe.time,
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
    );
  }
}
