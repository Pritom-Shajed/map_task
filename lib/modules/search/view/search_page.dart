import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task/components/global_widgets/global_widgets.dart';
import 'package:task/modules/search/search.dart';
import 'package:task/routes/routes.dart';
import 'package:task/storage/controller/storage_controller.dart';

class SearchPage extends StatefulWidget {
   const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _controller = Get.find<SearchPageController>();
  final _storageController = Get.find<StorageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchWidgets.appBar(
        searchTextController: _controller.searchTextController,
        focusNode: _controller.searchFocusNode,
        onSearch: (value){
          _controller.debounce.call(() {
            _controller.autocomplete();
          });
        }
      ),
      body: Padding(
        padding: EdgeInsets.all(10.w),
        child: Obx( () {
            return ListView.separated(
              separatorBuilder: (context, index) => 6.verticalSpace,
                itemCount: _controller.searchPlaces.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index){
                var placeInfo = _controller.searchPlaces[index];
              return AppButtons.placeBtn(address: placeInfo.address, onTap: (){
                Get.offNamed(Routes.HOME);
                AppBottomSheets.placeInfo(context,
                  placeInfo: placeInfo,
                  onTapSave: () {
                  Get.back();
                  _storageController.savePlace(place: placeInfo);
                  },
                );

              });
            });
          }
        ),
      ),
    );
  }
}
