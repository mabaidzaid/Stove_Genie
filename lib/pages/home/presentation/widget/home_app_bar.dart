import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stove_genie/bloc/cubit/auth_cubit.dart';
import 'package:stove_genie/core/di_container.dart';
import 'package:stove_genie/pages/mini_tv/presentation/screen/mini_tv_screen.dart';
import 'package:stove_genie/utils/colors.dart';
import 'package:stove_genie/utils/images.dart';
import 'package:stove_genie/pages/chat/chat_screen.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello ${_authCubit.user.name}!",
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: AppColors.blackColor,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              "What are you cooking today?",
              style: GoogleFonts.poppins(
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                  color: AppColors.cheifColor),
            ),
          ],
        ),
        const Spacer(),

        /// Mini TV Button
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const MiniTvScreen())
            );
          },
          child: SvgPicture.asset(AppImages.tvIcon),
        ),

        const SizedBox(width: 10),

        /// AI Avatar-style Icon (replacing profile)
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const ChatScreen())
            );
          },
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              color: AppColors.buttonColor,
            ),
            child: const Padding(
              padding: EdgeInsets.all(5.0),
              child: Icon(Icons.smart_toy_outlined, color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }
}

final _authCubit = Di().sl<AuthCubit>();
