import 'package:flutter/material.dart';
import 'package:stove_genie/pages/sign_in/presentation/screen/sign_in_screen.dart';
import 'package:stove_genie/utils/images.dart';
import 'package:stove_genie/widget/custom_button.dart';
import 'package:stove_genie/widget/custom_text_field.dart';

class ResetField extends StatefulWidget {
  const ResetField({super.key});

  @override
  State<ResetField> createState() => _ResetFieldState();
}

class _ResetFieldState extends State<ResetField> {
  bool isLoading = false;

  void handleSubmit() async {
    setState(() {
      isLoading = true;
    });

    // Simulate network call or processing
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      isLoading = false;
    });

    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => SignInScreen()),
        (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          isPass: true,
          text: 'New Password',
        ),
        const SizedBox(
          height: 16,
        ),
        CustomTextField(
          text: 'Confirm Password',
          isPass: true,
          // xicon: Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     SvgPicture.asset(AppImages.),
          //   ],
          // ),
        ),
        const SizedBox(
          height: 16,
        ),
        CustomButton(
          onTap:
              isLoading ? null : handleSubmit, // Disable button while loading

          svgPicture: isLoading // Conditionally show progress indicator
              ? AppImages.loaderIcon
              : null,
          text: isLoading
              ? "Submitting..." // Button text changes during loading
              : "Submit",
        ),
        if (isLoading)
          const SizedBox(
            height: 20,
          ),
      ],
    );
  }
}
