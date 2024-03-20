import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';
import 'package:task/models/models.dart';
import 'package:task/modules/search/search.dart';
import 'package:task/utils/constants/api/api_response_handler.dart';

class SearchPageController extends GetxController {
  final SearchRepository _searchRepo;


  late TextEditingController searchTextController;
  late FocusNode searchFocusNode;
  late Debouncer debounce;

  SearchPageController({required SearchRepository searchRepo}) : _searchRepo = searchRepo;

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

   final RxList<AutocompleteData> searchPlaces = <AutocompleteData>[].obs;

  ///API CALLS
  Future<ResponseModel> autocomplete() async {
    try {
      searchPlaces.clear();
      final response = await _searchRepo.autocompleteApi(query: searchTextController.text.trim());

      log('response: ${response.statusCode}');
      log('response: ${response.body}');

      final apiResponseHandler = ApiResponseHandler(response, successCallback: (response){
        final List places = response.body['places'];
        searchPlaces.assignAll(places.map((place) => AutocompleteData.fromJson(place)).toList());
      });

      return apiResponseHandler.handleResponse();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

}