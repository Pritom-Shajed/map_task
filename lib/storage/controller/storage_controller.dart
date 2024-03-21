import 'package:get/get.dart';
import 'package:task/modules/search/models/autocomplete_model.dart';
import 'package:task/storage/storage.dart';

class StorageController extends GetxController {
  final StorageRepository storageRepository;

  StorageController({required this.storageRepository});

  final RxList<AutocompleteData> savedPlaces = <AutocompleteData>[].obs;

  Future<void> savePlace ({required AutocompleteData place}) async{
    await storageRepository.savePlace(place: place);
  }

  Future<void> removePlace ({required int index}) async{
    await storageRepository.removePlace(index: index);
  }

  Future<void> getSavedPlaced () async{
    var places = await storageRepository.getPlaces();
    savedPlaces.assignAll(places);
  }

  void clearData ()  {
     storageRepository.clearData();
  }
}