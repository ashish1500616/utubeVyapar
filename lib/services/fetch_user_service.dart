import 'dart:convert';

import 'package:get/get.dart';

class FetchUserService extends GetConnect {
  Future<String> fetchRandomVideo() async {
    final response = await get('https://vipa3p.deta.dev/api/random');
    print(response.body);
    return Future<String>.value("https://youtu.be/b-VzI-X3C8c");
  }
}
