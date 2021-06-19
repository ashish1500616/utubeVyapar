import 'dart:convert';
import 'dart:math';

import 'package:get/get.dart';

class FetchUserService extends GetConnect {
  Future<String> fetchRandomVideo() async {
    final response = await get('https://vipa3p.deta.dev/api/random');
    final aofdata = json.decode(json.encode(response.body)) as List<dynamic>;
    var data = aofdata[0];
    /* Verify  If User Has Points Or Not.*/
    var points = 0;
    var randomCampaign;
    /* Check if the user has points*/
    while (points < 30) {
      print("Finding User With Credits Greater Than 30");
      randomCampaign = getRandomElement(data);
      var uuid = randomCampaign["uuid"];
      final userinfo = await get('https://vipa3p.deta.dev/api/users/$uuid');
      final userList = json.decode(json.encode(userinfo.body)) as List<dynamic>;
      points = int.parse(userList[0][0]["points"].toString());
    }
    print("Found Campaign with points " + points.toString());
    return randomCampaign["video_url"];
  }

  getRandomElement(data) {
    final _random = new Random();
    var element = data[_random.nextInt(data.length)];
    return element;
  }

  /* Add a function to reduce the credit value from the user accound*/
}
