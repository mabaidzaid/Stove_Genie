import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stove_genie/pages/forget_password/presentation/widget/forget_field.dart';
import 'package:stove_genie/utils/colors.dart';
import 'package:stove_genie/utils/helper.dart';
import 'package:stove_genie/utils/images.dart';
import 'package:stove_genie/widget/forget_text.dart';

class ForgetScreen extends StatelessWidget {
  const ForgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        scrolledUnderElevation: 0,
        elevation: 0,
        primary: true,
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: SvgPicture.asset('assets/icons/arrow-left.svg')),
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: getHeight(context) * 0.05,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: forgetText(context, 'Forget Password',
                'It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum.'),
          ),
          SizedBox(
            height: getHeight(context) * 0.2,
          ),
          ForgetField(),
        ],
      ),
    );
  }
}
