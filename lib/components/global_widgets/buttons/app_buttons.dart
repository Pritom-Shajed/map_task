import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/components/global_widgets/global_widgets.dart';
import 'package:task/utils/constants/constants.dart';

class AppButtons {
  AppButtons._();

  static Widget roundedIconBtn ({required String iconPath, VoidCallback? onTap}){
    return GestureDetector(
        onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.white,
          boxShadow: [
            BoxShadow(color: AppColors.primaryColor.withOpacity(0.5), spreadRadius: 0, blurRadius: 10),
          ],
        ),
        child: SvgIcon(iconPath: iconPath),
      ),
    );
  }
}