import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stove_genie/bloc/cubit/auth_cubit.dart';
import 'package:stove_genie/core/di_container.dart';
import 'package:stove_genie/utils/helper.dart';

Widget profileRow(BuildContext context) {
  final user = Di().sl<AuthCubit>().user;

  return SizedBox(
    width: getWidth(context) * 0.85,
    child: Row(
      children: [
        Container(
          width: 99,
          height: 99,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: user.image.isNotEmpty
                  ? NetworkImage(user.image)
                  : const AssetImage('assets/images/profile.png')
                      as ImageProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 25),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    'Recipes',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: const Color(0xffa9a9a9),
                    ),
                  ),
                  Text(
                    (user.uploadedRecipesCount ?? 0).toString(),
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: const Color(0xff121212),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    'Followers',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: const Color(0xffa9a9a9),
                    ),
                  ),
                  Text(
                    (user.followers ?? 0).toString(),
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: const Color(0xff121212),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    'Following',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: const Color(0xffa9a9a9),
                    ),
                  ),
                  Text(
                    (user.following ?? 0).toString(),
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: const Color(0xff121212),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    ),
  );
}
