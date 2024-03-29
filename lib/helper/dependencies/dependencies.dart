import 'package:get/get.dart';
import 'package:task/data/api/api_client.dart';
import 'package:task/helper/environment/environment.dart';
import 'package:task/location/location.dart';
import 'package:task/storage/controller/storage_controller.dart';
import 'package:task/storage/repository/storage_repository.dart';

Future<void> init () async{
  Get.lazyPut(() => ApiClient(appBaseUrl: Environment.baseApiUrl, sharedPreferences: Get.find()), fenix: true);

  Get.lazyPut(() => StorageRepository(sharedPreferences:  Get.find()), fenix: true);
  Get.lazyPut(() => StorageController(storageRepo:  Get.find()), fenix: true);

  Get.lazyPut(() => LocationRepository(), fenix: true);
  Get.lazyPut(() => LocationController(locationRepo:  Get.find()), fenix: true);
}