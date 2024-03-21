import 'package:get/get.dart';
import 'package:task/modules/splash/splash.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SplashController>(SplashController());
  }

}