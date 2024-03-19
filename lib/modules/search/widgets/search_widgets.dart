import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/components/global_widgets/global_widgets.dart';
import 'package:task/utils/constants/constants.dart';

class SearchWidgets {
  SearchWidgets._();

  static PreferredSizeWidget appBar ({TextEditingController? searchTextController, FocusNode? focusNode, ValueChanged<String>? onSearch, VoidCallback? onTapBack, VoidCallback? onTapClose}){
    return AppBar(
      title: AppTextField.hintTextOnly(hintText: 'Search', searchTextController: searchTextController, focusNode: focusNode, onChanged: onSearch),
      leading: IconButton(color: AppColors.baseColor, onPressed: onTapBack ?? () => Get.back(), icon: const Icon(Icons.arrow_back),),
      actions: [
        IconButton(color: AppColors.baseColor, onPressed: onTapClose ?? () => Get.back(), icon: const Icon(Icons.close),),
      ],
    );
  }
}