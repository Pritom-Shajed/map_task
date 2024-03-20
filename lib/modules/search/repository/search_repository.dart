import 'package:get/get.dart';
import 'package:task/data/api/api_client.dart';
import 'package:task/helper/environment/environment.dart';
import 'package:task/utils/constants/constants.dart';

class SearchRepository {
  final ApiClient apiClient;
  SearchRepository({required this.apiClient});


  Future<Response> autocompleteApi ({required String query, String? city, bool? bangla}) async{
    return await apiClient.getData(ApiEndPoints.autocomplete(apiKey: Environment.apiKey, query: query, city: city, bangla: bangla));

  }
}