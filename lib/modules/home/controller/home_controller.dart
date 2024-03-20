import 'package:get/get.dart';
import 'package:task/helper/environment/environment.dart';

class HomeController extends GetxController {

  final String mapUrl = Environment.mapUrl+Environment.apiKey;

  final _pageIndex = 0.obs;

  get pageIndex => _pageIndex.value;

  set pageIndex (value) => _pageIndex.value = value;

  void updatePageIndex(index){
    pageIndex = index;
    update();
  }
}