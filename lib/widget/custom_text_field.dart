import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stove_genie/utils/colors.dart';

class CustomTextField extends StatelessWidget {
  final String text;
  final Widget? icon;
  final Widget? xicon;
  final Function()? onTap;
  final bool isreadonly;
  final bool isPass;
  final TextEditingController? controller;
  final TextInputType? keyboardtype;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final bool? enabled;
  final int? maxLines;
  final int? minLines;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final void Function(String)? onFieldSubmitted;
  final bool? autofocus;

  const CustomTextField({
    super.key,
    required this.text,
    this.icon,
    this.xicon,
    this.isPass = false,
    this.onTap,
    this.isreadonly = false,
    this.controller,
    this.keyboardtype,
    this.validator,
    this.onChanged,
    this.enabled = true,
    this.maxLines = 1,
    this.minLines,
    this.textInputAction,
    this.focusNode,
    this.onFieldSubmitted,
    this.autofocus = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isPass,
      style: GoogleFonts.inter(
        color: enabled! ? AppColors.h1Color : AppColors.hinttextColor,
      ),
      onTap: onTap,
      keyboardType: keyboardtype,
      readOnly: isreadonly,
      validator: validator,
      onChanged: onChanged,
      enabled: enabled,
      maxLines: maxLines,
      minLines: minLines,
      textInputAction: textInputAction,
      focusNode: focusNode,
      onFieldSubmitted: onFieldSubmitted,
      autofocus: autofocus!,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(14),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.buttonColor,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(14),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(14),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(14),
        ),
        filled: true,
        fillColor: enabled!
            ? AppColors.fieldColor
            : AppColors.fieldColor.withOpacity(0.5),
        hintText: text,
        hintStyle: GoogleFonts.poppins(
          fontSize: 11,
          fontWeight: FontWeight.w400,
          color: AppColors.blackColor.withOpacity(.5),
        ),
        suffixIcon: xicon,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        errorStyle: GoogleFonts.poppins(
          fontSize: 10,
          color: Colors.red,
        ),
      ),
    );
  }
}
