import 'package:flutter/material.dart';
import 'package:stove_genie/reset_passowrd/presentation/widget/reset_field.dart';
import 'package:stove_genie/utils/helper.dart';
import 'package:stove_genie/widget/forget_text.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      // backgroundColor: AppColors.whiteColor,
      body: Column(
        children: [
          SizedBox(
            height: getHeight(context) * 0.15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: forgetText(context, 'Reset Password',
                'It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum.'),
          ),
          SizedBox(
            height: getHeight(context) * 0.17,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ResetField(),
          ),
        ],
      ),
    );
  }
}
