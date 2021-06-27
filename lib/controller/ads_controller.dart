import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdsController extends GetxController {
  // interstitial unit
  late InterstitialAd myInterstitial;
  static const INTERSTITIAL_UNIT_1 = "ca-app-pub-5225835586845251/8926651414";
  bool isInterstitialAdLoaded = false;

  @override
  void onInit() {
    createInterstitialAd();
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
          this.isInterstitialAdLoaded = true;
          this.myInterstitial = ad; // set the ad equal to the current ad
        },
      ),
    );
  }

  showInterstitialAd() {
    myInterstitial.fullScreenContentCallback = FullScreenContentCallback(
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        print("Interstitial Ad Dismissed.");
        this.isInterstitialAdLoaded = false;
        ad.dispose(); // dispose of ad
      },
      onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
        this.isInterstitialAdLoaded = false;
        print('$ad onAdFailedToShowFullScreenContent: $error'); // print error
        ad.dispose(); // dispose ad
      },
    );
    myInterstitial.show();
  }
}
