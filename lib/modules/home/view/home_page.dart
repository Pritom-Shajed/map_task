import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task/components/global_widgets/global_widgets.dart';
import 'package:task/modules/home/models/home_quick_action_model.dart';
import 'package:task/modules/home/widgets/home_widgets.dart';
import 'package:task/routes/routes.dart';
import 'package:task/utils/constants/constants.dart';
import 'package:task/utils/styles/styles.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      body: SafeArea(child: Stack(
        children: [

          //MAP
          Container(
            height: double.maxFinite,
            width: double.maxFinite,
            color: Colors.grey.shade300,
          ),

          //BODY
          Column(
            children: [
              HomeWidgets.searchBar(onTapSearch: () => Get.toNamed(Routes.SEARCH)),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                  children: List.generate(QuickActionItem.items.length, (index) {
                    return HomeWidgets.quickActionBtn(title: QuickActionItem.items[index].title, iconPath: QuickActionItem.items[index].iconPath);
                  }),
                ),
              ),


            ],
          ),

          Positioned(
              bottom: 120,
              right: 30,
              child: FloatingActionButton(
                onPressed: () {
                  HomeWidgets.bottomSheet(context, title: 'Rack and Break Billiard', description: 'Rack and Break Billiard House 2/6, Begum Rokeya Sarani, Pallabi, Mirpur, Dhaka', cord: '23°49\'26.1"N, 90°21\'50.6\"E');
                },
                backgroundColor: AppColors.white,
                child: SvgIcon(iconPath: AppSvgIcons.location),
              )),

          //NAVIGATION BAR
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: HomeWidgets.bottomNavBar(onTap: (index){
              log('selected index: $index');
            }),
          )
        ],
      )),
    );
  }
}
