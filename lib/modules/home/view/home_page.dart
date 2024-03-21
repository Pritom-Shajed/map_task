import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:maplibre_gl/maplibre_gl.dart';
import 'package:task/components/global_widgets/global_widgets.dart';
import 'package:task/location/controller/location_controller.dart';
import 'package:task/modules/home/controller/home_controller.dart';
import 'package:task/modules/home/models/home_quick_action_model.dart';
import 'package:task/modules/home/widgets/home_widgets.dart';
import 'package:task/routes/routes.dart';
import 'package:task/storage/controller/storage_controller.dart';
import 'package:task/utils/constants/constants.dart';
import 'package:task/utils/strings.dart';

class HomePage extends StatefulWidget {
   const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _storageController = Get.find<StorageController>();

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      body: SafeArea(child: GetBuilder<HomeController>(
        builder: (controller) {
          return Stack(
            children: [

              //BODY
              controller.pageIndex == 0 ? _mapPage(context, controller) : _savedPage(controller),



              //NAVIGATION BAR
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: HomeWidgets.bottomNavBar(onTap:(index) {
                  controller.updatePageIndex(index);
                  if(index == 1){
                    _storageController.getSavedPlaced();
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

Widget _mapPage (BuildContext context,HomeController controller){
  return Stack(children: [

    //MAP
    SizedBox(
      height: double.maxFinite,
      width: double.maxFinite,
      child: MaplibreMap(
        initialCameraPosition: controller.initialCameraPosition,
        onMapCreated: (MaplibreMapController mapController){
          controller.mController=mapController;
        },
        styleString: controller.mapUrl ,
        onStyleLoadedCallback: (){
          controller.addImageFromAsset("custom-marker", AppPngIcons.mapMarker).then((value) { controller.mController?.addSymbol(controller.symbolOptions);});
        },
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
            AppLoaders.showOverlayLoader(context);
            Get.find<LocationController>().getCurrentLocation().then((position) => {
              AppLoaders.hideOverlayLoader(context),
              if(position != null){
                controller.updateMapSymbolPosition(LatLng(position.latitude, position.longitude))
              } else {
                AppToasts.shortToast(Strings.turnOnLocation)
              }
            });

          },
          backgroundColor: AppColors.white,
          child: SvgIcon(iconPath: AppSvgIcons.location),
        )),
  ],);
}

Widget _savedPage(HomeController controller) {
  final storageController = Get.find<StorageController>();
  return Container(
    padding: EdgeInsets.all(10.w),
    width: double.maxFinite,
    height: double.maxFinite,
    child: Obx(() {
        return storageController.savedPlaces.isEmpty ? Center(child: AppTexts.smallText(text: Strings.noSavedPlaces)) : ListView.separated(
            separatorBuilder: (context, index) => 6.verticalSpace,
            itemCount: storageController.savedPlaces.length,
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              var placeInfo = storageController.savedPlaces[index];
              return AppButtons.placeBtn(address: placeInfo.address, onTap: (){
                controller.updatePageIndex(0);
                controller.updateMapSymbolPosition(LatLng(double.parse(placeInfo.latitude), double.parse(placeInfo.longitude)));
                AppBottomSheets.placeInfo(context,
                  placeInfo: placeInfo,
                  isSaved: true,
                  onTapSave: () {
                  Get.back();
                  storageController.removePlace(index: index);
                  storageController.getSavedPlaced();
                  },
                );

              });
            });
      }
    ),
  );
}