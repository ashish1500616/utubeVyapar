import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:get/get.dart';
import 'package:utubevyappar/services/fetch_user_service.dart';

class WatchVideoController extends GetxController {
  CountDownController _controller = CountDownController();
  FetchUserService fetchUserService = Get.find();

  String getVideoURL() {
    fetchUserService.fetchRandomVideo();
    return fetchUserService.videoURL;
  }

  getController() {
    return _controller;
  }
}
