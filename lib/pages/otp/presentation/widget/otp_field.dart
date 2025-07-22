import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stove_genie/reset_passowrd/presentation/screen/reset_password_screen.dart';
import 'package:stove_genie/utils/colors.dart';
import 'package:stove_genie/widget/custom_button.dart';

class OtpField extends StatelessWidget {
  const OtpField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OtpTextField(
          fieldHeight: 55,
          borderRadius: BorderRadius.all(Radius.circular(12)),
          numberOfFields: 5,
          focusedBorderColor: AppColors.buttonColor,
          showFieldAsBox: true,
          onCodeChanged: (String code) {},
          onSubmit: (String verificationCode) {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text("Verification Code"),
                    content: Text('Code entered is $verificationCode'),
                  );
                });
          },
        ),
        SizedBox(
          height: 21,
        ),
        CustomButton(
            onTap: () {
              // context.router.replaceAll([ResetPasswordRoute()]);
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (context) => ResetPasswordScreen()),
                  (route) => false);
            },
            text: "Reset Password"),
        SizedBox(
          height: 21,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: RichText(
              text: TextSpan(children: [
            TextSpan(
              text: 'Didn’t get OTP?',
              style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.otptextColor),
            ),
            TextSpan(
              text: ' Resend OTP',
              style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.buttonColor),
            ),
          ])),
        ),
      ],
    );
  }
}
