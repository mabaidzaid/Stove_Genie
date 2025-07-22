import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stove_genie/bloc/cubit/recipe_cubit.dart';
import 'package:stove_genie/bloc/state/recipe_state.dart';
import 'package:stove_genie/core/di_container.dart';
import 'package:stove_genie/models/recipe/recipe_model.dart';
import 'package:stove_genie/pages/recipe/widgets/category_dropdown_field.dart';
import 'package:stove_genie/pages/recipe/widgets/recipe_image_bottomsheet.dart';
import 'package:stove_genie/utils/colors.dart';

class AddRecipeScreen extends StatefulWidget {
  const AddRecipeScreen({super.key});

  @override
  State<AddRecipeScreen> createState() => _AddRecipeScreenState();
}

class _AddRecipeScreenState extends State<AddRecipeScreen>
    with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  late AnimationController _fadeController;
  late AnimationController _slideController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController caloriesController = TextEditingController();

  final _recipeCubit = Di().sl<RecipeCubit>();
  String? selectedCategory;
  List<String> recipeSteps = [];
  List<String> ingredients = [];
  final TextEditingController stepController = TextEditingController();
  final TextEditingController ingredientsController = TextEditingController();
  final userId = FirebaseAuth.instance.currentUser?.uid;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _slideController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeInOut),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _slideController, curve: Curves.easeOut));

    _fadeController.forward();
    _slideController.forward();
  }

  void _saveRecipe() {
    if (_formKey.currentState!.validate()) {
      if (ingredients.isEmpty) {
        _showSnackBar('Please add at least one ingredient', Colors.red);
        return;
      }
      if (recipeSteps.isEmpty) {
        _showSnackBar('Please add at least one step', Colors.red);
        return;
      }
      if (selectedCategory == null) {
        _showSnackBar('Please select a category', Colors.red);
        return;
      }

      final docRef = FirebaseFirestore.instance.collection('recipes').doc();
      _recipeCubit.addRecipe(
        context: context,
        recipe: RecipeModel(
            id: docRef.id,
            userId: userId ?? '',
            title: titleController.text,
            description: descriptionController.text,
            calories: caloriesController.text,
            time: timeController.text,
            image: _recipeCubit.selectedRecipeImage?.path ?? '',
            category: selectedCategory ?? '',
            steps: recipeSteps,
            ingredients: ingredients),
      );
    }
  }

  void _showSnackBar(String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(
              color == Colors.red
                  ? Icons.error_outline
                  : Icons.check_circle_outline,
              color: Colors.white,
            ),
            const SizedBox(width: 8),
            Text(message),
          ],
        ),
        backgroundColor: color,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _recipeCubit,
      child: Scaffold(
        backgroundColor: Colors.grey[50],
        appBar: AppBar(
          title: const Text(
            "Add New Recipe",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          centerTitle: true,
          backgroundColor: AppColors.buttonColor,
          foregroundColor: Colors.white,
          elevation: 0,
          shadowColor: Colors.transparent,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1),
            child: Container(
              height: 1,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    Colors.grey[200]!,
                    Colors.transparent
                  ],
                  stops: const [0.0, 0.5, 1.0],
                ),
              ),
            ),
          ),
        ),
        body: BlocBuilder<RecipeCubit, RecipeState>(
          builder: (context, state) {
            return FadeTransition(
              opacity: _fadeAnimation,
              child: SlideTransition(
                position: _slideAnimation,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Image picker section
                        _buildSectionHeader(
                            'Recipe Image', Icons.image_outlined),
                        const SizedBox(height: 12),
                        _buildImagePickerSection(),
                        const SizedBox(height: 32),

                        // Basic Info Section
                        _buildSectionHeader(
                            'Basic Information', Icons.info_outline),
                        const SizedBox(height: 16),
                        _buildInput("Recipe Title", titleController),
                        _buildInput("Description", descriptionController,
                            maxLines: 3),

                        Row(
                          children: [
                            Expanded(
                              child: _buildInput("Cooking Time", timeController,
                                  suffix: "mins", icon: Icons.timer_outlined),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: _buildInput("Calories", caloriesController,
                                  suffix: "kcal",
                                  icon: Icons.local_fire_department_outlined),
                            ),
                          ],
                        ),

                        const SizedBox(height: 24),

                        // Category Section
                        _buildSectionHeader(
                            'Category', Icons.category_outlined),
                        const SizedBox(height: 12),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: CategoryDropdownField(
                            selectedCategory: selectedCategory,
                            onChanged: (value) {
                              setState(() {
                                selectedCategory = value;
                              });
                            },
                          ),
                        ),

                        const SizedBox(height: 32),

                        // Ingredients Section
                        _buildSectionHeader(
                            'Ingredients', Icons.restaurant_outlined),
                        const SizedBox(height: 16),
                        _buildIngredientInput(),
                        const SizedBox(height: 16),
                        _buildIngredientsList(),

                        const SizedBox(height: 32),

                        // Steps Section
                        _buildSectionHeader(
                            'Cooking Steps', Icons.list_alt_outlined),
                        const SizedBox(height: 16),
                        _buildStepInput(),
                        const SizedBox(height: 16),
                        _buildStepsList(),

                        const SizedBox(height: 40),

                        // Save button
                        Container(
                          width: double.infinity,
                          height: 56,
                          decoration: BoxDecoration(
                            color: AppColors.buttonColor,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.orange.withOpacity(0.3),
                                blurRadius: 12,
                                offset: const Offset(0, 6),
                              ),
                            ],
                          ),
                          child: ElevatedButton(
                            onPressed: _saveRecipe,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.save_outlined, color: Colors.white),
                                SizedBox(width: 8),
                                Text(
                                  "Save Recipe",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, IconData icon) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.orange.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: Colors.orange, size: 20),
        ),
        const SizedBox(width: 12),
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }

  Widget _buildImagePickerSection() {
    return Container(
      width: double.infinity,
      height: 220,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: _recipeCubit.selectedRecipeImage != null
          ? _buildSelectedImage()
          : _buildImagePickerPlaceholder(),
    );
  }

  Widget _buildSelectedImage() {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.file(
            _recipeCubit.selectedRecipeImage!,
            width: double.infinity,
            height: 220,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(0.3),
                Colors.transparent,
                Colors.transparent,
                Colors.black.withOpacity(0.3),
              ],
            ),
          ),
        ),
        Positioned(
          top: 12,
          right: 12,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.7),
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.white, size: 20),
              onPressed: () {
                _recipeCubit.clearSelectedImage();
              },
            ),
          ),
        ),
        Positioned(
          bottom: 12,
          right: 12,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.orange.withOpacity(0.9),
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
              icon: const Icon(Icons.edit, color: Colors.white, size: 20),
              onPressed: () {
                showImagePickerBottomSheet(context);
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildImagePickerPlaceholder() {
    return BlocBuilder(
      bloc: _recipeCubit,
      builder: (context, state) {
        return Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              showImagePickerBottomSheet(context);
            },
            borderRadius: BorderRadius.circular(20),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey[200]!, width: 2),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add_photo_alternate_outlined,
                    size: 64,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Add Recipe Image',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black87,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Tap to select from gallery or camera',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildIngredientInput() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TextFormField(
        controller: ingredientsController,
        decoration: InputDecoration(
          labelText: 'Add Ingredient',
          prefixIcon: Icon(Icons.restaurant_outlined, color: Colors.orange),
          suffixIcon: Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
              icon: const Icon(Icons.add, color: Colors.white),
              onPressed: () {
                if (ingredientsController.text.trim().isNotEmpty) {
                  setState(() {
                    ingredients.add(ingredientsController.text.trim());
                    ingredientsController.clear();
                  });
                  _showSnackBar('Ingredient added!', Colors.green);
                }
              },
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }

  Widget _buildIngredientsList() {
    if (ingredients.isEmpty) {
      return Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.grey[50],
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey[200]!),
        ),
        child: const Center(
          child: Text(
            'No ingredients added yet',
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
        ),
      );
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: ingredients.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: ListTile(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            leading: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.orange.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                '${index + 1}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
            ),
            title: Text(
              ingredients[index],
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.delete_outline, color: Colors.red),
              onPressed: () {
                setState(() {
                  ingredients.removeAt(index);
                });
                _showSnackBar('Ingredient removed', Colors.orange);
              },
            ),
          ),
        );
      },
    );
  }

  Widget _buildStepInput() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TextFormField(
        controller: stepController,
        maxLines: 3,
        decoration: InputDecoration(
          labelText: 'Add Cooking Step',
          prefixIcon: Icon(Icons.list_alt_outlined, color: Colors.orange),
          suffixIcon: Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
              icon: const Icon(Icons.add, color: Colors.white),
              onPressed: () {
                if (stepController.text.trim().isNotEmpty) {
                  setState(() {
                    recipeSteps.add(stepController.text.trim());
                    stepController.clear();
                  });
                  _showSnackBar('Step added!', Colors.green);
                }
              },
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }

  Widget _buildStepsList() {
    if (recipeSteps.isEmpty) {
      return Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.grey[50],
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey[200]!),
        ),
        child: const Center(
          child: Text(
            'No cooking steps added yet',
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
        ),
      );
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: recipeSteps.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.all(16),
            leading: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.orange.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                '${index + 1}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                  fontSize: 16,
                ),
              ),
            ),
            title: Text(
              recipeSteps[index],
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                height: 1.4,
              ),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.delete_outline, color: Colors.red),
              onPressed: () {
                setState(() {
                  recipeSteps.removeAt(index);
                });
                _showSnackBar('Step removed', Colors.orange);
              },
            ),
          ),
        );
      },
    );
  }

  Widget _buildInput(String label, TextEditingController controller,
      {bool isNumber = false,
      int maxLines = 1,
      String? suffix,
      IconData? icon}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: TextFormField(
          controller: controller,
          maxLines: maxLines,
          keyboardType: isNumber ? TextInputType.number : TextInputType.text,
          decoration: InputDecoration(
            labelText: label,
            prefixIcon: icon != null ? Icon(icon, color: Colors.orange) : null,
            suffixText: suffix,
            suffixStyle: TextStyle(
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.all(16),
          ),
          validator: (value) =>
              value?.isEmpty ?? true ? 'Please enter $label' : null,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _slideController.dispose();
    titleController.dispose();
    descriptionController.dispose();
    timeController.dispose();
    caloriesController.dispose();
    stepController.dispose();
    ingredientsController.dispose();
    super.dispose();
  }
}
