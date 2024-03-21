import 'dart:developer';
import 'package:geolocator/geolocator.dart';

class LocationRepository {

  Future<Position?>  getCurrentLocation () async{
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if(!serviceEnabled){
      log('Location service is disabled');
      return null;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if(permission == LocationPermission.denied){
      permission = await Geolocator.requestPermission();
      if(permission == LocationPermission.denied){
        log('Location permissions are denied');
        return null;
      }
    }

    if(permission == LocationPermission.deniedForever){
      log('Location permissions are permanently denied');
      return null;
    }

    return await Geolocator.getCurrentPosition();
  }
}