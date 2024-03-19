import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maplibre_gl/maplibre_gl.dart';
import 'package:task/components/global_widgets/global_widgets.dart';
import 'package:task/helper/environment/environment.dart';
import 'package:task/modules/home/models/home_quick_action_model.dart';
import 'package:task/modules/home/widgets/home_widgets.dart';
import 'package:task/routes/routes.dart';
import 'package:task/utils/constants/constants.dart';

class HomePage extends StatefulWidget {
   const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  CameraPosition initialPosition= const CameraPosition(target: LatLng(23.835677, 90.380325), zoom: 12);   //CameraPosition object for initial location in map
  MaplibreMapController? mController;

  static const styleId = 'osm-liberty' ;    //barikoi map style id
  static String apiKey = Environment.apiKey;   //barikoi API key, get it from https://developer.barikoi.com
  static String mapUrl= 'https://map.barikoi.com/styles/$styleId/style.json?key=$apiKey';

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      body: SafeArea(child: Stack(
        children: [

          //MAP
          SizedBox(
            height: double.maxFinite,
            width: double.maxFinite,
            child: MaplibreMap(

              initialCameraPosition: initialPosition,   // set map initial location where map will show first
              onMapCreated: (MaplibreMapController mapController){  //called when map object is created
                mController= mapController;   // use the MaplibreMapController for map operations
              },
              styleString: mapUrl , // barikoi map style url
            ),
          ),

          //BODY
          Column(
            children: [
              HomeWidgets.searchBar(onTapSearch: () =>  Get.toNamed(Routes.SEARCH)),
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
            child: HomeWidgets.bottomNavBar(onTap: (index){}),
          )
        ],
      )),
    );
  }
}
