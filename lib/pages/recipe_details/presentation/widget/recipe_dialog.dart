import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';

void showRecipeDialog(BuildContext context, String link) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.close, color: Colors.black)),
                ),
                Text(
                  'Recipe Link',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Copy recipe link and share your recipe link with friends and family.',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 11,
                    color: Color(0xFF797979),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                      color: Color(0xffd9d9d9),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            link,
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 11,
                              color: Color(0xff121212),
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Share.share(
                              'Check out this amazing recipe on Stove Genie!\nhttps://www.stovegenie.com/recipe',
                              subject: 'Stove Genie Recipe',
                            );
                            Clipboard.setData(ClipboardData(text: link));
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text('Link copied to clipboard!')),
                            );
                          },
                          child: Container(
                            height: 43,
                            width: 80,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xffFFA307)),
                            child: Center(
                              child: Text(
                                'Copy Link',
                                style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 11),
                              ),
                            ),
                          ),
                        ),
                        // IconButton(
                        //   icon: Icon(Icons.copy, color: Colors.black),
                        //   onPressed: () {
                        //     Clipboard.setData(ClipboardData(text: link));
                        //     ScaffoldMessenger.of(context).showSnackBar(
                        //       SnackBar(content: Text('Link copied to clipboard!')),
                        //     );
                        //   },
                        // ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
