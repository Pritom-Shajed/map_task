import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task/routes/app_pages.dart';
import 'package:task/utils/constants/constants.dart';

class SplashController extends GetxController {
  @override
  void onReady() async {
    super.onReady();

    await Future.delayed(const Duration(milliseconds: 2000));
    // var storage = Get.find<SharedPreferences>();
    Get.toNamed(Routes.HOME);
    // try {
    //   if (storage.getString(StorageConstants.TOKEN) != null) {
    //     Get.toNamed(Routes.HOME);
    //   } else {
    //     Get.toNamed(Routes.AUTH);
    //   }
    // } catch (e) {
    //   Get.toNamed(Routes.AUTH);
    // }
  }
}