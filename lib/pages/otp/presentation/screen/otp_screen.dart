import 'package:flutter/material.dart';
import 'package:stove_genie/pages/otp/presentation/widget/otp_field.dart';
import 'package:stove_genie/utils/helper.dart';
import 'package:stove_genie/widget/forget_text.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          SizedBox(
            height: getHeight(context) * 0.15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: forgetText(context, 'Enter OTP',
                'It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum.'),
          ),
          SizedBox(
            height: getHeight(context) * 0.17,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: OtpField(),
            ),
          ),
        ],
      ),
    );
  }
}
