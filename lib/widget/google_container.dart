import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stove_genie/utils/colors.dart';

class GoogleContainer extends StatelessWidget {
  final VoidCallback? onTap;

  final String image;

  const GoogleContainer({
    this.onTap,
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 44,
        width: 44,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.googleblurColor,
              blurRadius: 5,
              spreadRadius: 3,
            ),
          ],
        ),
        child: Center(
            child: SizedBox(height: 24, width: 24, child: Image.asset(image))),
      ),
    );
  }
}
