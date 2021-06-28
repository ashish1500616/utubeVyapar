import 'dart:convert';

import 'package:clipboard/clipboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:http/http.dart' as http;
import 'package:utubevyappar/controller/utilities.dart';

class CreateCampaignController extends GetxController {
  TextEditingController youtube_video_link_text_controller =
      TextEditingController();

  // promote video unit
  static const BANNER_UNIT_4 = "ca-app-pub-5225835586845251/8199360278";
  late BannerAd bannerAdFourth;
  var formKey = GlobalKey<FormBuilderState>();

  @override
  void onInit() {
    super.onInit();
    createAndLoadFourthBannerAd();
  }

  pasteFromClipboard() {
    FlutterClipboard.paste().then((value) {
      // Do what ever you want with the value.
      youtube_video_link_text_controller.text = value;
    });
  }

  submitVideoLink() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      final video_category = formKey.currentState!.fields["choice_chip"];
      var dataMap = new Map();
      dataMap["uuid"] = FirebaseAuth.instance.currentUser!.uid.toString();
      if (validate()) {
        if (Utilities.validateYoutubeLink(
            youtube_video_link_text_controller.text)) {
          dataMap["video_url"] = youtube_video_link_text_controller.text;
          dataMap["video_category_id"] = video_category!.value;
          postYoutubeVideoLink(dataMap);
          Get.back();
        }
      }
    }
  }

  postYoutubeVideoLink(data) async {
    var url = Uri.parse('https://vipa3p.deta.dev/api/campaign');
    var response = await http.post(url, body: json.encode(data));
    if (response.statusCode == 201) {
      Get.snackbar(
          "Success", "Your youtube video link has been pushed to public pool.",
          backgroundColor: Colors.deepOrange.shade200,
          snackPosition: SnackPosition.TOP,
          colorText: Colors.black87);
      // Get.back();
    } else {
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      Get.snackbar("response.statusCode", "Unable to push video to public pool",
          backgroundColor: Colors.red.shade100,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void abortEditing() {
    Get.back();
    youtube_video_link_text_controller.clear();
  }

  bool validate() {
    if (youtube_video_link_text_controller.text.isNotEmpty) {
      return true;
    } else {
      Get.snackbar("Error", "Youtube video link cant be empty.",
          backgroundColor: Colors.red.shade100,
          snackPosition: SnackPosition.BOTTOM);
      return false;
    }
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
          /*onAdFailedToLoad: (Ad ad, LoadAdError error) {
            ad.dispose();
            print('Ad failed to load: $error');
          },*/
          onAdOpened: (Ad ad) => print('Ad opened.'),
          onAdClosed: (Ad ad) => print('Ad closed.'),
          onAdImpression: (Ad ad) => print('Ad impression.'),
        ));
    bannerAdFourth.load();
  }
}
