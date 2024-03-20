import 'package:get/get.dart';
import 'package:task/modules/search/models/autocomplete_model.dart';
import 'package:task/storage/repository/storage_repository.dart';

class StorageController extends GetxController {
  final StorageRepository storageRepository;

  StorageController({required this.storageRepository});



  Future<void> savePlace ({required AutocompleteData place}) async{
    await storageRepository.savePlace(place: place);
  }

  Future<void> removePlace ({required int index}) async{
    await storageRepository.removePlace(index: index);
  }

  Future<List<AutocompleteData>> getSavedPlaced () async{
    return await storageRepository.getPlaces();
  }

  void clearData ()  {
     storageRepository.clearData();
  }
}