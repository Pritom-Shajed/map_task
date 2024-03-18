import 'package:shared_preferences/shared_preferences.dart';
import 'package:task/data/api/api_client.dart';
import 'package:task/utils/constants/constants.dart';

class StorageRepository {
  SharedPreferences sharedPreferences;
  ApiClient apiClient;
  StorageRepository({required this.sharedPreferences, required this.apiClient});



  bool clearData() {
    return true;
  }
}