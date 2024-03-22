import 'package:get/get.dart';
import 'package:task/location/controller/location_controller.dart';
import 'package:task/routes/app_pages.dart';

class SplashController extends GetxController {

  @override
  void onReady() async {
    super.onReady();
    await Future.delayed(const Duration(seconds: 1));
    Get.find<LocationController>().getCurrentLocation().then((position) {
        Get.offAllNamed(Routes.HOME, arguments: position);
    });
  }
}