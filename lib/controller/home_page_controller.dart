import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:utubevyappar/controller/user_information_controller.dart';
import 'package:utubevyappar/services/ad_mob_helper.dart';
import 'package:utubevyappar/views/user_information.dart';

class HomePageController extends GetxController {
  late BannerAd bannerAd;
  UserInformationController userInformationController =
      Get.put(UserInformationController());
  var isBannerAdReady = false.obs;
  var isNewUser = false.obs;
  @override
  void onInit() {
    userInformationController.createNewUserOnDeta();
    bannerAd = BannerAd(
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

    bannerAd.load();
  }
}
