import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stove_genie/bloc/cubit/auth_cubit.dart';
import 'package:stove_genie/core/di_container.dart';
import 'package:stove_genie/utils/colors.dart';
import 'package:stove_genie/utils/images.dart';
import 'package:stove_genie/widget/google_container.dart';

class SignInDivierRow extends StatelessWidget {
  const SignInDivierRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 90),
          child: Row(
            children: [
              Expanded(child: Divider()),
              SizedBox(
                width: 8,
              ),
              Text(
                'Or Sign up With',
                style: GoogleFonts.poppins(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: AppColors.hinttextColor),
              ),
              SizedBox(
                width: 8,
              ),
              Expanded(child: Divider()),
            ],
          ),
        ),
        SizedBox(height: 20),
        GestureDetector(
          onTap: () {
            _authCubit.signInWithGoogle(context);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 110),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GoogleContainer(image: AppImages.googleImage),
                // SizedBox(width: 20),
                // GoogleContainer(image: AppImages.facebookImage),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

final AuthCubit _authCubit = Di().sl<AuthCubit>();
