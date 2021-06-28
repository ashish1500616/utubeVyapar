import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class Utilities {
  static const PRIVACY_URL =
      "https://sites.google.com/view/utubevyapar-privacy-policy/home";

  static isValidYoutubeLink(url) {
    var youtubeVideoLink = Uri.parse(url);
    if (youtubeVideoLink.scheme != "http" ||
        youtubeVideoLink.scheme != "https") {
      youtubeVideoLink = Uri.parse("https://" + url);
    }
    if ((youtubeVideoLink.host != "www.youtube.com") &&
        (youtubeVideoLink.host != "www.youtu.be")) {
      return false;
    }
    return true;
  }

  static validateYoutubeLink(url) {
    if (!isValidYoutubeLink(url)) {
      Get.snackbar("Youtube link is invalid",
          "At the moment we only support links from https://www.youtube.com or https://www.youtu.be",
          backgroundColor: Colors.red.shade100,
          snackPosition: SnackPosition.BOTTOM);
      return false;
    }
    return true;
  }

  static Future<void> launchInWebViewWithJavaScript(url) async {
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
}
