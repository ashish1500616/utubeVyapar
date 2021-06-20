import 'dart:convert';
import 'dart:math';

import 'package:get/get.dart';

class FetchUserService extends GetConnect {
  var campaignVideoURL = "";
  var randomCampaignElement;
  fetchRandomVideo() async {
    // Fetch Response Object From API.
    Response<dynamic> response = await fetchResponseFromRandomApi();
    // Cast the response object into list.
    var data = getListOfDataFromResponseBody(response);
    // Get the random campaign element from the list.
    randomCampaignElement = data[new Random().nextInt(data.length)];
    // Get the video url of the random campaign and set to current global videoURL
    campaignVideoURL = randomCampaignElement["video_url"];
    // Return video url from the function.
    print('FetchUserService.fetchRandomVideo ****** Api called  : : : ' +
        campaignVideoURL);
    return campaignVideoURL;
  }

  getListOfDataFromResponseBody(Response<dynamic> response) {
    final listOfData = json.decode(json.encode(response.body)) as List<dynamic>;
    // FIXME Get the first element of the list add a  check if the list id null return empty .
    var data = listOfData[0];
    return data;
  }

  Future<String> fetchCurrentUserPoints() async {
    var data = await getCurrentUserInformation();
    var points = data["points"];
    return points.toString();
  }

  Future<dynamic> getCurrentUserInformation() async {
    Response<dynamic> response = await fetchResponseFromUsersApi();
    var data = getListOfDataFromResponseBody(response);
    return data[0];
  }

  Future<Response<dynamic>> fetchResponseFromRandomApi() async {
    // Future function to get the data.
    final response = await get('https://vipa3p.deta.dev/api/random');
    return response;
  }

  fetchResponseFromUsersApi() async {
    // Future function to get the data.
    // var uid = FirebaseAuth.instance.currentUser!.uid.toString();
    var uid = "uuid";
    final response = await get('https://vipa3p.deta.dev/api/users/$uid');
    return response;
  }

  increasePoints(value) async {
    // var uid = FirebaseAuth.instance.currentUser!.uid.toString();
    var uid = "uuid";
    final response =
        await get('https://vipa3p.deta.dev/api/users/add/$uid/$value');
    print(response.body);
  }

  reducePoints(value) async {
    //uid of the person whose video is being played.
    // var uid = randomCampaignElement["uuid"];
    var uid = "abc";
    final response =
        await get('https://vipa3p.deta.dev/api/users/reduce/$uid/$value');
    print(response.body);
  }
}
