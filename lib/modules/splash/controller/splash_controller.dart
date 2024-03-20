import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:task/routes/app_pages.dart';

class SplashController extends GetxController {


  Future<Position>  _getCurrentLocation () async{
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if(!serviceEnabled){
      return Future.error('Location service is disabled');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if(permission == LocationPermission.denied){
      permission = await Geolocator.requestPermission();
      if(permission == LocationPermission.denied){
        return Future.error('Location permissions are denied');
      }
    }

    if(permission == LocationPermission.deniedForever){
      return Future.error('Location permissions are permanently denied');
    }
    return await Geolocator.getCurrentPosition();
  }

  @override
  void onReady() async {
    super.onReady();
    await Future.delayed(const Duration(seconds: 1));
    _getCurrentLocation().then((position) =>   Get.toNamed(Routes.HOME));
  }
}