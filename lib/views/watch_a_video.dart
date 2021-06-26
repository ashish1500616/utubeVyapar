import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:utubevyappar/controller/AdsController.dart';
import 'package:utubevyappar/controller/watch_video_controller.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

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
    AdsController adsController = Get.put(AdsController());
    // Calling On Start fix this;
    // watchVideoController.getRandomCampaignURL();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange.shade200,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: YoutubePlayer(
                  controller: watchVideoController.youtubePlayerController,
                  aspectRatio: 16 / 9,
                ),
              ),
            ),
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
                      duration: 15,
                      initialDuration: 0,
                      controller: _countDownController,
                      // Ring Color for Countdown Widget.
                      ringColor: Colors.deepOrange.shade200,
                      // Ring Gradient for Countdown Widget.
                      ringGradient: null,
                      // Filling Color for Countdown Widget.
                      fillColor: Colors.deepOrange.shade700,
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
                        adsController.createInterstitialAd();
                      },
                      // This Callback will execute when the Countdown Ends.
                      onComplete: () {
                        watchVideoController.getAndPlayRandomCampaign();
                        // Pass Value instead of hard coded value
                        watchVideoController.settlePoints(100);
                        adsController.showInterstitialAd();
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
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Text("Coins",
                          style: TextStyle(
                            color: Colors.deepOrange.shade600,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.0,
                          )),
                    ),
                    Container(
                      height: 100,
                      width: 100,
                      child: Obx(
                        () => (watchVideoController.currentPoint.value == "0" ||
                                watchVideoController.isSettlingPoints.isTrue)
                            ? SpinKitChasingDots(
                                color: Colors.deepOrange.shade300)
                            : Align(
                                alignment: Alignment.center,
                                child: Text(
                                    watchVideoController.currentPoint.value,
                                    style: TextStyle(
                                      color: Colors.orange.shade700,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 1.0,
                                    )),
                              ),
                      ),
                    )
                  ],
                ),
              ],
            ),
            Obx(
              () => (watchVideoController.youtubeChannel.value != "")
                  ? InkWell(
                      onTap: () {
                        watchVideoController.launchInWebViewWithJavaScript();
                        // watchVideoController.delegateOpeningYoutubeChannelLink();
                      },
                      child: Container(
                        width: _mediaQuery.width * 0.5,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: Card(
                                child: Image.asset(
                                  "assets/images/subscribe.png",
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                            ),
                            Text(
                              "Click to subscribe",
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                fontSize: 20,
                                fontFamily: 'Open Sans',
                                fontWeight: FontWeight.normal,
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  : Container(),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    "Please add your channel if not added yet to get subscribers from UtubeVyapar network.",
                    style: TextStyle(
                        color: Colors.blue.shade300,
                        fontSize: 12,
                        letterSpacing: 0.5),
                  ),
                ],
              ),
            )
            /*    : Container()),*/
          ],
        ),
      ),
    );
  }
}
