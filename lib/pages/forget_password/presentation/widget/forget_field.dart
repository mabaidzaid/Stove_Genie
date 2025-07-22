import 'package:flutter/material.dart';
import 'package:stove_genie/pages/otp/presentation/screen/otp_screen.dart';
import 'package:stove_genie/widget/custom_button.dart';
import 'package:stove_genie/widget/custom_text_field.dart';

class ForgetField extends StatelessWidget {
  const ForgetField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 32,
        children: [
          CustomTextField(text: "Email ID/ Mobile Number"),
          CustomButton(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => OtpScreen()));
              },
              text: "Continue")
        ],
      ),
    );
  }
}
