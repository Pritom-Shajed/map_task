import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/components/global_widgets/global_widgets.dart';
import 'package:task/utils/constants/constants.dart';
import 'package:task/utils/styles/styles.dart';

class AppButtons {
  AppButtons._();

  static Widget roundedIconBtn ({required String iconPath, VoidCallback? onTap, Color? iconColor}){
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
        child: SvgIcon(iconPath: iconPath, color: iconColor,),
      ),
    );
  }

  static Widget placeBtn ({VoidCallback? onTap, required String address}){
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: EdgeInsets.all(12.w),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(Dimensions.radius30),
              boxShadow: [
                BoxShadow(color: AppColors.baseColor.withOpacity(0.1), offset: const Offset(2,2), blurRadius: 2, spreadRadius: 1)
              ]
          ),
          child: Row(
            children: [
              SvgIcon(iconPath: AppSvgIcons.map, color: AppColors.primaryColor, size: 12.r,),
              4.horizontalSpace,
              Expanded(child: AppTexts.smallText(text: address),

              )],
          )),
    );
  }
}