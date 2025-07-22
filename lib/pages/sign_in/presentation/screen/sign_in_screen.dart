import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stove_genie/pages/sign_in/presentation/widget/divider_row.dart';
import 'package:stove_genie/pages/sign_in/presentation/widget/sign_in_field.dart';
import 'package:stove_genie/pages/sign_up/presentation/screen/sign_up_screen.dart';
import 'package:stove_genie/utils/colors.dart';
import 'package:stove_genie/utils/helper.dart';
import 'package:stove_genie/widget/sign_up_text.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.whiteColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: getHeight(context) * 0.15,
          ),
          signupText(
            context,
            "Hello,",
            "Welcome Back!",
          ),
          SizedBox(
            height: 37,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SignInField(),
          ),
          SizedBox(
            height: 37,
          ),
          SignInDivierRow(),
          SizedBox(
            height: 37,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100),
            child: Row(
              children: [
                Text(
                  "Don’t have an account?",
                  style: GoogleFonts.poppins(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: AppColors.blackColor,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SignUpScreen()));
                  },
                  child: Text(
                    "Sign up",
                    style: GoogleFonts.poppins(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color: AppColors.buttonColor,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
