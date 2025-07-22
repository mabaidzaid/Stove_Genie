import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stove_genie/pages/sign_in/presentation/screen/sign_in_screen.dart';
import 'package:stove_genie/pages/sign_up/presentation/widget/divider_row.dart';
import 'package:stove_genie/pages/sign_up/presentation/widget/sign_up_field.dart';
import 'package:stove_genie/utils/colors.dart';
import 'package:stove_genie/widget/sign_up_text.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            signupText(context, "Create an account",
                "Let’s help you set up your account, it won’t take long."),
            SizedBox(
              height: 37,
            ),
            // TextFormField & checkbox or singUpButton
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SignUpField(),
            ),
            SizedBox(
              height: 20,
            ),
            // divider & Google Container
            DividerRow(),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 115),
              child: Row(
                children: [
                  Text(
                    "Already a member?",
                    style: GoogleFonts.poppins(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color: AppColors.blackColor,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SignInScreen()));
                    },
                    child: Text(
                      "Sign In",
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
      ),
    );
  }
}
