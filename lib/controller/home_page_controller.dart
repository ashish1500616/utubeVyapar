import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:new_version/new_version.dart';
import 'package:utubevyappar/controller/user_information_controller.dart';

class HomePageController extends GetxController {
  late BannerAd bannerAdFirst;
  late BannerAd bannerAdSecond;

  UserInformationController userInformationController =
      Get.put(UserInformationController());
  var isBannerAdReady = false.obs;
  var isNewUser = false.obs;
  var isInterstitialAdReady = false.obs;

  @override
  void onInit() {
    super.onInit();
    userInformationController.createNewUserOnDeta();
    _checkVersion();
    bannerAdFirst = BannerAd(
        adUnitId: "ca-app-pub-3940256099942544/6300978111",
        request: AdRequest(),
        size: AdSize.banner,
        listener: BannerAdListener(
          // Called when an ad is successfully received.
          onAdLoaded: (Ad ad) => () {
            this.isBannerAdReady.value = true;
            print('Ad loaded.');
          },
          // Called when an ad request failed.
          onAdFailedToLoad: (Ad ad, LoadAdError error) {
            // Dispose the ad here to free resources.
            ad.dispose();
            print('Ad failed to load: $error');
          },
          // Called when an ad opens an overlay that covers the screen.
          onAdOpened: (Ad ad) => print('Ad opened.'),
          // Called when an ad removes an overlay that covers the screen.
          onAdClosed: (Ad ad) => print('Ad closed.'),
          // Called when an impression occurs on the ad.
          onAdImpression: (Ad ad) => print('Ad impression.'),
        ));

    bannerAdFirst.load();
    bannerAdSecond = BannerAd(
        adUnitId: "ca-app-pub-3940256099942544/6300978111",
        request: AdRequest(),
        size: AdSize.banner,
        listener: BannerAdListener(
          // Called when an ad is successfully received.
          onAdLoaded: (Ad ad) => () {
            this.isBannerAdReady.value = true;
            print('Ad loaded.');
          },
          // Called when an ad request failed.
          onAdFailedToLoad: (Ad ad, LoadAdError error) {
            // Dispose the ad here to free resources.
            ad.dispose();
            print('Ad failed to load: $error');
          },
          // Called when an ad opens an overlay that covers the screen.
          onAdOpened: (Ad ad) => print('Ad opened.'),
          // Called when an ad removes an overlay that covers the screen.
          onAdClosed: (Ad ad) => Get.toNamed("/watchVideo"),
          // Called when an impression occurs on the ad.
          onAdImpression: (Ad ad) => print('Ad impression.'),
        ));

    bannerAdSecond.load();
  }

  void _checkVersion() {
    final newVersion = NewVersion(androidId: "com.example.utubevyappar");
    newVersion.showAlertIfNecessary(context: Get.context!);
  }
}
