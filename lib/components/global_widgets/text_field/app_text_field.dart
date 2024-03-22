import 'package:flutter/material.dart';
import 'package:task/utils/constants/constants.dart';
import 'package:task/utils/styles/styles.dart';

class AppTextField {
  AppTextField._();

  static Widget hintTextOnly(
      {TextEditingController? searchTextController, FocusNode? focusNode, ValueChanged<String>? onChanged, required String hintText}) {
    return TextField(
      controller: searchTextController,
      focusNode: focusNode,
      onChanged: onChanged,
      style: TextStyle(color: AppColors.baseFontColor, fontSize: Dimensions.fontSize14),
      decoration: InputDecoration(
        hintText: 'Search',
        hintStyle: TextStyle(color: AppColors.hintTextColor, fontSize: Dimensions.fontSize14),
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        focusedErrorBorder: InputBorder.none,
      ),);
  }
}