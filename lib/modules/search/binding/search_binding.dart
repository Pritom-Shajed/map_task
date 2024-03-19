import 'package:get/get.dart';
import 'package:task/modules/search/controller/search_controller.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchPageController(), fenix: true);
  }

}