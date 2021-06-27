import 'package:flutter_share/flutter_share.dart';
import 'package:get/get.dart';
import 'package:new_version/new_version.dart';
import 'package:utubevyappar/controller/user_information_controller.dart';

class HomePageController extends GetxController {
  UserInformationController userInformationController =
      Get.put(UserInformationController());
  var isBannerAdReady = false.obs;
  var isNewUser = false.obs;

  @override
  void onInit() {
    super.onInit();
    userInformationController.createNewUserOnDeta();
    _checkVersion();
  }

  void _checkVersion() {
    final newVersion = NewVersion(androidId: "com.wowcodes.utubeVyapar");
    newVersion.showAlertIfNecessary(context: Get.context!);
  }

  Future<void> share() async {
    await FlutterShare.share(
        title: 'Grow On Youtube, From Flop To Top',
        text:
            'Vyapar on Youtube with UtubeVyapar. Grow On Youtube, From Flop To Top',
        linkUrl: 'https://wowcodes.tech/',
        chooserTitle: 'Vyapar on Youtube with UtubeVyapar');
  }
}
