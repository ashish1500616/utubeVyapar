/*
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:utubevyappar/controller/watch_video_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DelegateToWebView extends StatefulWidget {
  @override
  _DelegateToWebViewState createState() => _DelegateToWebViewState();
}

class _DelegateToWebViewState extends State<DelegateToWebView> {
  @override
  Widget build(BuildContext context) {
    WatchVideoController watchVideoController = Get.find();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.toNamed("/watchVideo"),
        ),
        backgroundColor: Colors.deepOrange.shade200,
      ),
      body: SafeArea(
        child: WebView(
          initialUrl: watchVideoController.getYoutubeChannelLink(),
          javascriptMode: JavascriptMode.unrestricted,
          gestureNavigationEnabled: true,
        ),
      ),
    );
  }
}
*/
