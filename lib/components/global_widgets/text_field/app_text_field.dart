import 'package:flutter/material.dart';
import 'package:task/utils/constants/constants.dart';

class AppTextField {
  AppTextField._();

  static Widget hintTextOnly(
      {TextEditingController? searchTextController, FocusNode? focusNode, ValueChanged<String>? onChanged, required String hintText}) {
    return TextField(
      controller: searchTextController,
      focusNode: focusNode,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: 'Search',
        hintStyle: TextStyle(color: AppColors.hintTextColor
        ),
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        focusedErrorBorder: InputBorder.none,
      ),);
  }
}