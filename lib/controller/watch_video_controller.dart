import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:utubevyappar/controller/AdsController.dart';
import 'package:utubevyappar/services/fetch_user_service.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class WatchVideoController extends GetxController {
  CountDownController _timerController = CountDownController();
  FetchUserService fetchUserService = Get.put(FetchUserService());
  late YoutubePlayerController youtubePlayerController;
  var currentPoint = "0".obs;
  var currentDuration = 15.obs;
  var isSettlingPoints = false.obs;
  var youtubeChannel = "".obs;

  @override
  void onInit() {
    super.onInit();
    /*WebView.platform = SurfaceAndroidWebView();*/
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
    // currentDuration.value = youtubePlayerController.metadata.duration.inSeconds;
    getUserCurrentPoints();
  }

  getAndPlayRandomCampaign() async {
    // Get a new random url .
    // Change it to get data from database rather than the api.
    await fetchUserService.fetchRandomVideo();
    youtubeChannel.value = fetchUserService.youtubeChannelUrl.value;
    youtubeControllerLoadAndPlayVideo(fetchUserService.campaignVideoURL);
  }

  Future<void> youtubeControllerLoadAndPlayVideo(String ytVideoUrl) async {
    // Load a new video
    youtubePlayerController
        .load(YoutubePlayer.convertUrlToId(ytVideoUrl).toString());
    print(ytVideoUrl);
    // Play the loaded video.
    //Wait for the youtubePlayer to get the meta data.
    await Future.delayed(Duration(seconds: 2));
    currentDuration.value =
        (youtubePlayerController.metadata.duration.inSeconds / 2).floor();
    (currentDuration.value < 30)
        ? currentDuration.value = 30
        : print("Increase current duration to 30");
    print(currentDuration.value);
    restartWithNewDuration();
    youtubePlayerController.play();
    update();
  }

  void restartWithNewDuration() {
    _timerController.restart(duration: currentDuration.value);
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

  void delegateOpeningYoutubeChannelLink() {
    Get.toNamed("/delegateToWebView");
  }

  Future<void> launchInWebViewWithJavaScript() async {
    var url = getYoutubeChannelLink();
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: true,
        enableJavaScript: true,
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  getYoutubeChannelLink() {
    var url = Uri.decodeFull(
        "https://" + youtubeChannel.value + "?sub_confirmation=1");
    url = url.replaceAll("\"", "");
    return url;
  }

/*  Future<void> launchUniversalLink() async {
    print(youtubeChannel.value);
    var url = youtubeChannel.value;
    if (await canLaunch(url)) {
      final bool nativeAppLaunchSucceeded = await launch(
        url,
        forceSafariVC: false,
        universalLinksOnly: true,
      );
      if (!nativeAppLaunchSucceeded) {
        await launch(url, forceSafariVC: true);
      }
    }
  }

  Future<void> launchInApp() async {
    print(youtubeChannel.value);
    if (await canLaunch(youtubeChannel.value)) {
      await launch(
        youtubeChannel.value,
        forceSafariVC: true,
        forceWebView: false,
        headers: <String, String>{'header_key': 'header_value'},
      );
    } else {
      throw 'Could not launch youtube url';
    }
  }*/
}
