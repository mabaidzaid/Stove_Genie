import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:stove_genie/models/recipe/recipe_model.dart';

abstract class RecipeApi {
  Future<Either<String, String>> addRecipe({RecipeModel? recipeData});
  Future<Either<String, List<RecipeModel>>> fetchRecipe();
}

class RecipeApiImpl extends RecipeApi {
  @override
  Future<Either<String, String>> addRecipe({RecipeModel? recipeData}) async {
    final docRef = FirebaseFirestore.instance.collection('recipes').doc();

    try {
      await FirebaseFirestore.instance
          .collection('recipes')
          .doc(docRef.id)
          .set({
        'recipeId': recipeData?.id,
        'title': recipeData?.title,
        'description': recipeData?.description,
        'image': recipeData?.image,
        'time': recipeData?.time,
        'calories': recipeData?.calories,
        'rating': recipeData?.rating,
        'category': recipeData?.category,
        'steps': recipeData?.steps,
        'ingredients': recipeData?.ingredients,
        'userId': recipeData?.userId,
        'reviews': recipeData?.reviews ?? [],
        'createdAt': DateTime.now().toIso8601String(),
      });
      return Right(recipeData?.id ?? '');
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<RecipeModel>>> fetchRecipe() async {
    try {
      var data = await FirebaseFirestore.instance.collection('recipes').get();
      return Right(data.docs
          .map(
            (e) => RecipeModel.fromJson(e.data()),
          )
          .toList());
    } catch (e) {
      return Left(e.toString());
    }
  }
}
