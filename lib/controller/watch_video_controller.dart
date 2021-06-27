import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:utubevyappar/services/fetch_user_service.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class WatchVideoController extends GetxController {
  CountDownController _timerController = CountDownController();
  FetchUserService fetchUserService = Get.put(FetchUserService());

  // watch page unit
  late BannerAd bannerAdThird;
  static const BANNER_UNIT_3 = "ca-app-pub-5225835586845251/2552814756";
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
          YoutubePlayer.convertUrlToId("https://youtu.be/b-wtOYN4P1Y")
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

  createAndLoadThirdBannerAd() {
    bannerAdThird = BannerAd(
        adUnitId: BANNER_UNIT_3,
        request: AdRequest(),
        size: AdSize.largeBanner,
        listener: BannerAdListener(
          onAdLoaded: (Ad ad) => () {
            print("Banner Third Is Ready");
            print('Ad loaded.');
          },
          onAdFailedToLoad: (Ad ad, LoadAdError error) {
            ad.dispose();
            print('Ad failed to load: $error');
          },
          onAdOpened: (Ad ad) => print('Ad opened.'),
          onAdClosed: (Ad ad) => print('Ad closed.'),
          onAdImpression: (Ad ad) => print('Ad impression.'),
        ));
    bannerAdThird.load();
  }
}
