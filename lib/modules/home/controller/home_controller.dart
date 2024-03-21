import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:maplibre_gl/maplibre_gl.dart';
import 'package:task/helper/environment/environment.dart';

class HomeController extends GetxController {

  final String mapUrl = Environment.mapUrl+Environment.apiKey;

  final _pageIndex = 0.obs;

  get pageIndex => _pageIndex.value;

  set pageIndex (value) => _pageIndex.value = value;

  void updatePageIndex(index){
    pageIndex = index;
    update();
  }

  MaplibreMapController? mController;

  Future<void> addImageFromAsset(String name, String assetName) async {
    final ByteData bytes = await rootBundle.load(assetName);
    final Uint8List list = bytes.buffer.asUint8List();
    return mController!.addImage(name, list);
  }


  Position? userPosition = Get.arguments;

  late SymbolOptions symbolOptions;

  late CameraPosition initialCameraPosition;

  @override
  void onInit() {
    initialCameraPosition = CameraPosition(target: userPosition != null ? LatLng(userPosition!.latitude, userPosition!.longitude) : const LatLng(23.835677, 90.380325), zoom: 12);
    symbolOptions = SymbolOptions(
      geometry: userPosition != null ? LatLng(userPosition!.latitude, userPosition!.longitude) : const LatLng(23.835677, 90.380325),
      iconImage: 'custom-marker',
      iconSize: .2,
    );
    super.onInit();
  }

  updateMapSymbolPosition (LatLng latLng) {
    mController?.clearSymbols();
    initialCameraPosition = CameraPosition(target: latLng, zoom: 12);
    symbolOptions =  SymbolOptions(
      geometry: latLng,
      iconImage: 'custom-marker',
      iconSize: .2,
    );
    mController?.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: latLng, zoom: 12)));
    mController?.addSymbol(symbolOptions);
  }



}