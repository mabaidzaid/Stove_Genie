import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stove_genie/pages/reviews_screen/presentation/widget/comment.dart';
import 'package:stove_genie/pages/reviews_screen/presentation/widget/text_field.dart';

class ReviewsScreen extends StatelessWidget {
  const ReviewsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        primary: true,
        backgroundColor: Colors.white,
        title: Text('Reviews'),
        centerTitle: true,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    '200 Comments',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 11,
                        color: Color(0xffa9a9a9)),
                  ),
                  Spacer(),
                  Text('155 Saved',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 11,
                          color: Color(0xffa9a9a9)))
                ],
              ),
              SizedBox(height: 10,),
              Text('Leave a Comment',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Color(0xff121212))),
                      SizedBox(height: 10,),
              TextInputWithButton(),
              SizedBox(height: 20),
              CommentWidget(),
              SizedBox(height: 20,),
              CommentWidget(),
              SizedBox(height: 20,),
              CommentWidget(),
              SizedBox(height: 20,),
              CommentWidget(),
              SizedBox(height: 20,),
              CommentWidget(),
              SizedBox(height: 20,),
              CommentWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
