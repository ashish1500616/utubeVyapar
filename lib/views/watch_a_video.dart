import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:utubevyappar/controller/youtube_player_controller.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class WatchVideo extends StatefulWidget {
  @override
  _WatchVideoState createState() => _WatchVideoState();
}

class _WatchVideoState extends State<WatchVideo> {
  @override
  Widget build(BuildContext context) {
    final YoutubeVideoController youtubeVideoController =
    Get.put(YoutubeVideoController());
    var videoUrl = youtubeVideoController.getVideoURL();
    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(videoUrl).toString(),
      flags: YoutubePlayerFlags(
        enableCaption: false,
        disableDragSeek: true,
        hideControls: true,
        loop: true,
      ),
    );
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: YoutubePlayer(
            controller: _controller,
            aspectRatio: 16 / 9,
          ),
        ),
      ),
    );
  }
}
