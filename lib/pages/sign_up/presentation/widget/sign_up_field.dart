import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stove_genie/bloc/cubit/auth_cubit.dart';
import 'package:stove_genie/core/di_container.dart';
import 'package:stove_genie/pages/sign_in/presentation/screen/sign_in_screen.dart';
import 'package:stove_genie/pages/sign_up/presentation/widget/check_row.dart';
import 'package:stove_genie/utils/colors.dart';
import 'package:stove_genie/utils/images.dart';
import 'package:stove_genie/widget/custom_button.dart';
import 'package:stove_genie/widget/custom_text_field.dart';

class SignUpField extends StatefulWidget {
  const SignUpField({super.key});

  @override
  State<SignUpField> createState() => _SignUpFieldState();
}

class _SignUpFieldState extends State<SignUpField> {
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _confirmPassword = TextEditingController();
  final _authCubit = Di().sl<AuthCubit>();
  final _formKey = GlobalKey<FormState>();
  bool _passwordsMatch = true;

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _password.dispose();
    _confirmPassword.dispose();
    super.dispose();
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  void _checkPasswordMatch() {
    setState(() {
      _passwordsMatch = _password.text == _confirmPassword.text;
    });
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate() && _passwordsMatch) {
      await _authCubit.signUp(
        email: _email.text,
        password: _password.text,
        username: _name.text,
        context: context,
      );
      if (mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SignInScreen()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Full Name
          Text(
            'Name',
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.h1Color,
            ),
          ),
          const SizedBox(height: 5),
          CustomTextField(
            text: 'Enter Name',
            controller: _name,
            validator: (value) =>
                value?.isEmpty ?? true ? 'Please enter your name' : null,
          ),
          const SizedBox(height: 11),

          // Email
          Text(
            'Email',
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.h1Color,
            ),
          ),
          const SizedBox(height: 5),
          CustomTextField(
            text: 'Enter Email',
            controller: _email,
            validator: _validateEmail,
          ),
          const SizedBox(height: 11),

          // Password
          Text(
            'Password',
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.h1Color,
            ),
          ),
          const SizedBox(height: 5),
          CustomTextField(
            text: 'Enter Password',
            controller: _password,
            isPass: true,
            validator: _validatePassword,
            onChanged: (_) => _checkPasswordMatch(),
          ),
          const SizedBox(height: 11),

          // Confirm Password
          Text(
            'Confirm Password',
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.h1Color,
            ),
          ),
          const SizedBox(height: 5),
          CustomTextField(
            text: 'Retype Password',
            controller: _confirmPassword,
            isPass: true,
            validator: (value) {
              if (value?.isEmpty ?? true) return 'Please confirm your password';
              if (!_passwordsMatch) return 'Passwords do not match';
              return null;
            },
            onChanged: (_) => _checkPasswordMatch(),
          ),
          if (!_passwordsMatch)
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                'Passwords do not match',
                style: GoogleFonts.poppins(
                  color: Colors.red,
                  fontSize: 12,
                ),
              ),
            ),
          const SizedBox(height: 15),

          const CheckBoxRow(),
          const SizedBox(height: 25),

          CustomButton(
            onTap: _submitForm,
            text: 'Sign Up',
            svgPicture: AppImages.forwodicon,
          ),
        ],
      ),
    );
  }
}
