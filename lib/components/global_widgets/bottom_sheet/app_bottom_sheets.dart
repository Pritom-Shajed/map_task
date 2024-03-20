import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/components/global_widgets/global_widgets.dart';
import 'package:task/modules/search/search.dart';
import 'package:task/utils/constants/constants.dart';
import 'package:task/utils/styles/styles.dart';

class AppBottomSheets {
  AppBottomSheets._();

  static void placeInfo (BuildContext context, {VoidCallback? onTapSave, bool isSaved = false, required AutocompleteData placeInfo}){
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      //TITLE
                      Row(
                        children: [
                          Expanded(child: AppTexts.largeText(text: placeInfo.address.split(',')[0])),

                          AppButtons.roundedIconBtn(iconPath: AppSvgIcons.save, iconColor: isSaved ? AppColors.red : AppColors.baseColor, onTap: onTapSave)
                        ],
                      ),

                      //DESCRIPTION
                      8.verticalSpace,
                      AppTexts.smallText(text: placeInfo.address),
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
                          AppTexts.smallText(text: '${placeInfo.latitude}"N, ${placeInfo.longitude}"E')
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
                      _bottomSheetCodeContainer(title: 'Place Code', value: placeInfo.uCode, colorCode: AppColors.placeCodeColor),
                      14.verticalSpace,
                      _bottomSheetCodeContainer(title: 'District', value: placeInfo.district, colorCode: AppColors.districtColor),
                      14.verticalSpace,
                      _bottomSheetCodeContainer(title: 'Post Code', value: '${placeInfo.postCode}', colorCode: AppColors.postCodeColor),
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
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