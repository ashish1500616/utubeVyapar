import 'dart:convert';
import 'dart:math';

import 'package:get/get.dart';

class FetchUserService extends GetConnect {
  String _videoURL = "";

  @override
  Future<void> onInit() async {
    super.onInit();
    _videoURL = await fetchRandomVideo();
  }

  Future<String> fetchRandomVideo() async {
    Response<dynamic> response = await fetchApiResponse();
    final listOfData = json.decode(json.encode(response.body)) as List<dynamic>;
    var data = listOfData[0];
    var randomCampaignElement = data[new Random().nextInt(data.length)];
    _videoURL = randomCampaignElement["video_url"];
    return _videoURL;
  }

  String get videoURL => _videoURL;

  Future<Response<dynamic>> fetchApiResponse() async {
    final response = await get('https://vipa3p.deta.dev/api/random');
    return response;
  }

  /* Add a function to reduce the credit value from the user accound*/
}
