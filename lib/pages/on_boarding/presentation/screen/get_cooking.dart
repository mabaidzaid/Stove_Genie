import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stove_genie/pages/on_boarding/presentation/screen/on_boarding.dart';
import 'package:stove_genie/utils/helper.dart';
import 'package:stove_genie/utils/images.dart';

class GetCooking extends StatelessWidget {
  const GetCooking({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
              child: Image.asset('assets/images/splashImage.png',
                  fit: BoxFit.cover)),
          Positioned(
            top: getHeight(context) * 0.10,
            left: 0,
            right: 0,
            child: Image.asset(
              AppImages.logoImage,
              width: getWidth(context) * 0.5,
              height: getHeight(context) * 0.25,
            ),
          ),
          Positioned(
              bottom: getHeight(context) * 0.1,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  SizedBox(
                    width: getWidth(context) * 0.7,
                    child: Text(
                      'Get Cooking',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 50,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text('Granting every foodie\'s wish',
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w400)),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OnBoarding()));
                      },
                      child: Container(
                        width: getWidth(context) * 0.45,
                        height: 54,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xffffa307)),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            spacing: 3,
                            children: [
                              Text('Start Cooking',
                                  style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600)),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
