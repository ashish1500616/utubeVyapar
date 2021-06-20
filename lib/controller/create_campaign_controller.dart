import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CreateCampaignController extends GetxController {
  TextEditingController youtube_video_link_text_controller =
      TextEditingController();

  submitVideoLink() {
    var dataMap = new Map();
    dataMap["uuid"] = FirebaseAuth.instance.currentUser!.uid.toString();
    dataMap["video_url"] = youtube_video_link_text_controller.text;
    postYoutubeVideoLink(dataMap);
  }

  postYoutubeVideoLink(data) async {
    var url = Uri.parse('https://vipa3p.deta.dev/api/campaign');
    var response = await http.post(url, body: json.encode(data));
    if (response.statusCode == 201) {
      Get.snackbar(
          "Success", "Your youtube video link has been pushed to public pool.",
          backgroundColor: Colors.blueAccent,
          snackPosition: SnackPosition.TOP,
          colorText: Colors.black87);
      // Get.back();
    } else {
      Get.snackbar("Error", "Unable to push video to public pool",
          backgroundColor: Colors.red, snackPosition: SnackPosition.TOP);
    }
  }

  void abortEditing() {
    Get.back();
    youtube_video_link_text_controller.clear();
  }
}