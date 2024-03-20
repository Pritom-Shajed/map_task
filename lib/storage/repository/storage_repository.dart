import 'dart:convert';
import 'dart:developer';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task/modules/search/models/autocomplete_model.dart';
import 'package:task/utils/constants/storage_constants/storage_constants.dart';

class StorageRepository {
  SharedPreferences sharedPreferences;
  StorageRepository({required this.sharedPreferences});



  Future<void> savePlace ({required AutocompleteData place}) async {
    List<String> placesJson = sharedPreferences.getStringList(StorageConstants.SAVED_PLACE) ?? [];
    placesJson.add(jsonEncode(place.toJson()));
    await sharedPreferences.setStringList(StorageConstants.SAVED_PLACE, placesJson);
  }

  Future<void> removePlace ({required int index}) async {
    List<String> placesJson = sharedPreferences.getStringList(StorageConstants.SAVED_PLACE) ?? [];
    placesJson.removeAt(index);
    await sharedPreferences.setStringList(StorageConstants.SAVED_PLACE, placesJson);
  }

  Future<List<AutocompleteData>> getPlaces() async {
    List<String>? placesJson = sharedPreferences.getStringList(StorageConstants.SAVED_PLACE);
    List<AutocompleteData> places = [];
    if (placesJson != null) {
      for (String placeJson in placesJson) {
        try {
          final Map<String, dynamic> parsed = jsonDecode(placeJson);
          places.add(AutocompleteData.fromJson(parsed));
        } catch (e) {
          log('Error decoding JSON: $placeJson');
          throw Exception(e.toString());
        }
      }
    }
    return places;
  }


  bool clearData() {
    sharedPreferences.clear();
    return true;
  }
}