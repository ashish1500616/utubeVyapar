import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:utubevyappar/controller/watch_video_controller.dart';

class WatchVideo extends StatefulWidget {
  @override
  _WatchVideoState createState() => _WatchVideoState();
}

class _WatchVideoState extends State<WatchVideo> {
  @override
  Widget build(BuildContext context) {
    final _mediaQuery = MediaQuery.of(context).size;
    final WatchVideoController watchVideoController =
        Get.put(WatchVideoController());
    CountDownController _countDownController =
        watchVideoController.getTimerController();
    // Calling On Start fix this;
    // watchVideoController.getRandomCampaignURL();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Column(
        children: [
          // Obx(() => Text(watchVideoController.campaignVideoUrl.value)),
          /*          Container(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: YoutubePlayer(
                controller: watchVideoController.youtubePlayerController,
                aspectRatio: 16 / 9,
              ),
            ),
          ),*/
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Container(
                  height: _mediaQuery.height * 0.3,
                  // Height of the Countdown Widget.
                  width: _mediaQuery.width * 0.3,
                  child: CircularCountDownTimer(
                    height: _mediaQuery.height * 0.5,
                    // Height of the Countdown Widget.
                    width: _mediaQuery.width * 0.5,
                    duration: 20,
                    initialDuration: 0,
                    controller: _countDownController,
                    // Ring Color for Countdown Widget.
                    ringColor: Colors.blue,

                    // Ring Gradient for Countdown Widget.
                    ringGradient: null,

                    // Filling Color for Countdown Widget.
                    fillColor: Colors.black87,

                    // Filling Gradient for Countdown Widget.
                    fillGradient: null,

                    // Background Color for Countdown Widget.
                    backgroundColor: Colors.white,

                    // Background Gradient for Countdown Widget.
                    backgroundGradient: null,

                    // Border Thickness of the Countdown Ring.
                    strokeWidth: 20.0,

                    // Begin and end contours with a flat edge and no extension.
                    strokeCap: StrokeCap.round,

                    // Text Style for Countdown Text.
                    textStyle: TextStyle(
                        fontSize: 33.0,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold),

                    // Format for the Countdown Text.
                    textFormat: CountdownTextFormat.S,

                    // Handles Countdown Timer (true for Reverse Countdown (max to 0), false for Forward Countdown (0 to max)).
                    isReverse: true,

                    // Handles Animation Direction (true for Reverse Animation, false for Forward Animation).
                    isReverseAnimation: false,

                    // Handles visibility of the Countdown Text.
                    isTimerTextShown: true,

                    // Handles the timer start.
                    autoStart: true,

                    // This Callback will execute when the Countdown Starts.
                    onStart: () {
                      // Here, do whatever you want
                      print('Countdown Started');
                    },

                    // This Callback will execute when the Countdown Ends.
                    onComplete: () {
                      watchVideoController.getAndPlayRandomCampaign();
                      watchVideoController.settlePoints(100);
                      _countDownController.restart();
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(30),
                child: Container(
                  width: 40,
                  height: 80,
                  child: VerticalDivider(
                    color: Colors.blue,
                  ),
                ),
              ),
              Obx(() => Text(watchVideoController.currentPoint.value))
            ],
          ),
        ],
      ),
    );
  }
}
