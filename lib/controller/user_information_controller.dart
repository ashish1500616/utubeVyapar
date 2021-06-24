import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:utubevyappar/controller/home_page_controller.dart';

class UserInformationController extends GetxController {
  TextEditingController youtube_channel_link = TextEditingController();
  static bool isUserNew = false;

  createNewUserOnDeta() {
    var dataMap = new Map();
    dataMap["uuid"] = FirebaseAuth.instance.currentUser!.uid.toString();
    dataMap["name"] = FirebaseAuth.instance.currentUser!.displayName;
    dataMap["email"] = FirebaseAuth.instance.currentUser!.email;
    dataMap["points"] = 1000;
    dataMap["youtube_channel"] = "";
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

  addYoutubeChannelToUser() async {
    if (validate()) {
      var uid = FirebaseAuth.instance.currentUser!.uid.toString();
      var youtube_channel = youtube_channel_link.text;
      var url = Uri.parse(
          'https://vipa3p.deta.dev/api/users/channel/$uid/$youtube_channel');
      var response = await http.get(url);
      print(response);
      if (response.statusCode == 200) {
        Get.back();
      } else {
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
        Get.snackbar("response.statusCode",
            "Unable to submit channel link. Please report",
            backgroundColor: Colors.red.shade100,
            snackPosition: SnackPosition.TOP);
      }
    }
  }

  postYoutubeChannelInformation(data) async {
    var url = Uri.parse('https://vipa3p.deta.dev/api/users/channel/');
    var response = await http.post(url, body: json.encode(data));
    if (response.statusCode == 201) {
      Get.toNamed("/home");
    } else {
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      Get.snackbar(
          "response.statusCode", "Unable to create user. Please report",
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
      Get.snackbar(
          "response.statusCode", "Unable to create user. Please report",
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
