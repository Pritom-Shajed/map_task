import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/components/global_widgets/global_widgets.dart';
import 'package:task/utils/constants/constants.dart';

class SearchWidgets {
  SearchWidgets._();

  static PreferredSizeWidget appBar ({VoidCallback? onTapBack, VoidCallback? onTapClose}){
    return AppBar(
      title: AppTexts.mediumText(text: 'Search', fontWeight: FontWeight.normal),
      leading: IconButton(color: AppColors.baseColor, onPressed: onTapBack ?? () => Get.back(), icon: const Icon(Icons.arrow_back),),
      actions: [
        IconButton(color: AppColors.baseColor, onPressed: onTapClose ?? () => Get.back(), icon: const Icon(Icons.close),),
      ],
    );
  }
}