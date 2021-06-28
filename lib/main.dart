import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:utubevyappar/views/homepage.dart';
import 'package:utubevyappar/views/user_information.dart';
import 'package:utubevyappar/views/watch_a_video.dart';
import 'package:utubevyappar/views/welcome.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  await GetStorage.init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) => runApp(App()));
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'UTubeVyapar.com',
      debugShowCheckedModeBanner: false,
      home: Welcome(),
      // home: ReviewOrder(),
      getPages: [
        // GetPage(name: '/home', page: () => HomePage(), binding: HomeBinding()),
        GetPage(name: '/home', page: () => HomePage()),
        GetPage(name: '/welcome', page: () => Welcome()),
        GetPage(name: '/watchVideo', page: () => WatchVideo()),
        GetPage(name: '/userInformation', page: () => UserInformation()),
        // GetPage(name: '/delegateToWebView', page: () => DelegateToWebView()),
      ],
    );
  }
}
