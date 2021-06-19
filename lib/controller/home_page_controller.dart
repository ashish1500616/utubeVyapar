import 'package:get/get.dart';
import 'package:utubevyappar/services/fetch_user_service.dart';

class HomePageController extends GetxController {
  FetchUserService fetchUserService = Get.put(FetchUserService());

  @override
  void onInit() {
    super.onInit();
    fetchUserService.fetchRandomVideo();
  }
}
