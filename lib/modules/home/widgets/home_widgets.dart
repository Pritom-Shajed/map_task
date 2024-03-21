import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task/components/global_widgets/global_widgets.dart';
import 'package:task/modules/home/home.dart';
import 'package:task/utils/constants/constants.dart';
import 'package:task/utils/strings.dart';
import 'package:task/utils/styles/styles.dart';

class HomeWidgets {
  HomeWidgets._();


  static Widget searchBar ({VoidCallback? onTapSearch}){
    return Container(
      margin: EdgeInsets.symmetric(vertical: Dimensions.paddingVertical24, horizontal: Dimensions.paddingHorizontal16),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(Dimensions.radius30),
          boxShadow: [
            BoxShadow(color: AppColors.baseColor.withOpacity(0.4), offset: const Offset(2,2), blurRadius: 2, spreadRadius: 1)
          ]
      ),
      width: double.maxFinite,
      child: Row(
        children: [
          SvgIcon(iconPath: AppSvgIcons.search, size: 18.w,),
          12.horizontalSpace,
          Expanded(child: GestureDetector(
              onTap: onTapSearch,
              child: AppTexts.smallText(text: Strings.searchHere, color: AppColors.primaryColor, fontWeight: FontWeight.w500))),
          12.horizontalSpace,
          SvgIcon(iconPath: AppSvgIcons.mic, size: 18.w,)
        ],
      ),
    );
  }

  static Widget quickActionBtn ({required String title, required String iconPath}){
    return Container(
      margin: EdgeInsets.all(4.w),
      padding: EdgeInsets.symmetric(vertical: Dimensions.paddingVertical6, horizontal: Dimensions.paddingHorizontal16),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(Dimensions.radius30),
        boxShadow: [
          BoxShadow(color: AppColors.baseColor.withOpacity(0.2), spreadRadius: 0, blurRadius: 4),
        ],
      ),
      child: Row(
        children: [
          SvgIcon(iconPath: iconPath, color: AppColors.baseColor, size: 14.r,),
          6.horizontalSpace,
          AppTexts.verySmallText(text: title, fontWeight: FontWeight.w500),
        ],
      ),
    );
  }

  static Widget bottomNavBar ({required ValueChanged<int> onTap}){
    return StatefulBuilder(builder: (context, setState){
      return Container(
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(Dimensions.radius16), topLeft: Radius.circular(Dimensions.radius16)),
          boxShadow: [
            BoxShadow(color: AppColors.baseColor.withOpacity(0.2), offset: const Offset(5, 0), spreadRadius: 0, blurRadius: 10),
          ],
        ),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(NavBarItem.items.length, (index) =>   Obx(() {
                return _bottomNavBarIcon(
                  onTap: (){
                    onTap(index);
                  },
                  iconPath: NavBarItem.items[index].iconPath,
                  labelText: NavBarItem.items[index].title,
                  isSelected: Get.find<HomeController>().pageIndex == index,);
              }
            ))
        ),
      );
    });
  }




}

Widget _bottomNavBarIcon ({VoidCallback? onTap, required bool isSelected, required String iconPath, required String labelText}){
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingHorizontal16, vertical: Dimensions.paddingVertical8),
      decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryColor : AppColors.white,
          borderRadius: BorderRadius.circular(Dimensions.radius12)
      ),
      child: Column(
        children: [
          SvgIcon(iconPath: iconPath,  size: 20.r, color: isSelected ? AppColors.white: AppColors.primaryColor.withOpacity(0.5)),
          6.verticalSpace,
          AppTexts.verySmallText(
              text: labelText,
              color: isSelected ? AppColors.white: AppColors.primaryColor
          )
        ],
      ),
    ),
  );
}

