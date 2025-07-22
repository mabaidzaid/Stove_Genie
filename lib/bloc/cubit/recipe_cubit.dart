import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stove_genie/api/recipe_api.dart';
import 'package:stove_genie/bloc/state/recipe_state.dart';
import 'package:stove_genie/helpers/warning_helper.dart';
import 'package:stove_genie/models/recipe/recipe_model.dart';

class RecipeCubit extends Cubit<RecipeState> {
  final RecipeApi _recipeApi;
  final ImagePicker _imagePicker = ImagePicker();

  RecipeCubit(this._recipeApi) : super(RecipeInitial());

  List<RecipeModel> recipeData = [];
  List<RecipeModel> filterRecipeData = [];
  RecipeModel? singleRecipeData;
  File? selectedRecipeImage;

  int currentIndex = 0;
  bool isChecked = false;
  bool isSearching = false;

  final List<String> categories = [
    'All',
    'Indian',
    'Italian',
    'Asian',
    'Chinese'
  ];

  Future<void> addRecipe(
      {RecipeModel? recipe, required BuildContext context}) async {
    emit(RecipeLoading());
    var result = await _recipeApi.addRecipe(recipeData: recipe);
    result.fold(
      (l) {
        emit(RecipeError());
        WarningHelper.showErrorToast('Error adding Recipe', context);
        Navigator.pop(context);
      },
      (r) {
        recipeData.add(recipe ?? RecipeModel());
        WarningHelper.showSuccesToast('Recipe Added Successfully', context);
        // Clear the selected image after successful save
        clearSelectedImage();
        Navigator.pop(context);
      },
    );
  }

  Future<void> fetchRecipe() async {
    emit(RecipeLoading());
    var result = await _recipeApi.fetchRecipe();
    result.fold(
      (l) {
        log('Something went wrong in fetching recipes');
        emit(RecipeError());
      },
      (r) {
        recipeData = r;
        emit(RecipeLoaded());
      },
    );
  }

  Future<void> pickImageFromGallery() async {
    try {
      final XFile? pickedFile = await _imagePicker.pickImage(
        source: ImageSource.gallery,
        requestFullMetadata: false,
      );

      if (pickedFile != null) {
        selectedRecipeImage = File(pickedFile.path);
        emit(RecipeLoaded());
      }
    } catch (e) {
      emit(RecipeError());

      log('Error picking image from gallery: $e');
    }
  }

  Future<void> pickImageFromCamera() async {
    emit(RecipeLoading());

    try {
      // Add a small delay to ensure UI is settled
      await Future.delayed(const Duration(milliseconds: 100));

      final XFile? pickedFile = await _imagePicker.pickImage(
        source: ImageSource.camera,
        maxWidth: 1000,
        maxHeight: 1000,
        imageQuality: 80,
        requestFullMetadata: false,
      );

      if (pickedFile != null) {
        selectedRecipeImage = File(pickedFile.path);
        emit(RecipeLoaded());
      }
    } catch (e) {
      emit(RecipeError());

      log('Error picking image from camera: $e');
      // Try alternative approach
    }
  }

  void clearSelectedImage() {
    emit(RecipeLoading());
    selectedRecipeImage = null;
    emit(RecipeLoaded());
  }

  File? getRecipeImage() {
    return selectedRecipeImage;
  }

  void setCurrentIndex(int index) {
    emit(RecipeLoading());
    currentIndex = index;
    emit(RecipeLoaded());
  }

  void toggleCheck(bool value) {
    emit(RecipeLoading());
    isChecked = value;
    emit(RecipeLoaded());
  }

  void searchRecipes(String query) {
    emit(RecipeLoading());
    isSearching = true;
    if (query.toLowerCase() == 'All'.toLowerCase()) {
      filterRecipeData = recipeData;
      emit(RecipeLoaded());
      return;
    } else {
      filterRecipeData = recipeData.where(
        (element) {
          return element.category.toLowerCase().contains(query.toLowerCase()) ||
              element.description.toLowerCase().contains(query.toLowerCase()) ||
              element.title.toLowerCase().contains(query.toLowerCase());
        },
      ).toList();
    }

    emit(RecipeLoaded());
  }

  void cancelSearch() {
    emit(RecipeLoading());
    isSearching = false;
    filterRecipeData = [];
    emit(RecipeLoaded());
  }
}
