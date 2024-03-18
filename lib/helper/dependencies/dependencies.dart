import 'package:get/get.dart';
import 'package:task/data/api/api_client.dart';
import 'package:task/helper/environment/environment.dart';
import 'package:task/storage/controller/storage_controller.dart';
import 'package:task/storage/repository/storage_repository.dart';

Future<void> init () async{
  Get.lazyPut(() => ApiClient(appBaseUrl: Environment.baseApiUrl, sharedPreferences: Get.find()), fenix: true);

  Get.lazyPut(() => StorageRepository(sharedPreferences:  Get.find(), apiClient: Get.find()), fenix: true);
  Get.lazyPut(() => StorageController(storageRepository:  Get.find()), fenix: true);

}