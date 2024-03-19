import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/modules/search/search.dart';

class SearchPage extends StatefulWidget {
   const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _controller = Get.find<SearchPageController>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchWidgets.appBar(
        searchTextController: _controller.searchTextController,
        focusNode: _controller.searchFocusNode,
        onSearch: (value){
          _controller.debounce.call(() {
          });
        }
      ),
    );
  }
}
