import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:get/get.dart';
import 'package:utubevyappar/services/fetch_user_service.dart';

class WatchVideoController extends GetxController {
  String _videoURL = "";
  CountDownController _controller = CountDownController();
  FetchUserService fetchUserService = Get.put(FetchUserService());

  String getVideoURL() {
    fetchUserService.fetchRandomVideo().then((value) => _videoURL = value);
    print(_videoURL);
    if (_videoURL == null) {
      return "";
    } else {
      return _videoURL;
    }
  }

  getController() {
    return _controller;
  }
}
