import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:utubevyappar/controller/home_page_controller.dart';

class CreateCampaignController extends GetxController {
  TextEditingController youtube_video_link_text_controller =
      TextEditingController();
  HomePageController homePageController = Get.find();
  var formKey = GlobalKey<FormBuilderState>();

  @override
  void onInit() {
    super.onInit();
  }

  submitVideoLink() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      final video_category = formKey.currentState!.fields["choice_chip"];
      var dataMap = new Map();
      dataMap["uuid"] = FirebaseAuth.instance.currentUser!.uid.toString();
      if (validate()) {
        if (validateYoutubeLink(youtube_video_link_text_controller.text)) {
          dataMap["video_url"] = youtube_video_link_text_controller.text;
          dataMap["video_category_id"] = video_category!.value;
          postYoutubeVideoLink(dataMap);
          Get.back();
        }
      }
    }
  }

  validateYoutubeLink(url) {
    var youtubeVideoLink = Uri.parse(url);
    if (youtubeVideoLink.scheme != "http" ||
        youtubeVideoLink.scheme != "https") {
      youtubeVideoLink =
          Uri.parse("https://" + youtube_video_link_text_controller.text);
    }
    if ((youtubeVideoLink.host != "www.youtube.com") &&
        (youtubeVideoLink.host != "youtu.be")) {
      Get.snackbar("Youtube link is invalid",
          "At the moment we only support links from https://www.youtube.com or https://www.youtu.be",
          backgroundColor: Colors.red.shade100,
          snackPosition: SnackPosition.BOTTOM);
      return false;
    }
    return true;
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
          snackPosition: SnackPosition.TOP);
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
}
