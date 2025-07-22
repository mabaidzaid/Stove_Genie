import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stove_genie/utils/colors.dart';

class CategoryDropdownField extends StatelessWidget {
  final String? selectedCategory;
  final Function(String?) onChanged;

  const CategoryDropdownField({
    super.key,
    required this.selectedCategory,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> categories = ['Indian', 'Italian', 'Asian', 'Chinese'];

    return DropdownButtonFormField<String>(
      dropdownColor: AppColors.whiteColor,
      style: GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: AppColors.blackColor,
      ),
      icon: const Icon(Icons.arrow_drop_down),
      iconEnabledColor: AppColors.buttonColor,
      decoration: InputDecoration(
        labelText: 'Select Category',
        labelStyle: GoogleFonts.poppins(
          color: AppColors.buttonColor,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        filled: true,
        fillColor: AppColors.whiteColor,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.buttonColor, width: 1.5),
          borderRadius: BorderRadius.circular(14),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.buttonColor, width: 2),
          borderRadius: BorderRadius.circular(14),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      ),
      value: selectedCategory,
      onChanged: onChanged,
      items: categories.map((String category) {
        return DropdownMenuItem<String>(
          value: category,
          child: Text(
            category,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.blackColor,
            ),
          ),
        );
      }).toList(),
    );
  }
}
