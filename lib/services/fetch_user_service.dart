import 'dart:convert';
import 'dart:math';

import 'package:get/get.dart';

class FetchUserService extends GetConnect {
  var campaignVideoURL = "";

  fetchRandomVideo() async {
    // Fetch Response Object From API.
    Response<dynamic> response = await fetchApiResponse();
    // Cast the response object into list.
    final listOfData = json.decode(json.encode(response.body)) as List<dynamic>;
    // Get the first element of the list.
    var data = listOfData[0];
    // Get the random campaign element from the list.
    var randomCampaignElement = data[new Random().nextInt(data.length)];
    // Get the video url of the random campaign and set to current global videoURL
    campaignVideoURL = randomCampaignElement["video_url"];
    // Return video url from the function.
    print('FetchUserService.fetchRandomVideo ****** Api called  : : : ' +
        campaignVideoURL);
    return campaignVideoURL;
  }

  Future<Response<dynamic>> fetchApiResponse() async {
    // Future function to get the data.
    final response = await get('https://vipa3p.deta.dev/api/random');
    return response;
  }
}
