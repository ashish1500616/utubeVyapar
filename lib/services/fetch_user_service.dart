import 'dart:convert';
import 'dart:math';

import 'package:get/get.dart';

class FetchUserService extends GetConnect {
  Future<String> fetchRandomVideo() async {
    final response = await get('https://vipa3p.deta.dev/api/random');
    final aofdata = json.decode(json.encode(response.body)) as List<dynamic>;
    var data = aofdata[0];
    final _random = new Random();
    var element = data[_random.nextInt(data.length)];
    return element["video_url"];
  }
}
