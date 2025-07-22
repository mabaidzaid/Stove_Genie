import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stove_genie/pages/notification_screen/presentation/widget/container.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: Color(0xff121212)),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        primary: true,
        scrolledUnderElevation: 0,
        elevation: 0,
      ),
      body: Center(
        child: Column(spacing: 10,
          children: [
            SizedBox(height: 20),
            mainContainer(
                context,
                'New Recipe Alert!',
                'Lorem Ipsum tempor incididunt ut labore et dolore,in voluptate velit esse cillum',
                true),
            mainContainer(
                context,
                'New Recipe Alert!',
                'Lorem Ipsum tempor incididunt ut labore et dolore,in voluptate velit esse cillum',
                true),
            mainContainer(
                context,
                'New Recipe Alert!',
                'Lorem Ipsum tempor incididunt ut labore et dolore,in voluptate velit esse cillum',
                true),
            mainContainer(
                context,
                'New Recipe Alert!',
                'Lorem Ipsum tempor incididunt ut labore et dolore,in voluptate velit esse cillum',
                false),
            mainContainer(
                context,
                'New Recipe Alert!',
                'Lorem Ipsum tempor incididunt ut labore et dolore,in voluptate velit esse cillum',
                false),
            mainContainer(
                context,
                'New Recipe Alert!',
                'Lorem Ipsum tempor incididunt ut labore et dolore,in voluptate velit esse cillum',
                false),
          ],
        ),
      ),
    );
  }
}
