import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:task/location/repository/location_repository.dart';

class LocationController extends GetxController {
  final LocationRepository locationRepo;

  LocationController({required this.locationRepo});

  Future<Position?> getCurrentLocation() async {
    return await locationRepo.getCurrentLocation();
  }
}
