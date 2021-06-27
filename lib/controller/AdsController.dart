import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdsController extends GetxController {
  InterstitialAd? myInterstitial;
  late BannerAd bannerAdFirst;
  late BannerAd bannerAdSecond;
  late BannerAd bannerAdThird;
  static const BANNER_UNIT_1 = "ca-app-pub-5225835586845251/9410986702";
  static const BANNER_UNIT_2 = "ca-app-pub-5225835586845251/9259777616";
  static const BANNER_UNIT_3 = "ca-app-pub-5225835586845251/2552814756";
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
  }

  void createAndLoadSecondBannerAd() {
    bannerAdSecond = BannerAd(
        adUnitId: BANNER_UNIT_2,
        request: AdRequest(),
        size: AdSize.largeBanner,
        listener: BannerAdListener(
          // Called when an ad is successfully received.
          onAdLoaded: (Ad ad) => () {
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

  createAndLoadThirdBannerAd() {
    bannerAdThird = BannerAd(
        adUnitId: BANNER_UNIT_3,
        request: AdRequest(),
        size: AdSize.largeBanner,
        listener: BannerAdListener(
          // Called when an ad is successfully received.
          onAdLoaded: (Ad ad) => () {
            print("Banner Third Is Ready");
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
    bannerAdThird.load();
  }

  @override
  void dispose() {
    bannerAdThird.dispose();
  }

  createInterstitialAd() {
    InterstitialAd.load(
      adUnitId: 'ca-app-pub-3940256099942544/1033173712',
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        // if ad fails to load
        onAdFailedToLoad: (LoadAdError error) {
          print('Ad exited with error: $error');
        },
        // else
        onAdLoaded: (InterstitialAd ad) {
          this.myInterstitial = ad; // set the ad equal to the current ad
        },
      ),
    );
  }

  showInterstitialAd() {
    // create callbacks for ad
    myInterstitial!.fullScreenContentCallback = FullScreenContentCallback(
      // when dismissed
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        /*Navigator.push(
          Get.context!,
          MaterialPageRoute(
            builder: (context) => WatchVideo(), // go to next page
          ),
        );*/
        ad.dispose(); // dispose of ad
      },

      // if ad fails to show content
      onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
        /*Navigator.push(
          Get.context!,
          MaterialPageRoute(
            builder: (context) => WatchVideo(), // go to next page
          ),
        );*/
        print('$ad onAdFailedToShowFullScreenContent: $error'); // print error
        ad.dispose(); // dispose ad
      },
    );

    myInterstitial!.show();
  }
}
