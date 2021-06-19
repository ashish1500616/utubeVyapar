import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:get/get.dart';

class YoutubeVideoController extends GetxController {
  String _videoURL = "https://youtu.be/b-VzI-X3C8c";
  CountDownController _controller = CountDownController();

  String getVideoURL() {
    // ignore: unnecessary_null_comparison
    if (_videoURL == null) {
      return "";
    } else {
      return _videoURL;
    }
  }

  set videoURL(String value) {
    _videoURL = value;
  }

  getController() {
    return _controller;
  }
}
