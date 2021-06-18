import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:utubevyappar/views/homepage.dart';
import 'package:utubevyappar/views/sign_in_form.dart';
import 'package:utubevyappar/views/welcome.dart';

main() async {
  /*await GetStorage.init();*/
  runApp(App());
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
        GetPage(name: '/sign_in_form', page: () => SignInForm()),
      ],
    );
  }
}
