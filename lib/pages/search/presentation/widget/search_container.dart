import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stove_genie/utils/colors.dart';
import 'package:stove_genie/utils/helper.dart';

class SearchContainer extends StatelessWidget {
  final String? imgPath;
  final String? rating;
  final String? recipeName;
  final String? chefName;
  final String? kCal;
  final String? time;
  final bool? showButton;

  const SearchContainer(
      {super.key,
      this.imgPath,
      this.rating,
      this.recipeName,
      this.chefName,
      this.kCal,
      this.time,
      this.showButton});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => RecipeDetails()));
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15.0),
        child: Container(
          width: 160,
          height: 160,
          decoration: BoxDecoration(
            image: imgPath != null
                ? DecorationImage(
                    image: AssetImage(imgPath!), fit: BoxFit.cover)
                : null,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Stack(
            children: [
              showButton != null
                  ? Positioned.fill(
                      child: Center(
                      child: Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Color(0xffd9d9d9)),
                        child: Center(
                          child: Icon(
                            Icons.play_arrow,
                            color: Color(0xffFFA307),
                          ),
                        ),
                      ),
                    ))
                  : SizedBox.shrink(),
              if (imgPath != null)
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          rating != null
                              ? IntrinsicWidth(
                                  child: Container(
                                    height: 20,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: const Color(0xffFFE1B3),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 6.0),
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.star,
                                            color: Color(0xffFFAD30),
                                            size: 16,
                                          ),
                                          Text(
                                            rating!,
                                            style: GoogleFonts.poppins(
                                                fontSize: 12),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              : const SizedBox.shrink(),
                        ],
                      ),
                      const Spacer(),
                      recipeName != null
                          ? SizedBox(
                              width: getWidth(context) * 0.6,
                              child: Text(
                                recipeName!,
                                maxLines: 2,
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 11,
                                    color: Colors.white),
                              ),
                            )
                          : const SizedBox.shrink(),
                      Row(
                        children: [
                          chefName != null
                              ? Text(
                                  chefName!,
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 8,
                                    color: AppColors.cheifColor,
                                  ),
                                )
                              : const SizedBox.shrink(),
                          if (chefName != null) const SizedBox(width: 10),
                          kCal != null
                              ? Row(
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                            'assets/icons/searchFlame.svg'),
                                      ],
                                    ),
                                    Text(
                                      kCal!,
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 10,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                )
                              : const SizedBox.shrink(),
                          const Spacer(),
                          time != null
                              ? Row(
                                  children: [
                                    SvgPicture.asset('assets/icons/timer.svg'),
                                    const SizedBox(width: 5),
                                    Text(
                                      time!,
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 10,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                )
                              : const SizedBox.shrink(),
                          const SizedBox(width: 10),
                          // Container(
                          //   width: 24,
                          //   height: 24,
                          //   decoration: const BoxDecoration(
                          //     shape: BoxShape.circle,
                          //     color: Colors.white,
                          //   ),
                          //   child: Padding(
                          //     padding: const EdgeInsets.all(4.0),
                          //     child: SvgPicture.asset(
                          //       'assets/icons/save_selected.svg',
                          //     ),
                          //   ),
                          // )
                        ],
                      )
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
