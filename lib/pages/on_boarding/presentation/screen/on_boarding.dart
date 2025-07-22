import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stove_genie/pages/on_boarding/presentation/screen/content_model.dart';
import 'package:stove_genie/pages/sign_up/presentation/screen/sign_up_screen.dart';
import 'package:stove_genie/utils/helper.dart';
import 'package:stove_genie/utils/images.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int currentIndex = 0;
  late PageController _imageController;
  late PageController _textController;

  @override
  void initState() {
    _imageController = PageController(initialPage: 0);
    _textController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _imageController.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFfafcfd),
      body: Stack(
        children: [
          Positioned.fill(
            child: PageView.builder(
              physics: NeverScrollableScrollPhysics(),
              controller: _imageController,
              itemCount: contents.length,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (_, i) {
                return Image.asset(
                  contents[i].image,
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
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
            bottom: getHeight(context) * 0.15,
            left: 0,
            right: 0,
            child: SizedBox(
              height: 150,
              child: PageView.builder(
                controller: _textController,
                itemCount: contents.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (_, i) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: getWidth(context) * 0.9,
                          child: Text(contents[i].title,
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600)),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: getWidth(context) * 0.9,
                          child: Text(contents[i].description,
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400)),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          Positioned(
              bottom: getHeight(context) * 0.07,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 35,
                  children: [
                    Expanded(
                        child: GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpScreen()));
                      },
                      child: Container(
                        height: 54,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.white)),
                        child: Center(
                          child: Text('Skip',
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600)),
                        ),
                      ),
                    )),
                    Expanded(
                        child: GestureDetector(
                      onTap: () {
                        if (currentIndex < contents.length - 1) {
                          _imageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                          );
                          _textController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                          );
                        } else {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUpScreen()));
                        }
                      },
                      child: Container(
                        height: 54,
                        decoration: BoxDecoration(
                          color: Color(0xffffa307),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                              currentIndex == contents.length - 1
                                  ? 'Get Started'
                                  : 'Next',
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600)),
                        ),
                      ),
                    )),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
