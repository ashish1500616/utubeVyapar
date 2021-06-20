import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:get/get.dart';
import 'package:utubevyappar/services/fetch_user_service.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class WatchVideoController extends GetxController {
  CountDownController _timerController = CountDownController();
  FetchUserService fetchUserService = Get.put(FetchUserService());
  var campaignVideoUrl = "".obs;
  var youtubePlayerController;

  @override
  void onInit() {
    super.onInit();
    youtubePlayerController = YoutubePlayerController(
      // TODO:  Change hard coded inital video to constant
      initialVideoId:
          YoutubePlayer.convertUrlToId("https://youtu.be/cpP-fCo8Dn4")
              .toString(),
      flags: YoutubePlayerFlags(
        enableCaption: false,
        disableDragSeek: true,
        hideControls: true,
        loop: false,
        autoPlay: true,
      ),
    );
  }

  getAndPlayRandomCampaign() async {
    await fetchUserService.fetchRandomVideo();
    campaignVideoUrl.value = fetchUserService.videoURL.value;
    youtubeControllerLoadAndPlayVideo(campaignVideoUrl.value);
  }

  void youtubeControllerLoadAndPlayVideo(String ytVideoUrl) {
    // Load a new video
    youtubePlayerController
        .load(YoutubePlayer.convertUrlToId(ytVideoUrl).toString());
    // Play the loaded video.
    youtubePlayerController.play();
  }

  getTimerController() {
    return _timerController;
  }
}
