import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stove_genie/bloc/cubit/auth_cubit.dart';
import 'package:stove_genie/core/di_container.dart';
import 'package:stove_genie/pages/forget_password/presentation/screen/forget_screen.dart';
import 'package:stove_genie/utils/colors.dart';
import 'package:stove_genie/utils/images.dart';
import 'package:stove_genie/widget/custom_button.dart';
import 'package:stove_genie/widget/custom_text_field.dart';

class SignInField extends StatefulWidget {
  const SignInField({super.key});

  @override
  State<SignInField> createState() => _SignInFieldState();
}

class _SignInFieldState extends State<SignInField> {
  late final TextEditingController _email;
  late final TextEditingController _password;
  late final AuthCubit _auth;

  @override
  void initState() {
    super.initState();
    _email = TextEditingController();
    _password = TextEditingController();
    _auth = Di().sl<AuthCubit>();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //  Enter Email
        Text(
          'Email',
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.h1Color,
          ),
        ),
        const SizedBox(height: 8),
        CustomTextField(
          text: 'Enter Email',
          controller: _email,
        ),
        const SizedBox(height: 11),

        //  password
        Text(
          'Password',
          textAlign: TextAlign.left,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.h1Color,
          ),
        ),
        const SizedBox(height: 8),
        CustomTextField(
          text: 'Enter Password',
          controller: _password,
          isPass: true,
        ),
        const SizedBox(height: 15),

        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const ForgetScreen()),
            );
          },
          child: Text(
            'Forgot Password?',
            style: GoogleFonts.poppins(
              fontSize: 11,
              fontWeight: FontWeight.w400,
              color: AppColors.buttonColor,
            ),
          ),
        ),
        const SizedBox(height: 40),

        CustomButton(
          onTap: () async {
            // Add basic validation
            if (_email.text.trim().isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Please enter your email')),
              );
              return;
            }
            if (_password.text.trim().isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Please enter your password')),
              );
              return;
            }

            try {
              await _auth.signIn(
                  _email.text.trim(), _password.text.trim(), context);
            } catch (e) {
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Sign in failed: ${e.toString()}')),
                );
              }
            }
          },
          text: 'Sign In',
          svgPicture: AppImages.forwodicon,
        ),
        const SizedBox(height: 25),
      ],
    );
  }
}
