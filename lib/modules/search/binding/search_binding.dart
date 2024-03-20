import 'package:get/get.dart';
import 'package:task/modules/search/controller/search_controller.dart';
import 'package:task/modules/search/repository/search_repository.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchRepository(apiClient: Get.find()), fenix: true);
    Get.lazyPut(() => SearchPageController(searchRepo: Get.find()), fenix: true);
  }

}