import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:get/get.dart';
import 'package:utubevyappar/services/fetch_user_service.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class WatchVideoController extends GetxController {
  CountDownController _timerController = CountDownController();
  FetchUserService fetchUserService = Get.put(FetchUserService());
  late YoutubePlayerController youtubePlayerController;
  var currentPoint = "0".obs;
  var isSettlingPoints = false.obs;

  @override
  void onInit() {
    super.onInit();
    youtubePlayerController = YoutubePlayerController(
      // TODO:  Change hard coded initial video to constant
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
    getUserCurrentPoints();
  }

  getAndPlayRandomCampaign() async {
    // Get a new random url .
    // Change it to get data from database rather than the api.
    await fetchUserService.fetchRandomVideo();
    youtubeControllerLoadAndPlayVideo(fetchUserService.campaignVideoURL);
  }

  void youtubeControllerLoadAndPlayVideo(String ytVideoUrl) {
    // Load a new video
    youtubePlayerController
        .load(YoutubePlayer.convertUrlToId(ytVideoUrl).toString());
    // Play the loaded video.
    youtubePlayerController.play();
  }

  getUserCurrentPoints() {
    fetchUserService
        .fetchCurrentUserPoints()
        .then((value) => currentPoint.value = value.toString());
  }

  getTimerController() {
    return _timerController;
  }

  void settlePoints(value) {
    isSettlingPoints.value = true;
    fetchUserService.increasePoints(value);
    fetchUserService.reducePoints(value);
    getUserCurrentPoints();
    isSettlingPoints.value = false;
  }
}
