import 'package:get/get.dart';

class YoutubeVideoController extends GetxController {
  String _videoURL = "https://youtu.be/b-VzI-X3C8c";

  String getVideoURL() {
    // ignore: unnecessary_null_comparison
    if (_videoURL == null) {
      return "";
    }
    else {
      return _videoURL;
    }
  }

  set videoURL(String value) {
    _videoURL = value;
  }
}
