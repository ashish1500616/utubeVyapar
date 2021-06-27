import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdsController extends GetxController {
  InterstitialAd? myInterstitial;
  late BannerAd bannerAdFirst;
  late BannerAd bannerAdSecond;
  late BannerAd bannerAdThird;
  late BannerAd bannerAdFourth;
  late BannerAd bannerAdFifth;
  static const BANNER_UNIT_1 = "ca-app-pub-5225835586845251/9410986702";
  static const BANNER_UNIT_2 = "ca-app-pub-5225835586845251/9259777616";
  static const BANNER_UNIT_3 = "ca-app-pub-5225835586845251/2552814756";
  static const BANNER_UNIT_4 = "ca-app-pub-5225835586845251/8199360278";
  static const BANNER_UNIT_5 = "ca-app-pub-5225835586845251/3049307078";
  static const INTERSTITIAL_UNIT_1 = "ca-app-pub-5225835586845251/8926651414";

  @override
  void onInit() {
    super.onInit();
    createAndLoadFirstBannerAd();
    createAndLoadSecondBannerAd();
    createAndLoadThirdBannerAd();
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
            ad.dispose();
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
            ad.dispose();
            print('Ad failed to load: $error');
          },
          onAdOpened: (Ad ad) => print('Ad opened.'),
          onAdClosed: (Ad ad) => Get.toNamed("/watchVideo"),
          onAdImpression: (Ad ad) => print('Ad impression.'),
        ));

    bannerAdSecond.load();
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
          onAdClosed: (Ad ad) => Get.toNamed("/watchVideo"),
          onAdImpression: (Ad ad) => print('Ad impression.'),
        ));
    bannerAdThird.load();
  }

  createAndLoadFourthBannerAd() {
    bannerAdFourth = BannerAd(
        adUnitId: BANNER_UNIT_4,
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
          onAdClosed: (Ad ad) => Get.toNamed("/watchVideo"),
          onAdImpression: (Ad ad) => print('Ad impression.'),
        ));
    bannerAdFourth.load();
  }

  createAndLoadFifthBannerAd() {
    bannerAdFifth = BannerAd(
        adUnitId: BANNER_UNIT_5,
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
          onAdClosed: (Ad ad) => Get.toNamed("/watchVideo"),
          onAdImpression: (Ad ad) => print('Ad impression.'),
        ));
    bannerAdFifth.load();
  }

  @override
  void dispose() {
    bannerAdThird.dispose();
  }

  createInterstitialAd() {
    InterstitialAd.load(
      adUnitId: INTERSTITIAL_UNIT_1,
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdFailedToLoad: (LoadAdError error) {
          print('Ad exited with error: $error');
        },
        onAdLoaded: (InterstitialAd ad) {
          this.myInterstitial = ad; // set the ad equal to the current ad
        },
      ),
    );
  }

  showInterstitialAd() {
    myInterstitial!.fullScreenContentCallback = FullScreenContentCallback(
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        ad.dispose(); // dispose of ad
      },
      onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
        print('$ad onAdFailedToShowFullScreenContent: $error'); // print error
        ad.dispose(); // dispose ad
      },
    );

    myInterstitial!.show();
  }
}
