import 'package:flutter_share/flutter_share.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:new_version/new_version.dart';
import 'package:utubevyappar/controller/user_information_controller.dart';

class HomePageController extends GetxController {
  UserInformationController userInformationController =
      Get.put(UserInformationController());
  var isNewUser = false.obs;
  late BannerAd bannerAdFirst;
  late BannerAd bannerAdSecond;

  // home page unit 1
  static const BANNER_UNIT_1 = "ca-app-pub-5225835586845251/9410986702";

  // home page unit 2
  static const BANNER_UNIT_2 = "ca-app-pub-5225835586845251/9259777616";

  @override
  void onInit() {
    super.onInit();
    userInformationController.createNewUserOnDeta();
    _checkVersion();
  }

  void createAndLoadFirstBannerAd() {
    bannerAdFirst = BannerAd(
        adUnitId: BANNER_UNIT_1,
        request: AdRequest(),
        size: AdSize.largeBanner,
        listener: BannerAdListener(
          // Called when an ad is successfully received.
          onAdLoaded: (Ad ad) => () {
            print('Ad loaded.');
          },
          onAdFailedToLoad: (Ad ad, LoadAdError error) {
            // Dispose the ad here to free resources.
            // ad.dispose();
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
        adUnitId: BANNER_UNIT_2,
        request: AdRequest(),
        size: AdSize.largeBanner,
        listener: BannerAdListener(
          onAdLoaded: (Ad ad) => () {
            print('Ad loaded.');
          },
          onAdFailedToLoad: (Ad ad, LoadAdError error) {
            // ad.dispose();
            print('Ad failed to load: $error');
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
