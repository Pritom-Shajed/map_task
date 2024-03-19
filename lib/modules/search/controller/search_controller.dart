import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';

class SearchPageController extends GetxController {

  late TextEditingController searchTextController;
  late FocusNode searchFocusNode;
  late Debouncer debounce;

  @override
  void onInit() {
    searchTextController = TextEditingController();
    debounce = Debouncer(delay: const Duration(milliseconds: 500));
    searchFocusNode = FocusNode();
    Future.delayed(Duration.zero, () {
      FocusScope.of(Get.context!).requestFocus(searchFocusNode);
    });
    super.onInit();
  }

  @override
  void onClose() {
    searchTextController.dispose();
    debounce.cancel();
    searchFocusNode.dispose();
    super.onClose();
  }
}