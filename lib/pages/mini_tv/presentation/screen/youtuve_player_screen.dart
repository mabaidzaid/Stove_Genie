import 'package:flutter/material.dart';
import 'package:stove_genie/utils/colors.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeVideoPlayerScreen extends StatefulWidget {
  final String videoUrl;

  const YoutubeVideoPlayerScreen({super.key, required this.videoUrl});

  @override
  State<YoutubeVideoPlayerScreen> createState() =>
      _YoutubeVideoPlayerScreenState();
}

class _YoutubeVideoPlayerScreenState extends State<YoutubeVideoPlayerScreen> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();

    final videoId = YoutubePlayer.convertUrlToId(widget.videoUrl);
    if (videoId == null) {
      debugPrint('❌ Invalid YouTube URL: ${widget.videoUrl}');
      return;
    }

    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        enableCaption: true,
        controlsVisibleAtStart: true,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.buttonColor,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Video Player",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
          progressIndicatorColor: Colors.redAccent,
          onReady: () {
            debugPrint('✅ YouTube Player is ready.');
          },
        ),
        builder: (context, player) {
          return Center(child: player);
        },
      ),
    );
  }
}
