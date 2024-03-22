import 'package:get/get.dart';
import 'package:task/modules/search/models/autocomplete_model.dart';
import 'package:task/storage/storage.dart';

class StorageController extends GetxController {
  final StorageRepository _storageRepo;

  StorageController({required StorageRepository storageRepo}) : _storageRepo = storageRepo;

  final RxList<AutocompleteData> savedPlaces = <AutocompleteData>[].obs;

  Future<void> savePlace ({required AutocompleteData place}) async{
    await _storageRepo.savePlace(place: place);
  }

  Future<void> removePlace ({required int index}) async{
    await _storageRepo.removePlace(index: index);
  }

  Future<void> getSavedPlaced () async{
    var places = await _storageRepo.getPlaces();
    savedPlaces.assignAll(places);
  }

  void clearData ()  {
    _storageRepo.clearData();
  }
}