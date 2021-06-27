import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Utilities {
  static validateYoutubeLink(url) {
    var youtubeVideoLink = Uri.parse(url);
    if (youtubeVideoLink.scheme != "http" ||
        youtubeVideoLink.scheme != "https") {
      youtubeVideoLink = Uri.parse("https://" + url);
    }
    if ((youtubeVideoLink.host != "www.youtube.com") &&
        (youtubeVideoLink.host != "www.youtu.be")) {
      Get.snackbar("Youtube link is invalid",
          "At the moment we only support links from https://www.youtube.com or https://www.youtu.be",
          backgroundColor: Colors.red.shade100,
          snackPosition: SnackPosition.BOTTOM);
      return false;
    }
    return true;
  }
}
