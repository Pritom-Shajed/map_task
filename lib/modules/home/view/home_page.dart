import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:maplibre_gl/maplibre_gl.dart';
import 'package:task/components/global_widgets/global_widgets.dart';
import 'package:task/modules/home/controller/home_controller.dart';
import 'package:task/modules/home/models/home_quick_action_model.dart';
import 'package:task/modules/home/widgets/home_widgets.dart';
import 'package:task/modules/search/models/autocomplete_model.dart';
import 'package:task/routes/routes.dart';
import 'package:task/storage/controller/storage_controller.dart';
import 'package:task/utils/constants/constants.dart';

class HomePage extends StatefulWidget {
   const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  MaplibreMapController? mController;

  late LatLng _initalLatLon;

  final _controller = Get.find<HomeController>();
  final _storageController = Get.find<StorageController>();

  final CameraPosition mapInitialPosition = const CameraPosition(target: LatLng(23.835677, 90.380325), zoom: 12);

  Future<void> addImageFromAsset(String name, String assetName) async {
    final ByteData bytes = await rootBundle.load(assetName);
    final Uint8List list = bytes.buffer.asUint8List();
    return mController!.addImage(name, list);
  }

  AutocompleteData? placeInfo = Get.arguments;

  List<AutocompleteData> _savedPlaces = [];

  // @override
  // void initState() {
  //   log('lat: ${placeInfo?.latitude} lon: ${placeInfo?.longitude}');
  //   if(placeInfo == null){
  //     _initalLatLon = LatLng(23.835677, 90.380325);
  //   } else {
  //     _initalLatLon = LatLng(placeInfo!.latitude, placeInfo!.longitude);
  //   }
  //
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      body: SafeArea(child: GetBuilder<HomeController>(
        builder: (controller) {
          return Stack(
            children: [

              controller.pageIndex == 0 ? Stack(children: [
                //MAP
                // SizedBox(
                //   height: double.maxFinite,
                //   width: double.maxFinite,
                //   child: MaplibreMap(
                //     initialCameraPosition: mapInitialPosition,
                //     onMapCreated: (MaplibreMapController mapController){
                //       mController= mapController;
                //     },
                //     styleString: _controller.mapUrl ,
                //     onStyleLoadedCallback: (){
                //       // Create SymbolOption for creating a symbol in map
                //       SymbolOptions symbolOptions =  SymbolOptions(
                //         geometry: _initalLatLon, // location of the symbol, required
                //         iconImage: 'custom-marker',   // icon image of the symbol
                //         iconSize: .2, // size of the icon in ratio of the actual size, optional
                //       );
                //       addImageFromAsset("custom-marker", AppPngIcons.mapMarker).then((value) { mController?.addSymbol(symbolOptions);});
                //     },
                //   ),
                // ),

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

                      },
                      backgroundColor: AppColors.white,
                      child: SvgIcon(iconPath: AppSvgIcons.location),
                    )),
              ],) : _savedPage(places: _savedPlaces),



              //NAVIGATION BAR
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: HomeWidgets.bottomNavBar(onTap:(index) async{
                  // _storageController.clearData();
                  controller.updatePageIndex(index);
                  if(index == 1){
                   final List<AutocompleteData> places = await  _storageController.getSavedPlaced();
                   _savedPlaces = places;

                   log('places: ${places.length}');
                   setState(() {

                   });
                  }
                }),
              )
            ],
          );
        }
      )),
    );
  }
}

Widget _savedPage({required List<AutocompleteData> places}) {
  return Container(
    padding: EdgeInsets.all(10.w),
    width: double.maxFinite,
    height: double.maxFinite,
    child: ListView.separated(
        separatorBuilder: (context, index) => 6.verticalSpace,
        itemCount: places.length,
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          var placeInfo = places[index];
          return AppButtons.placeBtn(address: placeInfo.address, onTap: (){
            Get.offNamed(Routes.HOME);
            AppBottomSheets.placeInfo(context,
              placeInfo: placeInfo,
              isSaved: true,
              onTapSave: () {
              Get.back();
              Get.find<StorageController>().removePlace(index: index);
              },
            );

          });
        }),
  );
}