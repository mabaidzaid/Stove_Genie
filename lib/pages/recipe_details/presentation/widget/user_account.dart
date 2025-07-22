import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stove_genie/utils/helper.dart';

class UserAccountWidget extends StatefulWidget {
  final String userId;

  const UserAccountWidget({super.key, required this.userId});

  @override
  State<UserAccountWidget> createState() => _UserAccountWidgetState();
}

class _UserAccountWidgetState extends State<UserAccountWidget> {
  bool isFollowing = false;
  Map<String, dynamic>? userData;

  String get currentUserId => FirebaseAuth.instance.currentUser!.uid;

  Future<void> getUserDetails() async {
    final userDoc = await FirebaseFirestore.instance
        .collection('users')
        .doc(widget.userId)
        .get();

    final currentUserDoc = await FirebaseFirestore.instance
        .collection('users')
        .doc(currentUserId)
        .get();

    final followers = List<String>.from(userDoc.data()?['followers'] ?? []);
    final following =
        List<String>.from(currentUserDoc.data()?['following'] ?? []);

    setState(() {
      isFollowing = followers.contains(currentUserId);
      userData = userDoc.data();
    });
  }

  Future<void> toggleFollow() async {
    final userRef =
        FirebaseFirestore.instance.collection('users').doc(widget.userId);
    final currentUserRef =
        FirebaseFirestore.instance.collection('users').doc(currentUserId);

    if (isFollowing) {
      await userRef.update({
        'followers': FieldValue.arrayRemove([currentUserId])
      });
      await currentUserRef.update({
        'following': FieldValue.arrayRemove([widget.userId])
      });
    } else {
      await userRef.update({
        'followers': FieldValue.arrayUnion([currentUserId])
      });
      await currentUserRef.update({
        'following': FieldValue.arrayUnion([widget.userId])
      });
    }

    setState(() {
      isFollowing = !isFollowing;
    });
  }

  @override
  void initState() {
    super.initState();
    getUserDetails();
  }

  @override
  Widget build(BuildContext context) {
    if (userData == null) {
      return const Padding(
        padding: EdgeInsets.all(16),
        child: CircularProgressIndicator(),
      );
    }

    final isMe = widget.userId == currentUserId;

    return userAccount(
      context,
      userData?['image'] ?? '',
      userData?['name'] ?? '',
      userData?['city'] ?? 'Unknown',
      isFollowing,
      toggleFollow,
      isMe,
    );
  }
}

Widget userAccount(BuildContext context, String imgPath, String name,
    String loc, bool isFollowing, VoidCallback onFollowTap, bool isMe) {
  return SizedBox(
    width: getWidth(context) * 0.9,
    child: Row(
      children: [
        CircleAvatar(
          radius: 24,
          backgroundImage: imgPath.isNotEmpty
              ? NetworkImage(imgPath)
              : const AssetImage('assets/images/profile.png') as ImageProvider,
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name,
                style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black)),
            Row(
              children: [
                const Icon(Icons.location_on_rounded,
                    size: 15, color: Color(0xffFFA307)),
                Text(loc,
                    style: GoogleFonts.poppins(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xffa9a9a9)))
              ],
            )
          ],
        ),
        const Spacer(),
        if (!isMe)
          GestureDetector(
            onTap: onFollowTap,
            child: Container(
              width: 85,
              height: 37,
              decoration: BoxDecoration(
                color: isFollowing ? Colors.grey[300] : const Color(0xffFFA307),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(isFollowing ? 'Unfollow' : 'Follow',
                    style: GoogleFonts.poppins(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: isFollowing ? Colors.black : Colors.white)),
              ),
            ),
          )
      ],
    ),
  );
}
