import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:task/components/global_widgets/global_widgets.dart';
import 'package:task/modules/home/home.dart';
import 'package:task/utils/constants/constants.dart';
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
              child: AppTexts.smallText(text: 'Search here', color: AppColors.primaryColor, fontWeight: FontWeight.w500))),
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
    var navIndex = 0;
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
            children: List.generate(NavBarItem.items.length, (index) =>   _bottomNavBarIcon(
              onTap: (){
                setState(() {
                  navIndex = index;
                });
                onTap(index);
              },
              iconPath: NavBarItem.items[index].iconPath,
              labelText: NavBarItem.items[index].title,
              isSelected: navIndex == index,))
        ),
      );
    });
  }


  static void bottomSheet (BuildContext context, {VoidCallback? onTapSave, required String title, required String description, required String cord}){
    showModalBottomSheet(
        useRootNavigator: true,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(Dimensions.radius16),
          ),
        ),
        context: context,
        builder: (context){
          return Container(
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(Dimensions.radius16),
              ),
            ),
            child: ListView(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              children: [

                //HEADER
                Padding(
                  padding:  EdgeInsets.all(14.w),
                  child: Column(
                    children: [

                      //TITLE
                      Row(
                        children: [
                          Expanded(child: AppTexts.largeText(text: title)),

                          AppButtons.roundedIconBtn(iconPath: AppSvgIcons.save, onTap: onTapSave)
                        ],
                      ),

                      //DESCRIPTION
                      8.verticalSpace,
                      AppTexts.smallText(text: description),
                      8.verticalSpace,
                      Row(children: [
                        AppTexts.smallText(text: 'Sports Club', fontWeight: FontWeight.w500),
                        8.horizontalSpace,
                        AppTexts.smallText(text: '•', fontWeight: FontWeight.w500),
                        8.horizontalSpace,
                        Row(
                          children: [
                            SvgIcon(iconPath: AppSvgIcons.car, size: 11.r,),
                            8.horizontalSpace,
                            AppTexts.smallText(text: '9 min'),
                          ],
                        )
                      ],),

                      8.verticalSpace,
                      Row(
                        children: [
                          SvgIcon(iconPath: AppSvgIcons.cord, size: 15.r,),
                          8.horizontalSpace,
                          AppTexts.smallText(text: cord)
                        ],
                      ),
                    ],
                  ),
                ),


                Divider(color: AppColors.lightGray, height: 20.h, thickness: 5,),

                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: Dimensions.paddingHorizontal34, vertical: Dimensions.paddingVertical24),
                  child: Column(
                    children: [
                      _bottomSheetCodeContainer(title: 'Place Code', value: 'MNEB9766', colorCode: AppColors.placeCodeColor),
                      14.verticalSpace,
                      _bottomSheetCodeContainer(title: 'District', value: 'Dhaka', colorCode: AppColors.districtColor),
                      14.verticalSpace,
                      _bottomSheetCodeContainer(title: 'Post Code', value: '1216', colorCode: AppColors.postCodeColor),
                    ],
                  ),
                )
              ],
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

Widget _bottomSheetCodeContainer ({required String title, required String value, required Color colorCode}){
  return Row(
    children: [
      Expanded(
        flex: 2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: AppTexts.smallText(
                text: title,
              ),
            ),
            Expanded(
              flex: 2,
              child: AppTexts.smallText(
                text: ':',
              ),
            ),
          ],
        ),
      ),


      8.horizontalSpace,
      Expanded(
        flex: 3,
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingHorizontal24, vertical: Dimensions.paddingVertical6),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius8),
              border: Border.all(color: colorCode, width: 1),
              color: colorCode.withOpacity(0.1)
          ),
          child: AppTexts.smallText(text: value, color: colorCode),
        ),
      ),
    ],
  );
}