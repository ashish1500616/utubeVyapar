import 'dart:convert';

import 'package:clipboard/clipboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:http/http.dart' as http;
import 'package:utubevyappar/controller/utilities.dart';

class UserInformationController extends GetxController {
  TextEditingController youtube_channel_link = TextEditingController();
  static bool isUserNew = false;
  var formKey = GlobalKey<FormBuilderState>();

  // promote youtube channel unit
  late BannerAd bannerAdFifth;
  static const BANNER_UNIT_5 = "ca-app-pub-5225835586845251/3049307078";

  @override
  void onInit() {
    super.onInit();
    createAndLoadFifthBannerAd();
  }

  pasteFromClipboard() {
    FlutterClipboard.paste().then((value) {
      // Do what ever you want with the value.
      youtube_channel_link.text = value;
    });
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

  createNewUserOnDeta() {
    var dataMap = new Map();
    dataMap["uuid"] = FirebaseAuth.instance.currentUser!.uid.toString();
    dataMap["name"] = FirebaseAuth.instance.currentUser!.displayName;
    dataMap["email"] = FirebaseAuth.instance.currentUser!.email;
    dataMap["points"] = 1000;
    dataMap["youtube_channel"] = "";
    dataMap["youtube_channel_category"] = -1;
    if (UserInformationController.isUserNew) postUserInformation(dataMap);
  }

  bool validate() {
    if (youtube_channel_link.text.isNotEmpty) {
      return true;
    } else {
      Get.snackbar("Error", "Youtube channel link cant be empty.",
          backgroundColor: Colors.red.shade100,
          snackPosition: SnackPosition.BOTTOM);
      return false;
    }
  }

  // Used to post youtube channel information.
  addYoutubeChannelToUser() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      final channelCategory =
          formKey.currentState!.fields["channel_category_choice_chip"];
      var channelCategoryValue = channelCategory!.value;
      if (validate() &&
          Utilities.validateYoutubeLink(youtube_channel_link.text)) {
        var dataMap = new Map();
        dataMap["uuid"] = FirebaseAuth.instance.currentUser!.uid.toString();
        dataMap["youtube_channel"] = youtube_channel_link.text;
        dataMap["youtube_channel_category"] = channelCategoryValue;
        var url = Uri.parse('https://vipa3p.deta.dev/api/users/add/channel');
        var response = await http.post(url, body: json.encode(dataMap));
        print(response);
        if (response.statusCode == 200) {
          Get.back();
          Get.snackbar("Success",
              "Youtube channel link for your profile has been updated. Thank's for using UtubeVyapar",
              backgroundColor: Colors.red.shade100,
              snackPosition: SnackPosition.BOTTOM);
        } else {
          print('Response status: ${response.statusCode}');
          print('Response body: ${response.body}');
          Get.snackbar("Error", "Unable to submit channel link. Please report",
              backgroundColor: Colors.red.shade100,
              snackPosition: SnackPosition.BOTTOM);
        }
      }
    }
  }

  // Not being used anywhere
  postYoutubeChannelInformation(data) async {
    var url = Uri.parse('https://vipa3p.deta.dev/api/users/channel/');
    var response = await http.post(url, body: json.encode(data));
    if (response.statusCode == 201) {
      Get.toNamed("/home");
    } else {
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      Get.snackbar("Error", "Unable to create user. Please report",
          backgroundColor: Colors.red.shade100,
          snackPosition: SnackPosition.TOP);
    }
  }

  postUserInformation(data) async {
    var url = Uri.parse('https://vipa3p.deta.dev/api/users');
    var response = await http.post(url, body: json.encode(data));
    if (response.statusCode == 201) {
      Get.toNamed("/home");
    } else {
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      Get.snackbar("Error", "Unable to create user. Please report",
          backgroundColor: Colors.red.shade100,
          snackPosition: SnackPosition.TOP);
    }
  }

  static setIsNewTrue() {
    isUserNew = true;
  }

  void abortEditing() {
    Get.back();
  }
}
