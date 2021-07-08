import 'package:flutter_share/flutter_share.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:new_version/new_version.dart';
import 'package:utubevyappar/controller/ads_controller.dart';
import 'package:utubevyappar/controller/user_information_controller.dart';

class HomePageController extends GetxController {
  UserInformationController userInformationController =
      Get.put(UserInformationController());
  var isNewUser = false.obs;
  late BannerAd bannerAdFirst;
  var isBannerAdFirstReady = false.obs;
  // Is not used any where to check if it works in the real time or not.
  var isBannerAdSecondReady = false.obs;
  late BannerAd bannerAdSecond;

  @override
  void onInit() {
    super.onInit();
    userInformationController.createNewUserOnDeta();
    _checkVersion();
  }

  void createAndLoadFirstBannerAd() {
    bannerAdFirst = BannerAd(
        adUnitId: AdsController.BANNER_UNIT_1,
        request: AdRequest(),
        size: AdSize.largeBanner,
        listener: BannerAdListener(
          // Called when an ad is successfully received.
          onAdLoaded: (Ad ad) => () {
            print('Ad loaded.');
            isBannerAdFirstReady.value = true;
          },
          onAdFailedToLoad: (Ad ad, LoadAdError error) {
            // Dispose the ad here to free resources.
            // ad.dispose();
            isBannerAdFirstReady.value = false;
            print('Ad failed to load: $error');
          },
          onAdOpened: (Ad ad) => print('Ad opened.'),
          onAdClosed: (Ad ad) => print('Ad closed.'),
          onAdImpression: (Ad ad) => print('Ad impression.'),
        ));
    bannerAdFirst.load();
  }

  void createAndLoadSecondBannerAd() {
    bannerAdSecond = BannerAd(
        adUnitId: AdsController.BANNER_UNIT_2,
        request: AdRequest(),
        size: AdSize.largeBanner,
        listener: BannerAdListener(
          onAdLoaded: (Ad ad) => () {
            print('Ad loaded.');
            isBannerAdSecondReady.value = true;
          },
          onAdFailedToLoad: (Ad ad, LoadAdError error) {
            // ad.dispose();
            print('Ad failed to load: $error');
            isBannerAdSecondReady.value = false;
          },
          onAdOpened: (Ad ad) => print('Ad opened.'),
          onAdClosed: (Ad ad) => print('Ad closed.'),
          onAdImpression: (Ad ad) => print('Ad impression.'),
        ));

    bannerAdSecond.load();
  }

  void _checkVersion() {
    final newVersion = NewVersion(androidId: "com.wowcodes.ytvyapar");
    newVersion.showAlertIfNecessary(context: Get.context!);
  }

  Future<void> share() async {
    await FlutterShare.share(
        title: 'Grow On Youtube,From Flop To Top',
        text:
            'Grow on Youtube with YtVyapar.\nYtVyapar platform is dedicated to helping youtubers to get more viewers, with premium and unique features that you can get for free.\n \nStart joining our big network and start getting views in just minutes.',
        linkUrl: 'https://wowcodes.tech/',
        chooserTitle: 'Vyapar on Youtube with YtVyapar');
  }
}
